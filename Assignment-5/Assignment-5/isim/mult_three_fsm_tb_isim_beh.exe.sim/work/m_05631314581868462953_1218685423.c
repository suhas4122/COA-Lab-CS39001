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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/suhas/Desktop/Semester-5/COA/COA-Lab/Assignment-5/Assignment-5/mult_three_fsm.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};



static void Always_30_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3976);
    *((int *)t2) = 1;
    t3 = (t0 + 3440);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 1776U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(32, ng0);
    t11 = (t0 + 472);
    t12 = *((char **)t11);
    t11 = (t0 + 2336);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 2, 0LL);
    goto LAB8;

}

static void Always_37_1(char *t0)
{
    char t11[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;

LAB0:    t1 = (t0 + 3656U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3992);
    *((int *)t2) = 1;
    t3 = (t0 + 3688);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 2336);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t8, 32);
    if (t9 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB11;

LAB12:
LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(39, ng0);

LAB14:    xsi_set_current_line(40, ng0);
    t7 = ((char*)((ng1)));
    t10 = (t0 + 2176);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 1);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1616U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t3 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t3);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t2) != 0)
        goto LAB17;

LAB18:    t5 = (t12 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t5);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB19;

LAB20:    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t5);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t5) > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t12) > 0)
        goto LAB25;

LAB26:    memcpy(t11, t10, 8);

LAB27:    t7 = (t0 + 2496);
    xsi_vlogvar_assign_value(t7, t11, 0, 0, 2);
    goto LAB13;

LAB9:    xsi_set_current_line(43, ng0);

LAB28:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 2176);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1616U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t3 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t3);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t2) != 0)
        goto LAB31;

LAB32:    t5 = (t12 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t5);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB33;

LAB34:    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t5);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t5) > 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t12) > 0)
        goto LAB39;

LAB40:    memcpy(t11, t10, 8);

LAB41:    t7 = (t0 + 2496);
    xsi_vlogvar_assign_value(t7, t11, 0, 0, 2);
    goto LAB13;

LAB11:    xsi_set_current_line(47, ng0);

LAB42:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 2176);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1616U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t3 + 4);
    t13 = *((unsigned int *)t2);
    t14 = (~(t13));
    t15 = *((unsigned int *)t3);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t2) != 0)
        goto LAB45;

LAB46:    t5 = (t12 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t5);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB47;

LAB48:    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t5);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t5) > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t12) > 0)
        goto LAB53;

LAB54:    memcpy(t11, t10, 8);

LAB55:    t7 = (t0 + 2496);
    xsi_vlogvar_assign_value(t7, t11, 0, 0, 2);
    goto LAB13;

LAB15:    *((unsigned int *)t12) = 1;
    goto LAB18;

LAB17:    t4 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB18;

LAB19:    t7 = (t0 + 608);
    t8 = *((char **)t7);
    goto LAB20;

LAB21:    t7 = (t0 + 472);
    t10 = *((char **)t7);
    goto LAB22;

LAB23:    xsi_vlog_unsigned_bit_combine(t11, 32, t8, 32, t10, 32);
    goto LAB27;

LAB25:    memcpy(t11, t8, 8);
    goto LAB27;

LAB29:    *((unsigned int *)t12) = 1;
    goto LAB32;

LAB31:    t4 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB32;

LAB33:    t7 = (t0 + 472);
    t8 = *((char **)t7);
    goto LAB34;

LAB35:    t7 = (t0 + 744);
    t10 = *((char **)t7);
    goto LAB36;

LAB37:    xsi_vlog_unsigned_bit_combine(t11, 32, t8, 32, t10, 32);
    goto LAB41;

LAB39:    memcpy(t11, t8, 8);
    goto LAB41;

LAB43:    *((unsigned int *)t12) = 1;
    goto LAB46;

LAB45:    t4 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB46;

LAB47:    t7 = (t0 + 744);
    t8 = *((char **)t7);
    goto LAB48;

LAB49:    t7 = (t0 + 608);
    t10 = *((char **)t7);
    goto LAB50;

LAB51:    xsi_vlog_unsigned_bit_combine(t11, 32, t8, 32, t10, 32);
    goto LAB55;

LAB53:    memcpy(t11, t8, 8);
    goto LAB55;

}


extern void work_m_05631314581868462953_1218685423_init()
{
	static char *pe[] = {(void *)Always_30_0,(void *)Always_37_1};
	xsi_register_didat("work_m_05631314581868462953_1218685423", "isim/mult_three_fsm_tb_isim_beh.exe.sim/work/m_05631314581868462953_1218685423.didat");
	xsi_register_executes(pe);
}
