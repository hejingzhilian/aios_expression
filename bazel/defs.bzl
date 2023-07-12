# The 0th src of genlex must be the lexer input.
def genlex(name, src, lexflags=" -8 -Cfa"):
    vec = src.split("/")
    file_name = vec[-1]
    path = src[0:len(src) - len(file_name)]
    new_file_name = file_name[0:-3] + ".cc"
    cmd = "flex %s -o $(@D)/%s $(location %s) " % (lexflags, new_file_name, src)
    native.genrule(
        name = name,
        outs = [new_file_name],
        srcs = [src],
        cmd = cmd,
        visibility = ["//visibility:public"],
    )

def genyacc(name, src, hh_files = ["location.hh", "position.hh", "stack.hh"], path=""):
    vec = src.split("/")
    file_name = vec[-1]
    path = path if len(path) != 0 else src[0:len(src) - len(file_name)]
    if path and not path.endswith("/"):
        path += "/"
    class_name = file_name[0:-3]
    new_file_name = path + class_name + ".cc"
    # bison 3.2+ supported
    opt = "" if "location.hh" in hh_files else "-Dapi.location.file=none"
    cmd = ""
    if path:
        cmd += "mkdir -p %s &&" % path
    cmd += "bison -o $(@D)/%s $(location %s) %s && sed 's/include \"%s/include \"%s%s/' $(@D)/%s -i" % (new_file_name, src, opt, class_name, path.replace("/", "\\/"), class_name, new_file_name)
    hdrs = [class_name + ".hh"] + hh_files
    hdrs = [path + hh for hh in hdrs]
    native.genrule(
        name = name,
        outs = [new_file_name] + hdrs,
        srcs = [src],
        cmd = cmd,
        visibility = ["//visibility:public"],
    )
    native.filegroup(
        name = name + "_srcs",
        srcs = [new_file_name]
    )
    native.filegroup(
        name = name + "_hdrs_tmp",
        srcs = hdrs
    )
    native.cc_library(
        name = name + "_hdrs",
        hdrs = [name + "_hdrs_tmp"],
        visibility = ["//visibility:public"],
        strip_include_prefix = path,
        include_prefix = path,
    )


