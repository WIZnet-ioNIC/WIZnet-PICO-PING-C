# WIZnet-PICO-PING-C
 
1. Download

If the ethernet examples are cloned, the library set as a submodule is an empty directory. Therefore, if you want to download the library set as a submodule together, clone the ethernet examples with the following Git command.

```cpp
/* Change directory */
// change to the directory to clone
cd [user path]

// e.g.
cd D:/WIZnet-PICO-PING-C

/* Clone */
git clone --recurse-submodules https://github.com/WIZnet-ioNIC/WIZnet-PICO-PING-C.git
```

With Visual Studio Code, the library set as a submodule is automatically downloaded, so it doesn't matter whether the library set as a submodule is an empty directory or not, so refer to it.

2. Setup board

Setup the board in '**CMakeLists.txt**' in '**WIZnet-PICO-PING-C/**' directory according to the evaluation board to be used referring to the following.

- WIZnet Ethernet HAT
- W5100S-EVB-Pico
- W5500-EVB-Pico
- W55RP20-EVB-Pico
- W6100-EVB-Pico
- W6300-EVB-Pico
- W6100-EVB-Pico2
- W6300-EVB-Pico2

For example, when using WIZnet Ethernet HAT :

```cpp
# Set board
set(BOARD_NAME WIZnet_Ethernet_HAT)
```

When using W55RP20-EVB-Pico :

```cpp
# Set board
set(BOARD_NAME W55RP20_EVB_PICO)
```



# How to Test Ping Example


## Step 1: Prepare hardware

If you are using WIZnet's PICO board, you can skip '1. Combine...'

1. Combine WIZnet Ethernet HAT with Raspberry Pi Pico.

2. Connect ethernet cable to your PICO board ethernet port.

3. Connect your PICO board to desktop or laptop using USB cable. 



## Step 2: Setup Ping Example

To test the ping example, minor settings shall be done in code.

1. Setup SPI port and pin in 'w5x00_spi.h' in 'WIZnet-PICO-C/port/ioLibrary_Driver/' directory.

Setup the SPI interface you use.

### For **W55RP20-EVB-PICO**:
If you are using the **W55RP20-EVB-PICO**, enable `USE_PIO` and configure as follows:

```cpp
#if (DEVICE_BOARD_NAME == W55RP20_EVB_PICO)

#define USE_PIO

#define PIN_SCK   21
#define PIN_MOSI  23
#define PIN_MISO  22
#define PIN_CS    20
#define PIN_RST   25
#define PIN_IRQ   24

```

---

### For **W6300-EVB-PICO** or **W6300-EVB-PICO2**:
If you are using the **W6300-EVB-PICO** or **W6300-EVB-PICO2**, use the following pinout and SPI clock divider configuration:

```cpp
#elif (DEVICE_BOARD_NAME == W6300_EVB_PICO || DEVICE_BOARD_NAME == W6300_EVB_PICO2)
#define USE_PIO

#define PIO_IRQ_PIN             15
#define PIO_SPI_SCK_PIN         17
#define PIO_SPI_DATA_IO0_PIN    18
#define PIO_SPI_DATA_IO1_PIN    19
#define PIO_SPI_DATA_IO2_PIN    20
#define PIO_SPI_DATA_IO3_PIN    21
#define PIN_CS                  16
#define PIN_RST                 22


```
---

### For other generic SPI boards
If you are not using any of the above boards, you can fall back to a default SPI configuration:

```cpp
#else

#define SPI_PORT spi0

#define SPI_SCK_PIN  18
#define SPI_MOSI_PIN 19
#define SPI_MISO_PIN 16
#define SPI_CS_PIN   17
#define RST_PIN      20

#endif
```

Make sure you are **not defining `USE_PIO`** in your setup when using DMA:

```cpp
// #define USE_PIO
```


2. Setup network configuration such as IP in 'ping_client.c' which is the ping example in 'WIZnet-PICO-PING-C/examples/ping_client/' directory.

Setup IP and other network settings to suit your network environment.

```cpp
static wiz_NetInfo g_net_info =
    {
        .mac = {0x00, 0x08, 0xDC, 0x12, 0x34, 0x56}, // MAC address
        .ip = {192, 168, 11, 2},                     // IP address
        .sn = {255, 255, 255, 0},                    // Subnet Mask
        .gw = {192, 168, 11, 1},                     // Gateway
        .dns = {8, 8, 8, 8},                         // DNS server
#if _WIZCHIP_ > W5500
        .lla = {0xfe, 0x80, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x02, 0x08, 0xdc, 0xff,
                0xfe, 0x57, 0x57, 0x25},             // Link Local Address
        .gua = {0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00},             // Global Unicast Address
        .sn6 = {0xff, 0xff, 0xff, 0xff,
                0xff, 0xff, 0xff, 0xff,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00},             // IPv6 Prefix
        .gw6 = {0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00},             // Gateway IPv6 Address
        .dns6 = {0x20, 0x01, 0x48, 0x60,
                0x48, 0x60, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x88, 0x88},             // DNS6 server
        .ipmode = NETINFO_STATIC_ALL
#else
        .dhcp = NETINFO_STATIC        
#endif
};
```

3. Setup Ping client configuration in 'ping_client.c' in 'WIZnet-PICO-PING-C/examples/ping_client/' directory.


If you want to use ipv6, use following configuration.
```cpp
//#define IPV4
#define IPV6

uint8_t remote_ip6[16] = {
    0xfe, 0x80, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00,
    0xc0, 0x74, 0x7e, 0x0d,
    0xdb, 0xa9, 0xdd, 0x32
};
```

If you want to use ipv4, use following configuration.
```cpp
#define IPV4
//#define IPV6

uint8_t remote_ip[4] = {192, 168, 11, 4}; // The IP to be ping
```


## Step 3: Build

1. After completing the ping example configuration, click 'build' in the status bar at the bottom of Visual Studio Code or press the 'F7' button on the keyboard to build.

2. When the build is completed, 'ping_client.uf2' is generated in 'WIZnet-PICO-PING-C/build/examples/ping_client/' directory.



## Step 4: Upload and Run

1. While pressing the BOOTSEL button of the Pico power on the board, the USB mass storage 'RPI-RP2' is automatically mounted.

2. Drag and drop 'ping_client.uf2' onto the USB mass storage device 'RPI-RP2'.

3. Connect to the serial COM port of the Pico with Tera Term.

![][link-connect_to_serial_com_port]

4. Reset your board.

5. If the ping_client example works correctly on the Pico, you will be able to check the network information of the respective board and see the ping success message.

![][link-connect_to_ping_client]

6. If there is a problem with the network or the connection is not established, an error message such as timeout will be displayed.

![][link-time_out_ping]

<!--
Link
-->

[link-connect_to_serial_com_port]: https://github.com/WIZnet-ioNIC/WIZnet-PICO-PING-C/blob/main/static/images/ping_client/connect_to_serial_com_port.png
[link-connect_to_ping_client]: https://github.com/WIZnet-ioNIC/WIZnet-PICO-PING-C/blob/main/static/images/ping_client/connect_to_serial_com_port.png
[link-time_out_ping]: https://github.com/WIZnet-ioNIC/WIZnet-PICO-PING-C/blob/main/static/images/ping_client/time_out_ping.png
