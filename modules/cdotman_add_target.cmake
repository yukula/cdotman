# cdotman_add_target(<target> <sources>...)
function(cdotman_add_target target)
    set(pref ARG) 
    cmake_parse_arguments(${pref} "" "" "" ${ARGN})

    if(NOT ARG_UNPARSED_ARGUMENTS)
        cdotman_trace_error("Required argument <sources> wasn't specified")
    endif()

    cdotman_is_target_exist(is_target_exist ${target})
    if(is_target_exist)
        cdotman_trace_error("Target \"${target}\" already exists")
    endif()

    cdotman_init_target(${target})

    foreach(src IN LISTS ${pref}_UNPARSED_ARGUMENTS)
        get_filename_component(src_abs ${src} ABSOLUTE)
        if(NOT EXISTS ${src_abs})
            cdotman_trace_error("File \"${src_abs}\" specified as source does not exist")
        else()
            cdotman_set_target_property(${target} PROPERTY SOURCES APPEND ${src_abs})
        endif()
    endforeach()
    

endfunction()
