function(cdotman_symlink_create target source)
    if(NOT ARGC EQUAL 2 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()

    cdotman_is_symlink(is_target_symlink ${target})
    if(NOT ${is_target_symlink})
        cdotman_trace_error("target \"${target}\" is not a symlink")
    endif()

    cdotman_symlink_to(target_abs ${target})
    if(NOT IS_ABSOLUTE ${source})
        cdotman_trace_error("source \"${source}\" is not an absolute")
    endif()
    get_filename_component(source_abs ${source} ABSOLUTE)

    # linux only
    execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink
                    ${target_abs}
                    ${source_abs} )

endfunction()
