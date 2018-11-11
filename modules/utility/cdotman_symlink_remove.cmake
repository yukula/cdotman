function(cdotman_symlink_remove target)
    if(NOT ARGC EQUAL 1 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()

    if(NOT IS_ABSOLUTE ${target})
       cdotman_trace_error("target \"${target}\" is not an absolute") 
    endif()
    get_filename_component(target_abs ${target} ABSOLUTE)

    if(NOT EXISTS ${target_abs})
        cdotman_trace_error("file \"${target_abs}\" doesn't exist")
    endif()

    cdotman_is_symlink(is_target_symlink ${target_abs})
    if(NOT ${is_target_symlink})
        cdotman_trace_error("file \"${target_abs}\" is not a symlink")
    endif()

    file(REMOVE ${target_abs})
    
endfunction()