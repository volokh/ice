add_definitions(-DICE_BUILDING_SRC -DICE_API_EXPORTS)

get_target_property(SLICE2CPP_LIST Ice_Slice2Cpp ICE2XXX_SOURCES)
set_source_files_properties(${SLICE2CPP_LIST} PROPERTIES
    GENERATED TRUE
)
aux_source_directory(. SRC_LIST)
list(APPEND SRC_LIST ${SLICE2CPP_LIST})

if(UNIX)
    list(REMOVE_ITEM SRC_LIST ./DLLMain.cpp)
endif()

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/..
    ${SLICE_GENERATED_DIR}
)

iceInstallHeaders(${CMAKE_CURRENT_SOURCE_DIR}/../../include/${PROJECT_NAME})
iceInstallHeaders(${SLICE_GENERATED_DIR}/${PROJECT_NAME})
