list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/modules/utility")

# TRACE
include(cdotman_trace_info)
include(cdotman_trace_warning)
include(cdotman_trace_debug)
include(cdotman_trace_error)

# SYMLINK
include(cdotman_symlink_to)
include(cdotman_is_symlink)
include(cdotman_symlink_create)
include(cdotman_symlink_remove)

include(cdotman_list_to_str)
include(cdotman_track_file)