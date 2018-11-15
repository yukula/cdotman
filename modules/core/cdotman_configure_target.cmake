# cdotman_configure_target(<target>)
function(cdotman_configure_target target)
    if(NOT ARGC EQUAL 1 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    string(TOUPPER ${target} target)

    cdotman_is_target_exist(is_target_exist ${target})
    if(NOT is_target_exist)
        cdotman_trace_error("<target> \"${target} does not exist\"")
    endif()

    cdotman_get_target_property(src_list ${target} SOURCES)
    foreach(src IN LISTS src_list)
        get_filename_component(src ${src} ABSOLUTE)

        cdotman_is_template(is_template ${src})
        if(is_template)
            cdotman_get_target_filename(target_file ${src})
            if(NOT target_file)
                cdotman_trace_error("target_fname is empty")
            endif()
            configure_file(${src} ${target_file} @ONLY)

            # an update of target sources
            set(src_list_tmp ${src_list})
            list(REMOVE_ITEM src_list_tmp ${src})
            list(APPEND src_list_tmp ${target_file})
            cdotman_set_target_property(${target} PROPERTY SOURCES ${src_list_tmp})
        endif()
    endforeach()
    
endfunction()
