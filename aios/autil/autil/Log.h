#pragma once

#include <iostream>
#include <string>

#define AUTIL_LOG_DECLARE() static std::string log_info

#define AUTIL_LOG_SETUP(n, c) std::string c::log_info = #n "." #c

#define AUTIL_LOG(level, format, args...) { \
    char format_str[180] = { 0 }; \
    snprintf(format_str, sizeof(format_str) - 1, format, ##args); \
    std::cout << ""#level << ":" << log_info << " " << format_str; \
}

#define AUTIL_DECLARE_AND_SETUP_LOGGER(n, c) static std::string log_info = #n "." #c
