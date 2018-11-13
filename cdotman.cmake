list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/config/")
include(cdotman_default)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/include/")
include(cdotman_utility)
include(cdotman_core)

cdotman_init_target(tmux)
cdotman_set_target_property(tmux PROPERTY SOURCES hello)
cdotman_set_target_property(tmux PROPERTY random sukablyat)
cdotman_set_target_property(tmux PROPERTY SOURCES sukablyat)
# cdotman_add_target(tmux .tmux.in conf.cmake)
# cdotman_install(tmux ~/.config COPY)