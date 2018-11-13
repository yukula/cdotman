# cdotman_get_targets(<out_var>)
function(cdotman_get_targets out_var)
    get_property(targets GLOBAL PROPERTY CDOTMAN_TARGETS)
    set(${out_var} ${targets} PARENT_SCOPE)
endfunction()