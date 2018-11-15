# returns target filename for configure process
# file.conf.in -> file.conf
# cdotman_get_target_filename(<out_var> <template>)
function(cdotman_get_target_filename out_var template)
    if(NOT ARGC EQUAL 2 )
        set(error_msg "Unexpected argument number: ${ARGC};")
        cdotman_trace_error(${error_msg})
    endif()

    cdotman_is_template(is_template ${template})
    if(NOT is_template)
        cdotman_trace_error("template \"${template}\" is not a template")
    endif()

    string(LENGTH ${template} template_str_len)
    string(FIND ${template} ".in" template_mark_pos)
    string(SUBSTRING ${template} 0 ${template_mark_pos} res)

    set(${out_var} ${res} PARENT_SCOPE)
endfunction()
