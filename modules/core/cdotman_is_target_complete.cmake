# cdotman_is_target_complete(<out_var> <target>)
function(cdotman_is_target_complete out_var target)
    cdotman_is_target_exist(is_target_exist ${target}) 
    if(NOT is_target_exist)
        cdotman_get_targets(known_targets)
        cdotman_list_to_str(known_targets_str "," "${known_targets}")
        cdotman_trace_error("Target \"${targets}\" does not exist; -- Registered targets: ${known_targets_str}")
    endif()

    cdotman_get_target_property(sources ${target} SOURCES)
    cdotman_get_target_property(dest ${target} DESTINATION)
    cdotman_get_target_property(type ${target} TYPE)

    set(result TRUE)
    if(NOT sources
       OR NOT dest
       OR NOT type)
        set(result FALSE)
    endif()

    set(${out_var} ${result} PARENT_SCOPE)
endfunction()
