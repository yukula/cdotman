# cdotman_target_set_property(<target> PROPERTY <property> [APPEND] <value>)
function(cdotman_set_target_property target)
    set(prefix arg)
    set(option APPEND)
    set(singleKword PROPERTY)
    cmake_parse_arguments(${prefix}
                          ${option}
                          ${singleKword}
                          ""
                          ${ARGN})
    list(LENGTH ${prefix}_UNPARSED_ARGUMENTS unparsed_length)
    if(NOT target)
        cdotman_trace_error("Required argument <target> wasn't specified")
    endif()
    if(NOT ${prefix}_PROPERTY)
        cdotman_trace_error("Required argument <property> wasn't specified")
    endif()
    if(NOT ${prefix}_UNPARSED_ARGUMENTS)
        cdotman_trace_error("Required argument <value> wasn't specified")
    endif()

    string(TOUPPER ${target} target)
    
    cdotman_is_target_exist(is_target_exist ${target})
    if(NOT ${is_target_exist})
        cdotman_trace_error("<target> \"${target}\" does not exist")
    endif()

    set(prop_prefix CDOTMAN_TARGET)
    set(prop_value ${${prefix}_UNPARSED_ARGUMENTS})
    set(prop ${${prefix}_PROPERTY})
    
    if(${${prefix}_APPEND})
        set_property(GLOBAL APPEND PROPERTY ${prop_prefix}_${target}_${prop} ${prop_value})
    else()
        set_property(GLOBAL PROPERTY ${prop_prefix}_${target}_${prop} ${prop_value})
    endif()
    
    cdotman_get_target_property(new_prop ${target} ${prop})
    cdotman_trace_debug("set_target_property: ${prop_prefix}_${target}_${prop} was updated to: ${new_prop}")

endfunction()
