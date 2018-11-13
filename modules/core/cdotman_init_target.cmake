function(cdotman_init_target target_name)
    set(prefix CDOTMAN_TARGET)
    set(src SOURCES)
    set(dist DISTINATION)
    set(type TYPE)

    if(NOT ARGC EQUAL 1)
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()
    string(TOUPPER ${target_name} target_name)

    # target properties 
    define_property(GLOBAL PROPERTY ${prefix}_${src}
                    BRIEF_DOCS "List of target sources"
                    FULL_DOCS "List of target sources")
    define_property(GLOBAL PROPERTY ${prefix}_${dist}
                    BRIEF_DOCS "Absolute path of target installation"
                    FULL_DOCS "Absolute path of target installation")
    define_property(GLOBAL PROPERTY ${prefix}_${type}
                    BRIEF_DOCS "Type of target installation. COPY | LINK"
                    FULL_DOCS "Type of target installation. COPY | LINK")

    # target registration
    set_property(GLOBAL APPEND PROPERTY CDOTMAN_TARGETS ${target_name})
endfunction()
