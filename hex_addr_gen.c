//
// Created by Pavan Kumar  Paluri  on 1/18/20.
// Hex addr generator for Xen tracing event (TRC_SCHED__)

#include <stdio.h>


#define TRC_SCHED 0x0002f000 // xen scheduler trace hex val

// Trace subclass
#define TRC_SUBCLS_SHIFT 12

// Scheduler specific hex
#define TRC_SCHED_MIN 0x00021000
#define TRC_SCHED_CLASS 0x00022000
#define TRC_SCHED_VERBOSE 0x00028000

#define TRC_SCHED_ID_BITS 3
#define TRC_SCHED_ID_SHIFT (TRC_SUBCLS_SHIFT - TRC_SCHED_ID_BITS)

#define TRC_SCHED_ID_MASK (((1UL << TRC_SCHED_ID_BITS) - 1) << TRC_SCHED_ID_SHIFT)

#define TRC_SCHED_EVT_MASK (~(TRC_SCHED_ID_MASK))

// verbose testing event
#define TRC_SCHED_SHUTDOWN_CODE (TRC_SCHED_VERBOSE + 16)

// sample RTDS tracing event to obtain desired hex addrs
#define TRC_SCHED_RTDS 4
#define TRC_SCHED_AAF 6
#define TRC_SCHED_CSCHED2 1

// sched_start and sched_end events
#define TRC_SCHED_SCHED_START (TRC_SCHED_VERBOSE + 18)
#define TRC_SCHED_SCHED_END (TRC_SCHED_VERBOSE + 19)

// Per-scheduler tracing
#define TRC_SCHED_CLASS_EVT(_c, _e) \
  ((TRC_SCHED_CLASS | \
  ((TRC_SCHED_##_c << TRC_SCHED_ID_SHIFT) & TRC_SCHED_ID_MASK)) + \
  (_e & TRC_SCHED_EVT_MASK))

#define TRC_RTDS_SCHEDULE TRC_SCHED_CLASS_EVT(TRC_SCHED_RTDS, 6)

int main()
{
    printf("Hex addr of credit2 sched event is: %lx \n", TRC_SCHED_CLASS_EVT(CSCHED2, 21));
    printf("Hex addr of sched_start event is : %x\n", TRC_SCHED_SCHED_START);
    printf("Hex addr of sched_end event is : %x\n", TRC_SCHED_SCHED_END);
    printf("Hex addr of sched_shutdown event is: %x\n", TRC_SCHED_SHUTDOWN_CODE);
    return 0;
}
