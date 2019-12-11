/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/nish/KITCODE/lcd_3a_200a/adc3204 - Copy/lcd_3a_adc3204/adc_12bit/sipo.vhd";



static void work_a_1408313569_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 752U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 1724);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(22, ng0);
    t4 = (t0 + 868U);
    t8 = *((char **)t4);
    t9 = (11 - 10);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t4 = (t8 + t11);
    t12 = (t0 + 1768);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 11U);
    xsi_driver_first_trans_delta(t12, 0U, 11U, 0LL);
    xsi_set_current_line(23, ng0);
    t2 = (t0 + 592U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 1768);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t1;
    xsi_driver_first_trans_delta(t2, 11U, 1, 0LL);
    xsi_set_current_line(24, ng0);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t2 = (t0 + 1804);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 12U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 776U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}


extern void work_a_1408313569_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1408313569_3212880686_p_0};
	xsi_register_didat("work_a_1408313569_3212880686", "isim/SIPO_code_isim_beh.exe.sim/work/a_1408313569_3212880686.didat");
	xsi_register_executes(pe);
}
