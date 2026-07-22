# ============================================================================
# TargetFetch Module
# STRATUM: receives the relayed XC25 pod status (UDP) and publishes the target
# coordinate for the Fly view map to plot. Read-only; mirrors the ADSB module.
# ============================================================================

target_sources(${CMAKE_PROJECT_NAME}
    PRIVATE
        TargetFetchManager.cc
        TargetFetchManager.h
)

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
