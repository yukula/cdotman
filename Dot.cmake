option(DOT_DEBUG "Enable debug traces" OFF)

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


function(dot_install)
    set(prefix          DOT_INSTALL)    # 
    set(options         LINK)           # OPTIONAL; Destination method; COPY is default
    set(oneValueArgs    DESTINATION)    # REQUIRED; Relative or absolute path to directory
    set(multiValueArgs  TARGETS)        # REQUIRED; Targets from dot_add_target
    cmake_parse_arguments(${prefix} "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    # Required fields must be specified
    if( (NOT DEFINED ${prefix}_${multiValueArgs}) OR (NOT DEFINED ${prefix}_${oneValueArgs}) )
        message(WARNING
               "In dot_install call no TARGETS and/or DESTINATION were specified")
        return()
    endif()

    # On this step target must be created
    # Check up TARGETS
    foreach(target IN LISTS DOT_INSTALL_TARGETS)
        if(NOT DEFINED DOT_TARGET_${target})
            message(SEND_ERROR
                    "dot_install was called with nonexistent target ${target}")
            return()
        endif()
    endforeach()

    # Check up DESTINATION
    get_filename_component(DOT_INSTALL_DESTINATION ${DOT_INSTALL_DESTINATION} ABSOLUTE)
    if((NOT EXISTS ${DOT_INSTALL_DESTINATION}) OR (NOT IS_DIRECTORY ${DOT_INSTALL_DESTINATION}))
        message(SEND_ERROR
                "In dot_install call the DESTINATION=${DOT_INSTALL_DESTINATION} isn't a correct path. Expected path to existing directory")
        return()
    endif()

    if(DOT_INSTALL_LINK)        # link installation 
        foreach(target IN LISTS DOT_INSTALL_TARGETS)
            # check if link already exists 
            install(CODE "" # symlink creation
                   FILES "" DESTINATION "") 
        endforeach()
    else()                      # copy installation
        foreach(target IN LISTS DOT_INSTALL_TARGETS)
            # check if fily already exists and date of changing
            message("${DOT_TARGET_${target}}")
            install(FILES ${DOT_TARGET_${target}} DESTNATION ${DOT_INSTALL_DESTINATION}/)
        endforeach()
    endif()

    # if copy == 1
        # if file exists
            # check dates
        # push into install target
    # if link == 1
        # if file exists
            # if it symlink
                # validate path of symlink
            # else
                # warning
        # push into install target
    

    
    # if(file1 IS_NEWER_THAN file2)
    # if(IS_SYMLINK fileName)
    # if(IS_DIRECTORY pathToDir)

    if(DOT_DEBUG)
        message("In dot_install:")
        message("\tDOT_INSTALL_TARGETS: ${DOT_INSTALL_TARGETS}")
        message("\tDOT_INSTALL_DESTINATION: ${DOT_INSTALL_DESTINATION}")
        message("\tDOT_INSTALL_LINK: ${DOT_INSTALL_LINK}")
        message("\tDOT_INSTALL_UNPARSED_ARGUMENTS: ${DOT_INSTALL_UNPARSED_ARGUMENTS}")
        message("\t")
    endif()
endfunction()
