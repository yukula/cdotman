option(CDOTMAN_DEBUG "cdotman debug info" OFF)

get_filename_component(CDOTMAN_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

# TRACES
option(CDOTMAN_TRACE_INFO "print info traces" ON)
option(CDOTMAN_TRACE_DEBUG "print debug traces" ${CDOTMAN_DEBUG})
option(CDOTMAN_TRACE_ERROR "print error traces" ON)