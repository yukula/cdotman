function(cdotman_track_file file)
    if(NOT ARGC EQUAL 1 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    get_filename_component(file ${file} ABSOLUTE)
    if(NOT EXISTS ${file})
        set(error_msg "file \"${file}\" doesn't exist")
        cdotman_trace_error(${error_msg})
    endif()
    
    set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "/home/jaffee/config/test.cpp")
    get_property(track_list DIRECTORY PROPERTY CMAKE_CONFIGURE_DEPENDS)

    cdotman_trace_info("${track_list}")

endfunction()
