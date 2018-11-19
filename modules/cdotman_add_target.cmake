# cdotman_add_target(<target> <sources>... [INCLUDE] <extra_cmake>)
function(cdotman_add_target target)
    set(pref ARG) 
    set(single_kwarg INCLUDE)
    cmake_parse_arguments(${pref} "" "${single_kwarg}" "" ${ARGN})

    if(NOT ARG_UNPARSED_ARGUMENTS)
        cdotman_trace_error("Required argument <sources> wasn't specified")
    endif()

    cdotman_is_target_exist(is_target_exist ${target})
    if(is_target_exist)
        cdotman_trace_error("Target \"${target}\" already exists")
    endif()

    if(ARG_INCLUDE)
        get_filename_component(include_path ${ARG_INCLUDE} ABSOLUTE)
        if(NOT EXISTS ${include_path})
            cdotman_trace_error("File \"${include_path}\" does not exist")
        endif()
    endif()

    cdotman_init_target(${target})
    cdotman_set_target_property(${target} PROPERTY SOURCES ${ARG_UNPARSED_ARGUMENTS})

    if(ARG_INCLUDE)
        include(${include_path})
        cdotman_trace_debug("cdotman_add_target: file \"${ARG_INCLUDE}\" was included")
    endif()

endfunction()
