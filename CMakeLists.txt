cmake_minimum_required(VERSION 3.26)

project(myapp
    VERSION 1.0.0
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(QSkinny REQUIRED)

add_executable(myapp
    main.cpp )

target_link_libraries(myapp PRIVATE
    Qt6::Quick
    Qsk::QSkinny)

# copy the runtime dlls
add_custom_command(
    TARGET myapp POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt6::Quick> $<TARGET_FILE_DIR:myapp>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt6::OpenGL> $<TARGET_FILE_DIR:myapp>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt6::Network> $<TARGET_FILE_DIR:myapp>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt6::Qml> $<TARGET_FILE_DIR:myapp>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt6::QmlModels> $<TARGET_FILE_DIR:myapp>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qsk::QSkinny> $<TARGET_FILE_DIR:myapp>
)