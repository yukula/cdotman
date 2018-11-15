list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/config/")
include(cdotman_default)

list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/include/")
include(cdotman_utility)
include(cdotman_core)

cdotman_init_target(test)
cdotman_set_target_property(test PROPERTY SOURCES ${CDOTMAN_SOURCE_DIR}/test.conf.in)

cdotman_get_target_properties(props test)
foreach(prop IN LISTS props)
   cdotman_trace_info(${prop}) 
endforeach()

cdotman_configure_target(test)

cdotman_get_target_properties(props test)
foreach(prop IN LISTS props)
   cdotman_trace_info(${prop}) 
endforeach()

# cdotman_add_target(tmux .tmux.in conf.cmake)
# cdotman_install(tmux ~/.config COPY)