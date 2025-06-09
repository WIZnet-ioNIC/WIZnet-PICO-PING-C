# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/tools/pioasm")
  file(MAKE_DIRECTORY "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/tools/pioasm")
endif()
file(MAKE_DIRECTORY
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pioasm"
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pioasm-install"
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/tmp"
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src"
  "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/Pico/WIZnet-PICO-PING-C/build_dbg/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/pioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
