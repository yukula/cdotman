# create build stage scenario of target installation
# cdotman_make_build_target(<target>)
function(cdotman_make_build_target target)
    cdotman_is_target_exist(is_target_exist ${target})
    if(NOT is_target_exist)
        cdotman_get_targets(known_targets)
        cdotman_list_to_str(known_targets_str "," "${known_targets}")
        cdotman_trace_error("Target \"${targets}\" does not exist; -- Registered targets: ${known_targets_str}")
    endif()

    cdotman_is_target_complete(is_target_complete ${target})
    if(NOT is_target_complete)
        cdotman_get_target_properties(props ${target})
        string(APPEND error_str "Target \"${target} is not complete;\"")
        foreach(prop IN LISTS ${props})
            string(APPEND error_str "\n${prop}")
        endforeach()
        cdotman_trace_error("${error_str}") 
    endif()

    cdotman_get_target_property(target_type ${target} TYPE)
    cdotman_get_target_property(target_dest ${target} DESTINATION)
    cdotman_get_target_property(target_sources ${target} SOURCES)
    if(NOT TARGET CDOTMAN_TARGET_${target})
        add_custom_target(CDOTMAN_TARGET_${target})
    endif()
    if("${target_type}" STREQUAL "COPY")
        foreach(src IN LISTS target_sources)
            get_filename_component(src_fname ${src} NAME)
            set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
                "${target_dest}/${src_fname}")
            cdotman_trace_debug("File \"${target_dest}/${src_fname}\" is registered by cmake")
            set(status_install "[${target}] -- INSTALL -- File ${src_fname} is installed to ${target_dest}")
            set(status_skip "[${target}] -- SKIP -- File ${target_dest}/${src_fname} is the same as source or newer")
            if("${src}" IS_NEWER_THAN "${target_dest}/${src_fname}")
                set(is_newer TRUE)
                cdotman_trace_info("${status_install}")
                add_custom_command(TARGET CDOTMAN_TARGET_${target} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E "echo" "${status_install}")
                add_custom_command(TARGET CDOTMAN_TARGET_${target} POST_BUILD 
                    COMMAND ${CMAKE_COMMAND} -E "copy_if_different" "${src}" "${target_dest}")
           else()
                cdotman_trace_info("${status_skip}")
                add_custom_command(TARGET CDOTMAN_TARGET_${target} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E "echo" "${status_skip}")
            endif()

        endforeach()
        
    else()
    # link
    endif()

endfunction()
