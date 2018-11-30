# cdotman_update(<target>... DESTINATION <destination> <type> [INCLUDE] include)
function(cdotman_update)
    set(pref ARG) 
    set(option LINK COPY)
    set(single_kwarg DESTINATION INCLUDE)
    cmake_parse_arguments(${pref} "${option}" "${single_kwarg}" "" ${ARGN})

    # arg existence check
    if(NOT ${pref}_UNPARSED_ARGUMENTS)
        cdotman_trace_error("Required argument <target> wasn't specified")
    else()
        set(targets ${${pref}_UNPARSED_ARGUMENTS})
    endif()
    if(NOT ${pref}_DESTINATION)
        cdotman_trace_error("Required argument <destination> wasn't specified")
    endif()
    if(NOT ${pref}_LINK)
        set(type COPY)
    else()
        set(type LINK)
    endif()

    if(ARG_INCLUDE)
        get_filename_component(include_path ${ARG_INCLUDE} ABSOLUTE)
        if(NOT EXISTS ${include_path})
            cdotman_trace_error("File \"${include_path}\" does not exist")
        endif()
        set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
                "${target_dest}/${src_fname}")

        include(${include_path} NO_POLICY_SCOPE)
        cdotman_trace_debug("cdotman_add_target: file \"${ARG_INCLUDE}\" was included")
    endif()

    # target 
    foreach(target IN LISTS ${targets})
        cdotman_is_target_exist(is_target_exist ${target})
        if(NOT is_target_exist)
            cdotman_get_targets(known_targets)
            cdotman_list_to_str(known_targets_str "," "${known_targets}")
            cdotman_trace_error("Target \"${targets}\" does not exist; -- Registered targets: ${known_targets_str}")
        endif()
    endforeach()
    
    # destination
    get_filename_component(destination ${${pref}_DESTINATION} ABSOLUTE)
    if(NOT EXISTS ${destination})
        cdotman_trace_error("DESTINATION path \"${destination}\" doesn't exist")
    endif()

    # update targets info
    foreach(target IN LISTS targets)
        cdotman_is_target_complete(is_target_complete ${target})
        if(is_target_complete)
            cdotman_trace_error("Target \"${target}\" had already specified for installation")
        endif()
        get_filename_component(dest ${${pref}_DESTINATION} ABSOLUTE)
        cdotman_set_target_property(${target} PROPERTY DESTINATION ${dest})
        cdotman_set_target_property(${target} PROPERTY TYPE ${type})
        cdotman_configure_target(${target})

        if(NOT TARGET update)
            add_custom_target(update)
        endif()
        cdotman_make_build_target(${target})

        # add_dependencies(CDOTMAN_TARGET_${target} rebuild_cache)
        add_dependencies(update CDOTMAN_TARGET_${target})
    endforeach()
   
endfunction()
