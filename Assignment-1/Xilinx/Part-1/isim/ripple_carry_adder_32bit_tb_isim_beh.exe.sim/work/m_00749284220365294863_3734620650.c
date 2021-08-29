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
static const char *ng0 = "A = %b, B = %b, Ci = %b, S = %b, Co = %b";
static const char *ng1 = "/home/suhas/Desktop/Semester-5/COA/COAA-Lab-Sem-5/Assignment-1/Xilinx/Part-1/ripple_carry_adder_32bit_tb.v";
static unsigned int ng2[] = {1246382666U, 0U};
static unsigned int ng3[] = {1532713819U, 0U};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {522133279U, 0U};
static unsigned int ng6[] = {3772834016U, 0U};
static unsigned int ng7[] = {1U, 0U};
static unsigned int ng8[] = {2054847098U, 0U};
static unsigned int ng9[] = {3334915782U, 0U};

void Monitor_20_1(char *);
void Monitor_20_1(char *);


static void Monitor_20_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 1608);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1928);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t0 + 1048U);
    t11 = *((char **)t10);
    t10 = (t0 + 1208U);
    t12 = *((char **)t10);
    xsi_vlogfile_write(1, 0, 3, ng0, 6, t0, (char)118, t3, 32, (char)118, t6, 32, (char)118, t9, 1, (char)118, t11, 32, (char)118, t12, 1);

LAB1:    return;
}

static void Initial_19_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 2840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng1);

LAB4:    xsi_set_current_line(20, ng1);
    Monitor_20_1(t0);
    xsi_set_current_line(21, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(22, ng1);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(23, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(24, ng1);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(25, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(26, ng1);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(27, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(28, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(29, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(30, ng1);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(31, ng1);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(32, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

}

void Monitor_20_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 2896);
    t2 = (t0 + 3408);
    xsi_vlogfile_monitor((void *)Monitor_20_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00749284220365294863_3734620650_init()
{
	static char *pe[] = {(void *)Initial_19_0,(void *)Monitor_20_1};
	xsi_register_didat("work_m_00749284220365294863_3734620650", "isim/ripple_carry_adder_32bit_tb_isim_beh.exe.sim/work/m_00749284220365294863_3734620650.didat");
	xsi_register_executes(pe);
}
