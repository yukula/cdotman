list(APPEND CMAKE_MODULE_PATH "${CDOTMAN_SOURCE_DIR}/modules/core/")

# target
include(cdotman_init_target)
include(cdotman_get_targets)
include(cdotman_is_target_exist)
include(cdotman_get_target_property)
include(cdotman_set_target_property)
include(cdotman_get_target_properties)
include(cdotman_is_target_complete)

# configure
include(cdotman_is_template)
include(cdotman_get_target_filename)
include(cdotman_configure_target)