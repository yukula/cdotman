# cdotman_is_target_exist(<out_var> <target_name>)
function(cdotman_is_target_exist out_var target_name)
    set(res FALSE)
    if(NOT ARGC EQUAL 2)
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    string(TOUPPER ${target_name} target_name)

    cdotman_get_targets(targets)
    list(FIND targets ${target_name} is_target_exist)
    if(NOT is_target_exist EQUAL -1)
        set(res TRUE)
    endif()

    set(${out_var} ${res} PARENT_SCOPE)

endfunction()
