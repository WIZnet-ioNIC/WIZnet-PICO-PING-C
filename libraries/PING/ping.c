#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "socket.h"
#include "ping.h"
#include "pico/time.h"

#define PING_DEBUG

PINGMSGR PingRequest;
PINGMSGR PingReply;

static uint16_t RandomID = 0x1234;
static uint16_t RandomSeqNum = 0x4321;
uint8_t ping_reply_received = 0;
uint8_t req = 0;
uint8_t rep = 0;

/**
*@brief calculates the string check value
*@param data to be converted
*@return Indicates the check value
*/
static uint16_t checksum(uint8_t *src, uint16_t len)
{
    u_int sum, tsum, i, j;
    u_long lsum;

    j = len >> 1;

    lsum = 0;

    for (i = 0; i < j; i++)
    {
        tsum = src[i * 2];
        tsum = tsum << 8;
        tsum += src[i * 2 + 1];
        lsum += tsum;
    }

    if (len % 2)
    {
        tsum = src[i * 2];
        lsum += (tsum << 8);
    }

    sum = lsum;
    sum = ~(sum + (lsum >> 16));
    return (u_short)sum;
}

/**
*@brief  16-bit character high-8-bit low-8-bit conversion
*@param  i:The data to be converted
*@return The converted data
*/
static uint16_t swaps(uint16_t i)
{
    uint16_t ret = 0;
    ret = (i & 0xFF) << 8;
    ret |= ((i >> 8) & 0xFF);
    return ret;
}

/**
*@brief  Converts a host-mode unsigned short data to big-endian TCP/IP network byte format data.
*@param  The data to be converted
*@return Big-endian data
*/ 
static uint16_t htons(uint16_t hostshort)
{
    /**< A 16-bit number in host byte order.  */
#if (SYSTEM_ENDIAN == _ENDIAN_LITTLE_)
    return swaps(hostshort);
#else
    return hostshort;
#endif
}

/* Ping the Internet automatically. */
void ping_auto(uint8_t sn, uint8_t *addr)
{
    int32_t len = 0;
    uint8_t cnt = 0;
    uint8_t i;

    for (i = 0; i < 10; i++)
    {
        if (req == rep && req == 4)
            break;
        switch (getSn_SR(sn))
        {
        case SOCK_IPRAW:
            ping_request(sn, addr);
            req++;
            sleep_ms(50);
            while (1)
            {
                if ((len = getSn_RX_RSR(sn)) > 0)
                {
                    ping_reply(sn, addr, len);
                    sleep_ms(50);
                    rep++;
                    break;
                }
                else if (cnt > 200)
                {
                    printf("Request Time out.\r\n");
                    cnt = 0;
                    break;
                }
                else
                {
                    cnt++;
                    sleep_ms(50);
                }
            }
            break;
        case SOCK_CLOSED:
            close(sn);
            // setSn_PROTO(sn, IPPROTO_ICMP);
            IINCHIP_WRITE(Sn_PROTO(sn), IPPROTO_ICMP);
 
            if (socket(sn, Sn_MR_IPRAW, 3000, 0) != 0)
            {
            }
            while (getSn_SR(sn) != SOCK_IPRAW)
                ;
            sleep_ms(2000);
        default:
            break;
        }
#ifdef PING_DEBUG
        if (rep != 0)
        {
            printf(" Ping Request = %d, PING_Reply = %d\r\n", req, rep);
            if (rep == req)
                printf(" PING SUCCESS\r\n ");
            else
                printf(" REPLY_ERROR\r\n ");
        }
#endif
        // if(rep==4)break;
    }
}

/* ping response. */
uint8_t ping_request(uint8_t sn, uint8_t *addr)
{
    uint16_t i;
    int32_t t;
    ping_reply_received = 0;
    PingRequest.Type = PING_REQUEST;    /*Ping-Request*/
    PingRequest.Code = CODE_ZERO;       /*Always '0'*/
    PingRequest.ID = htons(RandomID++); /*Set the ping response ID to a random integer variable*/
    PingRequest.SeqNum = htons(RandomSeqNum++);
    for (i = 0; i < BUF_LEN; i++)
    {
        PingRequest.Data[i] = (i) % 8;
    }
    PingRequest.CheckSum = 0;
    PingRequest.CheckSum = htons(checksum((uint8_t *)&PingRequest, sizeof(PingRequest)));
    t = sendto(sn, (uint8_t *)&PingRequest, sizeof(PingRequest), addr, 3000);
    if (t == 0)
    {
        printf("\r\n Fail to send ping-reply packet  r\n");
    }
    else
    {
        printf("  Ping: %d.%d.%d.%d  \r\n", (addr[0]), (addr[1]), (addr[2]), (addr[3]));
    }
    return 0;
}

/* Resolving ping reply. */
uint8_t ping_reply(uint8_t s, uint8_t *addr, uint16_t rlen)
{
    uint16_t tmp_checksum;
    uint16_t len;
    uint16_t i;
    uint8_t data_buf[128];

    uint16_t port = 3000;
    PINGMSGR PingReply;
    len = recvfrom(s, (uint8_t *)data_buf, rlen, addr, &port); /*Receive data from the destination*/
    if (data_buf[0] == PING_REPLY)
    {
        PingReply.Type = data_buf[0];
        PingReply.Code = data_buf[1];
        PingReply.CheckSum = (data_buf[3] << 8) + data_buf[2];
        PingReply.ID = (data_buf[5] << 8) + data_buf[4];
        PingReply.SeqNum = (data_buf[7] << 8) + data_buf[6];

        for (i = 0; i < len - 8; i++)
        {
            PingReply.Data[i] = data_buf[8 + i];
        }
        tmp_checksum = ~checksum(data_buf, len); /*Check the number of ping replies*/
        if (tmp_checksum != 0xffff)
            printf("tmp_checksum = %x\r\n", tmp_checksum);
        else
        {
            printf(" Reply from %d.%d.%d.%d: ID=%x bytes=%d \r\n",
                   (addr[0]), (addr[1]), (addr[2]), (addr[3]), htons(PingReply.ID), (rlen + 6));
            ping_reply_received = 1; /*When exiting the ping reply cycle, set the ping reply flag to 1*/
        }
    }
    else if (data_buf[0] == PING_REQUEST)
    {
        PingReply.Code = data_buf[1];
        PingReply.Type = data_buf[2];
        PingReply.CheckSum = (data_buf[3] << 8) + data_buf[2];
        PingReply.ID = (data_buf[5] << 8) + data_buf[4];
        PingReply.SeqNum = (data_buf[7] << 8) + data_buf[6];
        for (i = 0; i < len - 8; i++)
        {
            PingReply.Data[i] = data_buf[8 + i];
        }
        tmp_checksum = PingReply.CheckSum; /*Check the number of ping replies*/
        PingReply.CheckSum = 0;
        if (tmp_checksum != PingReply.CheckSum)
        {
            printf(" \n CheckSum is in correct %x shold be %x \n", (tmp_checksum), htons(PingReply.CheckSum));
        }
        else
        {
        }
        printf("  Request from %d.%d.%d.%d  ID:%x SeqNum:%x  :data size %d bytes\r\n",
               (addr[0]), (addr[1]), (addr[2]), (addr[3]), (PingReply.ID), (PingReply.SeqNum), (rlen + 6));
        ping_reply_received = 1; /* When exiting the ping reply cycle, set the ping reply flag to 1 */
    }
    else
    {
        printf(" Unkonwn msg. \n");
    }
    return 0;
}

void do_ping(uint8_t sn, uint8_t *ip)
{
    if (req < 4)
    {
        printf("------------------PING test start-----------------------\r\n");
        sleep_ms(1000);
        ping_auto(sn, ip);
    }
    else if (req == 4)
        close(sn);
}
