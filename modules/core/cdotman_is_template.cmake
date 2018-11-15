# cdotman_is_template(<out_var> <file_path>)
function(cdotman_is_template out_var file_path)
    set(res FALSE)
    if(NOT ARGC EQUAL 2 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()

    if(NOT IS_ABSOLUTE ${file_path})
        cdotman_trace_error("<file_path> \"${file_path}\" is not an absolute")
    endif()

    get_filename_component(file_path_abs ${file_path} ABSOLUTE)
    if(NOT EXISTS ${file_path_abs})
        cdotman_trace_error("file \"${file_path_abs}\" doesn't exist")
    endif()

    get_filename_component(extn ${file_path_abs} EXT)
    if(${extn} MATCHES ".*.in$")
        set(res TRUE)
    endif()

    set(${out_var} ${res} PARENT_SCOPE)
    
endfunction()