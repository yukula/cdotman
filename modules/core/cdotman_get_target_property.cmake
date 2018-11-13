# cdotman_get_target_property(<out_var> <target> <property>)
function(cdotman_get_target_property out_var target property)
    if(NOT ARGC EQUAL 3)
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    string(TOUPPER ${target} target)
    
    cdotman_is_target_exist(is_target_exist ${target})
    if(NOT ${is_target_exist})
        cdotman_trace_error("<target> \"${target}\" is not exist")
    endif()

    set(prop_prefix CDOTMAN_TARGET)
    get_property(prop_value GLOBAL PROPERTY ${prop_prefix}_${target}_${property})
    
    set(${out_var} ${prop_value} PARENT_SCOPE)
endfunction()
