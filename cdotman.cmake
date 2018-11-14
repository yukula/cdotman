list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/config/")
include(cdotman_default)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/include/")
include(cdotman_utility)
include(cdotman_core)

cdotman_init_target(tmux)
cdotman_set_target_property(tmux PROPERTY SOURCES .tmux)
cdotman_set_target_property(tmux PROPERTY DESTINATION "${CDOTMAN_CONFIG_DIR}/")
cdotman_set_target_property(tmux PROPERTY SOURCES .profile)
cdotman_set_target_property(tmux PROPERTY TYPE COPY)

cdotman_get_target_properties(props tmux)
foreach(prop IN LISTS props)
    cdotman_trace_info("${prop}")
endforeach()



# cdotman_add_target(tmux .tmux.in conf.cmake)
# cdotman_install(tmux ~/.config COPY)