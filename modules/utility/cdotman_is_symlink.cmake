function(cdotman_is_symlink out_var symlink_path)
    set(result FALSE)
    if(NOT ARGC EQUAL 2 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    get_filename_component(symlink_path ${symlink_path} ABSOLUTE)

    if(NOT EXISTS ${symlink_path})
        set(error_msg "symlink_path \"${symlink_path}\" doesn't exist")
        cdotman_trace_warning(${error_msg})
    endif()


    if(IS_SYMLINK ${symlink_path})
        set(result TRUE)
    endif()
    set( ${out_var} ${result} PARENT_SCOPE)
    
endfunction()
