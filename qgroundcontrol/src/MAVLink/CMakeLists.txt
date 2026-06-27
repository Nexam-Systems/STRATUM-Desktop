# ============================================================================
# MAVLink Module
# MAVLink protocol implementation and communication handling
# ============================================================================

target_sources(
    ${CMAKE_PROJECT_NAME}
    PRIVATE ImageProtocolManager.cc
            ImageProtocolManager.h
            MAVLinkFTP.cc
            MAVLinkFTP.h
            MAVLinkLib.h
            MAVLinkMessageType.h
            MAVLinkStreamConfig.cc
            MAVLinkStreamConfig.h
            QGCMAVLink.cc
            QGCMAVLink.h
            QGCMAVLinkTypes.h
            StatusTextHandler.cc
            StatusTextHandler.h
            SysStatusSensorInfo.cc
            SysStatusSensorInfo.h
)

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

# ============================================================================
# MAVLink Protocol Library Integration
# ============================================================================

message(STATUS "QGC: Building MAVLink")

# STRATUM: drop our own dialect files into the fetched mavlink source tree before it
# configures/generates.
#   * stratum.xml  -- does `<include>all.xml</include>` and appends only STRATUM's
#                     custom messages (e.g. ENGAGEMENT_STATUS / 42001). CRC parity
#                     with the firmware is guaranteed by an identical field block
#                     (verified: CRC_EXTRA = 18).
#   * icarous.xml  -- patched copy that removes the unused ICAROUS_KINEMATIC_BANDS,
#                     which upstream defines at id 42001 and which collides with
#                     ENGAGEMENT_STATUS (icarous is pulled into "all" via
#                     ardupilotmega). STRATUM never uses ICAROUS. Without this,
#                     mavgen fails with "Duplicate message id 42001".
# The upstream CPM pin stays otherwise untouched. QGC_MAVLINK_DIALECT is "stratum"
# (CustomOptions.cmake). copy_if_different is idempotent across rebuilds.
set(STRATUM_MAVLINK_DEF_DIR "${CMAKE_CURRENT_SOURCE_DIR}/mavlink_definitions")
CPMAddPackage(
    NAME mavlink
    GIT_REPOSITORY ${QGC_MAVLINK_GIT_REPO}
    GIT_TAG ${QGC_MAVLINK_GIT_TAG}
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${STRATUM_MAVLINK_DEF_DIR}/stratum.xml"
            "<SOURCE_DIR>/message_definitions/v1.0/stratum.xml"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${STRATUM_MAVLINK_DEF_DIR}/icarous.xml"
            "<SOURCE_DIR>/message_definitions/v1.0/icarous.xml"
    OPTIONS "MAVLINK_DIALECT ${QGC_MAVLINK_DIALECT}" "MAVLINK_VERSION ${QGC_MAVLINK_VERSION}"
)

if(mavlink_ADDED)
    add_dependencies(${CMAKE_PROJECT_NAME} mavlink)
    target_include_directories(${CMAKE_PROJECT_NAME}
                               PRIVATE ${mavlink_BINARY_DIR}/include/mavlink
                                       ${mavlink_BINARY_DIR}/include/mavlink/${QGC_MAVLINK_DIALECT}
    )

    # Generate lightweight MAVLinkEnums.h (enum typedefs only, no message pack/unpack code)
    # plus MAVLinkEnumsQml.{h,cc} exposing every enum via Q_NAMESPACE/Q_ENUM_NS for QML.
    set(MAVLINK_ENUMS_H "${CMAKE_BINARY_DIR}/MAVLinkEnums.h")
    set(MAVLINK_ENUMS_QML_H "${CMAKE_BINARY_DIR}/MAVLinkEnumsQml.h")
    set(MAVLINK_ENUMS_QML_CC "${CMAKE_BINARY_DIR}/MAVLinkEnumsQml.cc")
    set(MAVLINK_ENUMS_GENERATOR "${CMAKE_SOURCE_DIR}/tools/generators/mavlink_enums.py")
    add_custom_command(
        OUTPUT "${MAVLINK_ENUMS_H}" "${MAVLINK_ENUMS_QML_H}" "${MAVLINK_ENUMS_QML_CC}"
        COMMAND Python3::Interpreter "${MAVLINK_ENUMS_GENERATOR}" "${mavlink_BINARY_DIR}/include/mavlink"
                "${MAVLINK_ENUMS_H}" "${MAVLINK_ENUMS_QML_H}" "${MAVLINK_ENUMS_QML_CC}"
        DEPENDS mavlink "${MAVLINK_ENUMS_GENERATOR}"
        COMMENT "Generating MAVLinkEnums.h + MAVLinkEnumsQml.{h,cc}"
        VERBATIM
    )
    add_custom_target(mavlink_enums DEPENDS "${MAVLINK_ENUMS_H}" "${MAVLINK_ENUMS_QML_H}" "${MAVLINK_ENUMS_QML_CC}")
    add_dependencies(${CMAKE_PROJECT_NAME} mavlink_enums)
    # Ensure AUTOMOC runs after the generator
    set_property(
        TARGET ${CMAKE_PROJECT_NAME}
        APPEND
        PROPERTY AUTOGEN_TARGET_DEPENDS mavlink_enums
    )
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE "${CMAKE_BINARY_DIR}")

    # Register the QML anchor files so AUTOMOC picks up Q_NAMESPACE + Q_ENUM_NS
    set_source_files_properties("${MAVLINK_ENUMS_QML_H}" "${MAVLINK_ENUMS_QML_CC}" PROPERTIES GENERATED TRUE)
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE "${MAVLINK_ENUMS_QML_H}" "${MAVLINK_ENUMS_QML_CC}")

    # Generate MAVLinkInstanceFields.h (message ID → instance field name mapping)
    set(MAVLINK_INSTANCE_FIELDS_H "${CMAKE_BINARY_DIR}/MAVLinkInstanceFields.h")
    set(MAVLINK_INSTANCE_FIELDS_GENERATOR "${CMAKE_SOURCE_DIR}/tools/generators/mavlink_instance_fields.py")
    set(MAVLINK_XML_DIR "${mavlink_SOURCE_DIR}/message_definitions/v1.0")
    add_custom_command(
        OUTPUT "${MAVLINK_INSTANCE_FIELDS_H}"
        COMMAND Python3::Interpreter "${MAVLINK_INSTANCE_FIELDS_GENERATOR}"
                "${MAVLINK_XML_DIR}" "${QGC_MAVLINK_DIALECT}" "${MAVLINK_INSTANCE_FIELDS_H}"
        DEPENDS mavlink "${MAVLINK_INSTANCE_FIELDS_GENERATOR}"
        COMMENT "Generating MAVLinkInstanceFields.h"
        VERBATIM
    )
    add_custom_target(mavlink_instance_fields DEPENDS "${MAVLINK_INSTANCE_FIELDS_H}")
    add_dependencies(${CMAKE_PROJECT_NAME} mavlink_instance_fields)
endif()

# ----------------------------------------------------------------------------
# LibEvents - MAVLink event handling
# ----------------------------------------------------------------------------
add_subdirectory(LibEvents)
add_subdirectory(Signing)
