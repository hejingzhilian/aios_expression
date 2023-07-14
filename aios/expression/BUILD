load('//bazel:defs.bzl', 'genlex', 'genyacc')
genlex(name='scanner', src='expression/syntax/Scanner.ll')
genyacc(name='parser', src='expression/syntax/BisonParser.yy')

cc_library(
    name='expression',
    srcs=(
        glob([
            'expression/common/*.cpp', 'expression/framework/*.cpp',
            'expression/function/*.cpp', 'expression/plugin/*.cpp',
            'expression/syntax/*.cpp', 'expression/util/*.cpp'
        ]) + [':scanner', ':parser_srcs']
    ),
    hdrs=glob([
        'expression/*.h', 'expression/common/*.h', 'expression/framework/*.h',
        'expression/function/*.h', 'expression/plugin/*.h',
        'expression/syntax/*.h', 'expression/util/*.h'
    ]),
    copts=['-Wno-register', '-Werror'],
    include_prefix='expression',
    strip_include_prefix='expression',
    visibility=['//visibility:public'],
    deps=[
        ':parser_hdrs', '//aios/autil:NoCopyable', '//aios/matchdoc',
        '//aios/resource_reader:resource_reader', '@rapidjson',
        '//aios/autil:json'
    ]
)


cc_library(
    name='expression_syntax',
    srcs=(
        [
            'expression/syntax/SyntaxParser.cpp',#, 'expression/util/*.cpp'
            'expression/syntax/SyntaxExpr.cpp',
            'expression/syntax/ConstSyntaxExpr.cpp',
            'expression/syntax/FuncSyntaxExpr.cpp'
        ] + [':scanner', ':parser_srcs']
    ),
    hdrs=glob([
        'expression/common.h',#'expression/common/*.h',# 'expression/framework/*.h',
       # 'expression/function/*.h', 'expression/plugin/*.h',
        'expression/syntax/SyntaxParser.h',
        'expression/syntax/SyntaxExpr.h',
        'expression/syntax/ConstSyntaxExpr.h',
        'expression/syntax/Scanner.h',
        'expression/syntax/AttributeSyntaxExpr.h',
        'expression/syntax/SyntaxFactory.h',
        'expression/syntax/SyntaxExprVisitor.h',
        'expression/syntax/BinarySyntaxExpr.h',
        'expression/util/SyntaxStringConvertor.h',
        'expression/syntax/FuncSyntaxExpr.h',
    ]),
    copts=['-Wno-register', '-Werror'],
    include_prefix='expression',
    strip_include_prefix='expression',
    visibility=['//visibility:public'],
    deps=[
        ':parser_hdrs', '//aios/autil:NoCopyable', '//aios/autil:log', '//aios/autil:data_buffer','@rapidjson' #'//aios/matchdoc',
        #'//aios/resource_reader', '@rapidjson'
    ]
)


