list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/config/")
include(cdotman_default)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/include/")
include(cdotman_utility)
include(cdotman_core)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/modules/")
include(cdotman_add_target)

cdotman_init_target(test)
# cdotman_add_target(tmux .tmux.conf .tmux_1.conf .tmux_2.conf INCLUDE color.cmake)
cdotman_add_target(tmux tmux.conf INCLUDE color.cmake)
# cdotman_add_target(tmux.conf INCLUDE color.cmake)
# cdotman_add_target(tmux INCLUDE color.cmake)
# cdotman_add_target(INCLUDE color.cmake)
# cdotman_add_target(tmux tmux.conf)

# cdotman_add_target(tmux .tmux.in conf.cmake)
# cdotman_install(tmux ~/.config COPY)