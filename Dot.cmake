option(DOT_DEBUG "Enable debuging traces" OFF)

function(dot_add_target _target)
    if(NOT ARGN)
        message(WARNING
                "In dot_add_target call for target ${_target}, no source files were specified")
        return()
    endif()
    if(DEFINED DOT_TARGET_${_target})
        message(WARNING
                "dot_add_target was called with target ${_target} which is already exist")
        return()
    endif()

    # dot_target should looks like:
    #   ${ARGV1},${ARGV2},...
    foreach(argv IN LISTS ARGN)
        get_filename_component(file_absolute_path ${argv} REALPATH) 
        if(NOT EXISTS ${file_absolute_path})
            message(WARNING
                    "In dot_add_target the ${argv} passed as an argument isn't exist")
            return()
        endif()
        # search duplicate of current ${file_absolute_path} 
        if(file_absolute_path IN_LIST dot_target)
            message(WARNING
                    "In dot_add_target was an attempt of adding file ${argv} twice for target ${_target}")
        else()
            list(APPEND dot_target ${file_absolute_path})
        endif()
    endforeach()
    
    set(DOT_TARGET_${_target} ${dot_target} PARENT_SCOPE)

    if(DOT_DEBUG)
        message("In dot_add_target:")
        message("\ttarget_name: ${_target}")
        message("\targn: ${ARGN}")
        message("\tDOT_TARGET_${_target} = ${dot_target}")
    endif()
endfunction()