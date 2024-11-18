#include <stdio.h>
#include "port_common.h"
#include "wizchip_conf.h"
#include "w5x00_spi.h"
#include "socket.h"
#include "ping.h"

/* Clock */
#define PLL_SYS_KHZ (133 * 1000)

/* Buffer */
#define ETHERNET_BUF_MAX_SIZE (1024 * 2)
#define SOCKET_PING 2

wiz_NetInfo net_info = {
    .mac = {0x00, 0x08, 0xdc, 0x16, 0xed, 0x2e}, // Define MAC variables
    .ip = {192, 168, 11, 19},                     // Define IP variables
    .sn = {255, 255, 255, 0},                    // Define subnet variables
    .gw = {192, 168, 11, 1},                      // Define gateway variables
    .dns = {168, 126, 63, 1},                         // Define DNS  variables
    .dhcp = NETINFO_STATIC};                       // Define the DNCP mode

static uint8_t ethernet_buf[ETHERNET_BUF_MAX_SIZE] = {
    0,
};
static uint8_t remote_ip[4] = {192, 168, 11, 2}; // The IP to be ping

static void set_clock_khz(void);

int main()
{
    set_clock_khz();

    stdio_init_all();     // Initialize the main control peripheral.
    wizchip_spi_initialize();
	wizchip_cris_initialize();
    wizchip_reset();
    wizchip_initialize(); // spi initialization
    wizchip_check();

    network_initialize(net_info);

    print_network_information(net_info); // Read back the configuration information and print it

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
