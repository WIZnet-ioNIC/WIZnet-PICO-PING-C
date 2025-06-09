#include <stdio.h>
#include "port_common.h"
#include "wizchip_conf.h"
#include "wizchip_spi.h"
#include "socket.h"
#include "ping.h"

/* Clock */
#define PLL_SYS_KHZ (100 * 1000)

/* Buffer */
#define ETHERNET_BUF_MAX_SIZE (1024 * 2)
#define SOCKET_PING 2

#define IPV4
//#define IPV6

wiz_NetInfo net_info =
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

static uint8_t ethernet_buf[ETHERNET_BUF_MAX_SIZE] = {
    0,
};

uint8_t remote_ip[4] = {192, 168, 11, 4}; // The IP to be ping

uint8_t remote_ip6[16] = {
    0xfe, 0x80, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00,
    0xc0, 0x74, 0x7e, 0x0d,
    0xdb, 0xa9, 0xdd, 0x32
};

extern PINGMSGR PingRequest;
extern PINGMSGR PingReply;

static void set_clock_khz(void);

int main()
{
    set_clock_khz();

    stdio_init_all();     // Initialize the main control peripheral.

    sleep_ms(3000);
    wizchip_spi_initialize();
	wizchip_cris_initialize();
    wizchip_reset();
    wizchip_initialize(); // spi initialization
    wizchip_check();

    network_initialize(net_info);

    print_network_information(net_info); // Read back the configuration information and print it

    memset(&PingRequest, 0x0, sizeof(PINGMSGR));
    memset(&PingReply, 0x0, sizeof(PINGMSGR));

#if (_WIZCHIP_ == W6100 || _WIZCHIP_ == W6300)
    #ifdef IPV6
    set_ping_mode_w6x00(AS_IPV6);

    while (true)
    {
        do_ping(SOCKET_PING, remote_ip6); // Ping the target IP
    }

    #endif
#endif

    while (true)
    {
        do_ping(SOCKET_PING, remote_ip); // Ping the target IP
    }
}

static void set_clock_khz(void)
{
    // set a system clock frequency in khz
    set_sys_clock_khz(PLL_SYS_KHZ, true);

    // configure the specified clock
    clock_configure(
        clk_peri,
        0,                                                // No glitchless mux
        CLOCKS_CLK_PERI_CTRL_AUXSRC_VALUE_CLKSRC_PLL_SYS, // System PLL on AUX mux
        PLL_SYS_KHZ * 1000,                               // Input frequency
        PLL_SYS_KHZ * 1000                                // Output (must be same as no divider)
    );
}
