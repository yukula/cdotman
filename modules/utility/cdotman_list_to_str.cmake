function(cdotman_list_to_str out_var delim)
    set(list ${ARGN})
    list(LENGTH list LIST_LENGTH)

    if(NOT LIST_LENGTH)
        cdotman_trace_warning("cdotman_list_to_str: source list is empty")
        return()
    endif()
    

    list(GET list 0 result)

    math(EXPR LAST_INDEX "${LIST_LENGTH}-1")
    foreach(index RANGE 1 ${LAST_INDEX})
        list(GET list ${index} elem)
        set(result "${result}${delim}${elem}")
    endforeach()

    set(${out_var} ${result} PARENT_SCOPE)    
endfunction()
