option(CDOTMAN_DEBUG "cdotman debug info" OFF)

get_filename_component(CDOTMAN_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

# traces
option(CDOTMAN_TRACE_INFO "print info traces" ON)
option(CDOTMAN_TRACE_DEBUG "print debug traces" ${CDOTMAN_DEBUG})
option(CDOTMAN_TRACE_ERROR "print error traces" ON)

# constants
set(CDOTMAN_CONFIG_DIR $ENV{XDG_CONFIG_HOME})
define_property(GLOBAL PROPERTY CDOTMAN_TARGETS 
                BRIEF_DOCS "List of registered targets"
                FULL_DOCS "List of registered targets")
set(CDOTMAN_REPO "https://github.com/jaffeetv/cdotman")
set(CDOTMAN_WIKI "${CDOTMAN_REPO}/wiki")
