#ifndef _PING_H_
#define _PING_H_


#include <stdint.h>

#define BUF_LEN            128
#define PING_REQUEST       8
#define PING_REPLY         0
#define CODE_ZERO          0

#define SOCKET_ERROR       1
#define TIMEOUT_ERROR      2
#define SUCCESS            3
#define REPLY_ERROR        4

#define PING_INT       0x01
#define ARP_INT        0x02
#define TIMEOUT_INT    0x04


extern uint8_t req;
extern uint8_t rep;

typedef struct pingmsg
{
  uint8_t  Type;              // 0 - Ping Reply, 8 - Ping Request
  uint8_t  Code;              // Always 0
  uint16_t  CheckSum;         // Check sum
  uint16_t  ID;               // Identification
  uint16_t  SeqNum;           // Sequence Number
  int8_t  Data[BUF_LEN];    // Ping Data  : 1452 = IP RAW MTU - sizeof(Type+Code+CheckSum+ID+SeqNum)
} PINGMSGR;


void ping_auto(uint8_t sn, uint8_t* addr);
uint8_t ping_request(uint8_t sn, uint8_t* addr);
uint8_t ping_reply(uint8_t s, uint8_t *addr,  uint16_t rlen);
void do_ping(uint8_t sn, uint8_t* ip);

/* By SCOKET-less PING */
void SLping(uint8_t* remote_ip, uint16_t ping_count);


#endif


