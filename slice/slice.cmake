set(SLICE_GENERATED_DIR ${CMAKE_CURRENT_BINARY_DIR} CACHE PATH "Path to generated slice files")
set(SLICE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR} CACHE PATH "Path to slice files")

set(Ice_SLICE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

macro(createSlice2XXXCustomCommand TARGET_NAME SOURCE_PATH GENERATED_PATH SLICE2XXX_EXECUTABLE INCLUDE_SLICE_DIRS HEADER_EXT SOURCE_EXT HEADER_INCLUDE_DIR)
    file(GLOB ${TARGET_NAME}_ICE_SRC_LIST ${SOURCE_PATH}/*.ice)
    list(LENGTH ${TARGET_NAME}_ICE_SRC_LIST ICE_LENGTH)

    if(${ICE_LENGTH} GREATER 0)
        foreach(val ${${TARGET_NAME}_ICE_SRC_LIST})
            string(REGEX REPLACE "^(.+)/([^/]*)\\.ice$" "${GENERATED_PATH}/\\2.${SOURCE_EXT}" val ${val})
            list(APPEND ${TARGET_NAME}_ICE_XXX_SRC_LIST ${val})
        endforeach(val ${${TARGET_NAME}_ICE_SRC_LIST})

        if(Ice_SLICE_DIR)
            list(APPEND CUSTOM_INCLUDE_SLICE_FLAGS -I${Ice_SLICE_DIR})
        endif()

        foreach(dir ${INCLUDE_SLICE_DIRS})
            if(dir)
                list(APPEND CUSTOM_INCLUDE_SLICE_FLAGS -I${dir})
            endif()
        endforeach()

        if(NOT HEADER_INCLUDE_DIR STREQUAL "")
            set(HEADER_INCLUDE_DIR_CMD --include-dir ${HEADER_INCLUDE_DIR})
        endif()

        if(CMAKE_VERBOSE_MAKEFILE)
            message("${TARGET_NAME}_Slice: CUSTOM_INCLUDE_SLICE_FLAGS: ${CUSTOM_INCLUDE_SLICE_FLAGS}")
            message("${TARGET_NAME}_Slice: ${TARGET_NAME}_ICE_SRC_LIST: ${${TARGET_NAME}_ICE_SRC_LIST}")
            message("${TARGET_NAME}_Slice: ${TARGET_NAME}_ICE_XXX_SRC_LIST: ${${TARGET_NAME}_ICE_XXX_SRC_LIST}")
        endif()

        add_custom_command(OUTPUT ${${TARGET_NAME}_ICE_XXX_SRC_LIST}
            COMMAND ${CMAKE_COMMAND} -E make_directory ${GENERATED_PATH}
            COMMAND ${SLICE2XXX_EXECUTABLE} ${CUSTOM_INCLUDE_SLICE_FLAGS} ${HEADER_INCLUDE_DIR_CMD} --output-dir ${GENERATED_PATH}  --header-ext ${HEADER_EXT} --source-ext ${SOURCE_EXT} ${${TARGET_NAME}_ICE_SRC_LIST}
            DEPENDS ${${TARGET_NAME}_ICE_SRC_LIST}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            COMMENT "${TARGET_NAME}_Slice BUILD ICE source"
        )
    endif()
endmacro()

macro(createSlice2XXXTarget TARGET_NAME SOURCE_PATH GENERATED_PATH SLICE2XXX_EXECUTABLE INCLUDE_SLICE_DIRS HEADER_EXT SOURCE_EXT HEADER_INCLUDE_DIR)
    createSlice2XXXCustomCommand(${TARGET_NAME} ${SOURCE_PATH} ${GENERATED_PATH} ${SLICE2XXX_EXECUTABLE} "${INCLUDE_SLICE_DIRS}" ${HEADER_EXT} ${SOURCE_EXT} ${HEADER_INCLUDE_DIR})

    if(CMAKE_VERBOSE_MAKEFILE)
        message("${TARGET_NAME}_Slice: SLICE2XX_EXECUTABLE: ${SLICE2XXX_EXECUTABLE}")
        message("Ice_SLICE_DIR: ${Ice_SLICE_DIR}")
        message("${TARGET_NAME}_ICE_XXX_SRC_LIST: ${${TARGET_NAME}_ICE_XXX_SRC_LIST}")
    endif()

    add_custom_target(${TARGET_NAME} ALL
        DEPENDS ${${TARGET_NAME}_ICE_XXX_SRC_LIST}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )

    set(${TARGET_NAME}_INCLUDE_DIRS ${GENERATED_PATH})
    set_target_properties(${TARGET_NAME} PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${${TARGET_NAME}_INCLUDE_DIRS})
    set_target_properties(${TARGET_NAME} PROPERTIES ICE2XXX_SOURCES "${${TARGET_NAME}_ICE_XXX_SRC_LIST}")
    set_source_files_properties(${${TARGET_NAME}_ICE_XXX_SRC_LIST} PROPERTIES
        GENERATED TRUE
    )
endmacro()