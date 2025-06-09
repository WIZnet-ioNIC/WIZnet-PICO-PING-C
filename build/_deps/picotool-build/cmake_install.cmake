# Install script for directory: D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/Pico/WIZnet-PICO-PING-C/build/_deps")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/picotool" TYPE EXECUTABLE MESSAGE_NEVER FILES "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/picotool.exe")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/picotool/picotoolTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/picotool/picotoolTargets.cmake"
         "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/CMakeFiles/Export/4428c4be664630400018e610c73b3270/picotoolTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/picotool/picotoolTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/picotool/picotoolTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/picotool" TYPE FILE MESSAGE_NEVER FILES "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/CMakeFiles/Export/4428c4be664630400018e610c73b3270/picotoolTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/picotool" TYPE FILE MESSAGE_NEVER FILES "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/CMakeFiles/Export/4428c4be664630400018e610c73b3270/picotoolTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/picotool" TYPE FILE MESSAGE_NEVER FILES
    "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/picotoolConfig.cmake"
    "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/picotoolConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/errors/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/picoboot_connection/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/elf/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/elf2uf2/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/lib/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/bintool/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/pico_binary_info/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/boot_uf2_headers/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/boot_picoboot_headers/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/boot_picobin_headers/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/pico_usb_reset_interface_headers/cmake_install.cmake")
  include("D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/pico_platform/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
  file(WRITE "D:/Pico/WIZnet-PICO-PING-C/build/_deps/picotool-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
