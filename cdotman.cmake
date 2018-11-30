list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/config/")
include(cdotman_default)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/include/")
include(cdotman_utility)
include(cdotman_core)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/modules/")
include(cdotman_add_target)
include(cdotman_update)

# cdotman_add_target(tmux .tmux.conf .tmux_1.conf .tmux_2.conf INCLUDE color.cmake)
cdotman_add_target(tmux .tmux.conf)
cdotman_add_target(test test.cpp.in)
# cdotman_add_target(tmux.conf INCLUDE color.cmake)
# cdotman_add_target(tmux INCLUDE color.cmake)
# cdotman_add_target(INCLUDE color.cmake)
# cdotman_add_target(tmux tmux.conf)
# cdotman_install(DESTINATION ~/.config/)
# cdotman_install(tmux ~/.config/)

cdotman_track_file(~/.config/test.cpp)

# cdotman_install(tmux test
    # DESTINATION ~/.config/
    # INCLUDE color.cmake
    # COPY)

# cdotman_install(tmux xmodmap DESTINATION ~/.config/ LINK)
# cdotman_install(tmux xmodmap DESTINATION ~/.confik/ )
# cdotman_install(tmux DESTINATION LINK ~/.config)

# cdotman_add_target(tmux .tmux.in conf.cmake)
# cdotman_install(tmux ~/.config COPY)