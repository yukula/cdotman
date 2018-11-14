# cdotman_get_target_properties(<out_var> <target>)
function(cdotman_get_target_properties out_var target)
    if(NOT ARGC EQUAL 2)
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    string(TOUPPER ${target} target)

    cdotman_is_target_exist(is_target_exist ${target})  
    if(NOT ${is_target_exist})
        cdotman_trace_error("<target> ${target} is not exist")
    endif()

    cdotman_get_target_property(src ${target} SOURCES)
    cdotman_get_target_property(dest ${target} DESTINATION)
    cdotman_get_target_property(type ${target} TYPE)

    set(prefix CDOTMAN_TARGET)

    list(APPEND props "${prefix}_${target}_SOURCES: ${src}")
    list(APPEND props "${prefix}_${target}_DESTINATION: ${dest}")
    list(APPEND props "${prefix}_${target}_TYPE: ${type}")

    set(${out_var} ${props} PARENT_SCOPE)
endfunction()
