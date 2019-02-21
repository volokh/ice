add_definitions(-DICE_BUILDING_SRC -DICEGRID_API_EXPORTS)

get_target_property(SLICE2CPP_LIST IceGrid_Slice2Cpp ICE2XXX_SOURCES)
set_source_files_properties(${SLICE2CPP_LIST} PROPERTIES
    GENERATED TRUE
)
aux_source_directory(. SRC_LIST)
list(APPEND SRC_LIST ${SLICE2CPP_LIST})

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/..
    ${SLICE_GENERATED_DIR}
    ${SLICE_GENERATED_DIR}/Glacier2
)

iceInstallHeaders(${CMAKE_CURRENT_SOURCE_DIR}/../../include/IceGrid)
iceInstallHeaders(${SLICE_GENERATED_DIR}/IceGrid)
