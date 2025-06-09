# Install script for directory: D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE MESSAGE_NEVER PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/aes.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/aesni.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/arc4.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/aria.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/asn1.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/asn1write.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/base64.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/bignum.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/blowfish.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/bn_mul.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/camellia.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ccm.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/certs.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/chacha20.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/chachapoly.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/check_config.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/cipher.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/cipher_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/cmac.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/compat-1.3.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/config.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/config_psa.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/constant_time.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ctr_drbg.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/debug.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/des.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/dhm.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ecdh.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ecdsa.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ecjpake.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ecp.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ecp_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/entropy.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/entropy_poll.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/error.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/gcm.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/havege.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/hkdf.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/hmac_drbg.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/md.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/md2.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/md4.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/md5.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/md_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/net.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/net_sockets.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/nist_kw.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/oid.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/padlock.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pem.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pk.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pk_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pkcs11.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pkcs12.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/pkcs5.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/platform.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/platform_time.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/platform_util.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/poly1305.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/psa_util.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ripemd160.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/rsa.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/rsa_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/sha1.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/sha256.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/sha512.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl_cache.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl_cookie.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl_internal.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/ssl_ticket.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/threading.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/timing.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/version.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/x509.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/x509_crl.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/x509_crt.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/x509_csr.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/mbedtls/xtea.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE MESSAGE_NEVER PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_builtin_composites.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_builtin_primitives.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_compat.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_config.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_driver_common.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_extra.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_platform.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_se_driver.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_sizes.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_struct.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_types.h"
    "D:/Pico/WIZnet-PICO-PING-C/libraries/pico-sdk/lib/mbedtls/include/psa/crypto_values.h"
    )
endif()

