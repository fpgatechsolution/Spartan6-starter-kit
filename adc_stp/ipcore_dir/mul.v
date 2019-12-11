////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: mul.v
// /___/   /\     Timestamp: Sun Aug 06 22:59:10 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog "H:/adc3204 - Copy/lcd_3a_adc3204/adc_12bit/ipcore_dir/tmp/_cg/mul.ngc" "H:/adc3204 - Copy/lcd_3a_adc3204/adc_12bit/ipcore_dir/tmp/_cg/mul.v" 
// Device	: 3s200avq100-4
// Input file	: H:/adc3204 - Copy/lcd_3a_adc3204/adc_12bit/ipcore_dir/tmp/_cg/mul.ngc
// Output file	: H:/adc3204 - Copy/lcd_3a_adc3204/adc_12bit/ipcore_dir/tmp/_cg/mul.v
// # of Modules	: 1
// Design Name	: mul
// Xilinx        : C:\Xilinx\14.6\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mul (
  clk, result, a, b
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [23 : 0] result;
  input [23 : 0] a;
  input [23 : 0] b;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire \NLW_blk00000003_BCIN<17>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<16>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<15>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<14>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<13>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<12>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<11>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<10>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<9>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<8>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<7>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<6>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<5>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<4>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<3>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<2>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<1>_UNCONNECTED ;
  wire \NLW_blk00000003_BCIN<0>_UNCONNECTED ;
  wire \NLW_blk00000003_P<35>_UNCONNECTED ;
  wire \NLW_blk00000003_P<34>_UNCONNECTED ;
  wire \NLW_blk00000003_P<33>_UNCONNECTED ;
  wire \NLW_blk00000003_P<32>_UNCONNECTED ;
  wire \NLW_blk00000003_P<31>_UNCONNECTED ;
  wire \NLW_blk00000003_P<30>_UNCONNECTED ;
  wire \NLW_blk00000003_P<29>_UNCONNECTED ;
  wire \NLW_blk00000003_P<28>_UNCONNECTED ;
  wire \NLW_blk00000003_P<27>_UNCONNECTED ;
  wire \NLW_blk00000003_P<26>_UNCONNECTED ;
  wire \NLW_blk00000003_P<25>_UNCONNECTED ;
  wire \NLW_blk00000003_P<24>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<0>_UNCONNECTED ;
  wire NLW_blk0000002a_Q_UNCONNECTED;
  wire NLW_blk0000002b_Q_UNCONNECTED;
  wire NLW_blk0000002c_Q_UNCONNECTED;
  wire NLW_blk0000002d_Q_UNCONNECTED;
  wire NLW_blk0000002e_Q_UNCONNECTED;
  wire NLW_blk0000002f_Q_UNCONNECTED;
  wire NLW_blk00000030_Q_UNCONNECTED;
  wire NLW_blk00000031_Q_UNCONNECTED;
  wire NLW_blk00000032_Q_UNCONNECTED;
  wire NLW_blk00000033_Q_UNCONNECTED;
  wire NLW_blk0000004d_O_UNCONNECTED;
  wire [11 : 0] \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op ;
  wire [10 : 0] \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op ;
  assign
    result[23] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ,
    result[22] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [11],
    result[21] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [10],
    result[20] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [9],
    result[19] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [8],
    result[18] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7],
    result[17] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6],
    result[16] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5],
    result[15] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4],
    result[14] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3],
    result[13] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2],
    result[12] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1],
    result[11] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0],
    result[10] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10],
    result[9] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9],
    result[8] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8],
    result[7] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7],
    result[6] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6],
    result[5] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5],
    result[4] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4],
    result[3] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3],
    result[2] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2],
    result[1] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1],
    result[0] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0];
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  MULT18X18SIO #(
    .AREG ( 0 ),
    .BREG ( 0 ),
    .PREG ( 1 ),
    .B_INPUT ( "DIRECT" ))
  blk00000003 (
    .CEA(sig00000002),
    .CEB(sig00000002),
    .CEP(sig00000002),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTP(sig00000001),
    .A({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000002, a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], 
a[2], a[1], a[0]}),
    .B({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000002, b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], 
b[2], b[1], b[0]}),
    .BCIN({\NLW_blk00000003_BCIN<17>_UNCONNECTED , \NLW_blk00000003_BCIN<16>_UNCONNECTED , \NLW_blk00000003_BCIN<15>_UNCONNECTED , 
\NLW_blk00000003_BCIN<14>_UNCONNECTED , \NLW_blk00000003_BCIN<13>_UNCONNECTED , \NLW_blk00000003_BCIN<12>_UNCONNECTED , 
\NLW_blk00000003_BCIN<11>_UNCONNECTED , \NLW_blk00000003_BCIN<10>_UNCONNECTED , \NLW_blk00000003_BCIN<9>_UNCONNECTED , 
\NLW_blk00000003_BCIN<8>_UNCONNECTED , \NLW_blk00000003_BCIN<7>_UNCONNECTED , \NLW_blk00000003_BCIN<6>_UNCONNECTED , 
\NLW_blk00000003_BCIN<5>_UNCONNECTED , \NLW_blk00000003_BCIN<4>_UNCONNECTED , \NLW_blk00000003_BCIN<3>_UNCONNECTED , 
\NLW_blk00000003_BCIN<2>_UNCONNECTED , \NLW_blk00000003_BCIN<1>_UNCONNECTED , \NLW_blk00000003_BCIN<0>_UNCONNECTED }),
    .P({\NLW_blk00000003_P<35>_UNCONNECTED , \NLW_blk00000003_P<34>_UNCONNECTED , \NLW_blk00000003_P<33>_UNCONNECTED , 
\NLW_blk00000003_P<32>_UNCONNECTED , \NLW_blk00000003_P<31>_UNCONNECTED , \NLW_blk00000003_P<30>_UNCONNECTED , \NLW_blk00000003_P<29>_UNCONNECTED , 
\NLW_blk00000003_P<28>_UNCONNECTED , \NLW_blk00000003_P<27>_UNCONNECTED , \NLW_blk00000003_P<26>_UNCONNECTED , \NLW_blk00000003_P<25>_UNCONNECTED , 
\NLW_blk00000003_P<24>_UNCONNECTED , sig000000ac, sig000000ab, sig000000aa, sig000000a9, sig000000a7, sig000000a6, sig000000a5, sig000000a4, 
sig000000a3, sig000000a2, sig000000a1, sig000000a0, sig0000009f, sig0000009e, sig000000b4, sig000000b3, sig000000b2, sig000000b1, sig000000b0, 
sig000000af, sig000000ae, sig000000ad, sig000000a8, sig0000009d}),
    .BCOUT({\NLW_blk00000003_BCOUT<17>_UNCONNECTED , \NLW_blk00000003_BCOUT<16>_UNCONNECTED , \NLW_blk00000003_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<14>_UNCONNECTED , \NLW_blk00000003_BCOUT<13>_UNCONNECTED , \NLW_blk00000003_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<11>_UNCONNECTED , \NLW_blk00000003_BCOUT<10>_UNCONNECTED , \NLW_blk00000003_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<8>_UNCONNECTED , \NLW_blk00000003_BCOUT<7>_UNCONNECTED , \NLW_blk00000003_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<5>_UNCONNECTED , \NLW_blk00000003_BCOUT<4>_UNCONNECTED , \NLW_blk00000003_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<2>_UNCONNECTED , \NLW_blk00000003_BCOUT<1>_UNCONNECTED , \NLW_blk00000003_BCOUT<0>_UNCONNECTED })
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .D(sig00000110),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [10])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .D(sig00000067),
    .R(sig00000001),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op )
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .D(sig00000111),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [11])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .D(sig000000eb),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .D(sig000000ea),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .D(sig000000ec),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .D(sig000000dd),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .D(sig000000dc),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .D(sig000000e9),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .D(sig000000db),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .D(sig000000da),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(clk),
    .D(sig000000d9),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(clk),
    .D(sig000000d8),
    .R(sig0000006c),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(clk),
    .D(sig00000119),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [8])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(clk),
    .D(sig00000118),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(clk),
    .D(sig0000011a),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [9])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000014 (
    .C(clk),
    .D(sig00000117),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000015 (
    .C(clk),
    .D(sig00000116),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000016 (
    .C(clk),
    .D(sig00000115),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000017 (
    .C(clk),
    .D(sig00000113),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000018 (
    .C(clk),
    .D(sig00000112),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000019 (
    .C(clk),
    .D(sig00000114),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000001a (
    .C(clk),
    .D(sig0000010f),
    .R(sig00000069),
    .S(sig00000068),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000001b (
    .C(clk),
    .D(sig000000ed),
    .R(sig0000006b),
    .S(sig0000006a),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001c (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ac),
    .Q(sig0000011f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001d (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ab),
    .Q(sig0000011e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001e (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000aa),
    .Q(sig0000011d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001f (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a9),
    .Q(sig0000011c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a7),
    .Q(sig00000128)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a6),
    .Q(sig00000127)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a5),
    .Q(sig00000126)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a4),
    .Q(sig00000125)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a3),
    .Q(sig00000124)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a2),
    .Q(sig00000123)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a1),
    .Q(sig00000122)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a0),
    .Q(sig00000121)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009f),
    .Q(sig00000120)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009e),
    .Q(sig0000011b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b4),
    .Q(NLW_blk0000002a_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b3),
    .Q(NLW_blk0000002b_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b2),
    .Q(NLW_blk0000002c_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b1),
    .Q(NLW_blk0000002d_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b0),
    .Q(NLW_blk0000002e_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000af),
    .Q(NLW_blk0000002f_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ae),
    .Q(NLW_blk00000030_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ad),
    .Q(NLW_blk00000031_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a8),
    .Q(NLW_blk00000032_Q_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009d),
    .Q(NLW_blk00000033_Q_UNCONNECTED)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000034 (
    .I0(sig000000b3),
    .I1(sig000000b4),
    .O(sig0000009c)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000035 (
    .I0(sig0000009d),
    .I1(sig000000a8),
    .I2(sig000000ad),
    .I3(sig000000ae),
    .O(sig0000009a)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000036 (
    .I0(sig000000af),
    .I1(sig000000b0),
    .I2(sig000000b1),
    .I3(sig000000b2),
    .O(sig0000009b)
  );
  XORCY   blk00000037 (
    .CI(sig00000097),
    .LI(sig00000002),
    .O(sig00000098)
  );
  MUXCY   blk00000038 (
    .CI(sig00000096),
    .DI(sig00000001),
    .S(sig0000009c),
    .O(sig00000097)
  );
  MUXCY   blk00000039 (
    .CI(sig00000095),
    .DI(sig00000001),
    .S(sig0000009b),
    .O(sig00000096)
  );
  MUXCY   blk0000003a (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000009a),
    .O(sig00000095)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000098),
    .Q(sig00000099)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f4),
    .Q(sig00000101)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f9),
    .Q(sig000000ed)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f8),
    .Q(sig000000ec)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f7),
    .Q(sig000000eb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f6),
    .Q(sig000000ea)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000f5),
    .Q(sig000000e9)
  );
  MUXCY   blk00000042 (
    .CI(sig00000102),
    .DI(sig00000001),
    .S(sig00000108),
    .O(sig000000ee)
  );
  XORCY   blk00000043 (
    .CI(sig00000102),
    .LI(sig00000108),
    .O(sig000000f5)
  );
  MUXCY   blk00000044 (
    .CI(sig000000ee),
    .DI(sig00000001),
    .S(sig00000109),
    .O(sig000000ef)
  );
  XORCY   blk00000045 (
    .CI(sig000000ee),
    .LI(sig00000109),
    .O(sig000000f6)
  );
  MUXCY   blk00000046 (
    .CI(sig000000ef),
    .DI(sig00000001),
    .S(sig0000010a),
    .O(sig000000f0)
  );
  XORCY   blk00000047 (
    .CI(sig000000ef),
    .LI(sig0000010a),
    .O(sig000000f7)
  );
  MUXCY   blk00000048 (
    .CI(sig000000f0),
    .DI(sig00000001),
    .S(sig0000010b),
    .O(sig000000f1)
  );
  XORCY   blk00000049 (
    .CI(sig000000f0),
    .LI(sig0000010b),
    .O(sig000000f8)
  );
  MUXCY   blk0000004a (
    .CI(sig000000f1),
    .DI(sig00000001),
    .S(sig0000010c),
    .O(sig000000f2)
  );
  XORCY   blk0000004b (
    .CI(sig000000f1),
    .LI(sig0000010c),
    .O(sig000000f9)
  );
  MUXCY   blk0000004c (
    .CI(sig000000f2),
    .DI(sig00000002),
    .S(sig0000010e),
    .O(sig000000f3)
  );
  XORCY   blk0000004d (
    .CI(sig000000f2),
    .LI(sig0000010e),
    .O(NLW_blk0000004d_O_UNCONNECTED)
  );
  XORCY   blk0000004e (
    .CI(sig000000f3),
    .LI(sig00000001),
    .O(sig000000f4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e8),
    .Q(sig000000dd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e7),
    .Q(sig000000dc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e6),
    .Q(sig000000db)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e5),
    .Q(sig000000da)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e4),
    .Q(sig000000d9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000e3),
    .Q(sig000000d8)
  );
  MUXCY   blk00000055 (
    .CI(sig0000010d),
    .DI(sig00000001),
    .S(sig000000fd),
    .O(sig000000de)
  );
  XORCY   blk00000056 (
    .CI(sig0000010d),
    .LI(sig000000fd),
    .O(sig000000e3)
  );
  MUXCY   blk00000057 (
    .CI(sig000000de),
    .DI(sig00000001),
    .S(sig00000103),
    .O(sig000000df)
  );
  XORCY   blk00000058 (
    .CI(sig000000de),
    .LI(sig00000103),
    .O(sig000000e4)
  );
  MUXCY   blk00000059 (
    .CI(sig000000df),
    .DI(sig00000001),
    .S(sig00000104),
    .O(sig000000e0)
  );
  XORCY   blk0000005a (
    .CI(sig000000df),
    .LI(sig00000104),
    .O(sig000000e5)
  );
  MUXCY   blk0000005b (
    .CI(sig000000e0),
    .DI(sig00000001),
    .S(sig00000105),
    .O(sig000000e1)
  );
  XORCY   blk0000005c (
    .CI(sig000000e0),
    .LI(sig00000105),
    .O(sig000000e6)
  );
  MUXCY   blk0000005d (
    .CI(sig000000e1),
    .DI(sig00000001),
    .S(sig00000106),
    .O(sig000000e2)
  );
  XORCY   blk0000005e (
    .CI(sig000000e1),
    .LI(sig00000106),
    .O(sig000000e7)
  );
  MUXCY   blk0000005f (
    .CI(sig000000e2),
    .DI(sig00000001),
    .S(sig00000107),
    .O(sig00000102)
  );
  XORCY   blk00000060 (
    .CI(sig000000e2),
    .LI(sig00000107),
    .O(sig000000e8)
  );
  MUXCY   blk00000061 (
    .CI(sig00000101),
    .DI(sig00000001),
    .S(sig000000b5),
    .O(sig000000c2)
  );
  XORCY   blk00000062 (
    .CI(sig00000101),
    .LI(sig000000b5),
    .O(sig0000010f)
  );
  MUXCY   blk00000063 (
    .CI(sig000000c2),
    .DI(sig00000001),
    .S(sig000000b7),
    .O(sig000000c3)
  );
  XORCY   blk00000064 (
    .CI(sig000000c2),
    .LI(sig000000b7),
    .O(sig00000112)
  );
  MUXCY   blk00000065 (
    .CI(sig000000c3),
    .DI(sig00000001),
    .S(sig000000b8),
    .O(sig000000c4)
  );
  XORCY   blk00000066 (
    .CI(sig000000c3),
    .LI(sig000000b8),
    .O(sig00000113)
  );
  MUXCY   blk00000067 (
    .CI(sig000000c4),
    .DI(sig00000001),
    .S(sig000000b9),
    .O(sig000000c5)
  );
  XORCY   blk00000068 (
    .CI(sig000000c4),
    .LI(sig000000b9),
    .O(sig00000114)
  );
  MUXCY   blk00000069 (
    .CI(sig000000c5),
    .DI(sig00000001),
    .S(sig000000ba),
    .O(sig000000c6)
  );
  XORCY   blk0000006a (
    .CI(sig000000c5),
    .LI(sig000000ba),
    .O(sig00000115)
  );
  MUXCY   blk0000006b (
    .CI(sig000000c6),
    .DI(sig00000001),
    .S(sig000000bb),
    .O(sig000000c7)
  );
  XORCY   blk0000006c (
    .CI(sig000000c6),
    .LI(sig000000bb),
    .O(sig00000116)
  );
  MUXCY   blk0000006d (
    .CI(sig000000c7),
    .DI(sig00000001),
    .S(sig000000bc),
    .O(sig000000c8)
  );
  XORCY   blk0000006e (
    .CI(sig000000c7),
    .LI(sig000000bc),
    .O(sig00000117)
  );
  MUXCY   blk0000006f (
    .CI(sig000000c8),
    .DI(sig00000001),
    .S(sig000000bd),
    .O(sig000000c9)
  );
  XORCY   blk00000070 (
    .CI(sig000000c8),
    .LI(sig000000bd),
    .O(sig00000118)
  );
  MUXCY   blk00000071 (
    .CI(sig000000c9),
    .DI(sig00000001),
    .S(sig000000be),
    .O(sig000000ca)
  );
  XORCY   blk00000072 (
    .CI(sig000000c9),
    .LI(sig000000be),
    .O(sig00000119)
  );
  MUXCY   blk00000073 (
    .CI(sig000000ca),
    .DI(sig00000001),
    .S(sig000000bf),
    .O(sig000000c0)
  );
  XORCY   blk00000074 (
    .CI(sig000000ca),
    .LI(sig000000bf),
    .O(sig0000011a)
  );
  MUXCY   blk00000075 (
    .CI(sig000000c0),
    .DI(sig00000001),
    .S(sig000000b6),
    .O(sig000000c1)
  );
  XORCY   blk00000076 (
    .CI(sig000000c0),
    .LI(sig000000b6),
    .O(sig00000110)
  );
  XORCY   blk00000077 (
    .CI(sig000000c1),
    .LI(sig00000100),
    .O(sig00000111)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000078 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000032),
    .Q(sig000000cb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000079 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000033),
    .Q(sig000000cc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007a (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000036),
    .Q(sig000000cf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007b (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000037),
    .Q(sig000000d0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007c (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000038),
    .Q(sig000000d1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007d (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000039),
    .Q(sig000000d2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007e (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000003a),
    .Q(sig000000d3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000007f (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000003b),
    .Q(sig000000d4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000080 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000003c),
    .Q(sig000000d5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000081 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000003d),
    .Q(sig000000d6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000082 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000034),
    .Q(sig000000cd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000083 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000035),
    .Q(sig000000ce)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000084 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000002),
    .Q(sig000000d7)
  );
  MUXCY   blk00000085 (
    .CI(sig000000fb),
    .DI(sig00000001),
    .S(sig000000fe),
    .O(sig0000010d)
  );
  MUXCY   blk00000086 (
    .CI(sig000000fa),
    .DI(sig00000002),
    .S(sig000000ff),
    .O(sig000000fb)
  );
  MUXCY   blk00000087 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000fc),
    .O(sig000000fa)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000088 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000056),
    .Q(sig00000057)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000089 (
    .C(clk),
    .D(sig00000057),
    .Q(sig00000031)
  );
  MUXCY   blk0000008a (
    .CI(sig00000002),
    .DI(b[11]),
    .S(sig00000073),
    .O(sig0000004d)
  );
  XORCY   blk0000008b (
    .CI(sig00000002),
    .LI(sig00000073),
    .O(sig00000058)
  );
  MUXCY   blk0000008c (
    .CI(sig0000004d),
    .DI(b[12]),
    .S(sig00000076),
    .O(sig0000004e)
  );
  XORCY   blk0000008d (
    .CI(sig0000004d),
    .LI(sig00000076),
    .O(sig0000005b)
  );
  MUXCY   blk0000008e (
    .CI(sig0000004e),
    .DI(b[13]),
    .S(sig00000077),
    .O(sig0000004f)
  );
  XORCY   blk0000008f (
    .CI(sig0000004e),
    .LI(sig00000077),
    .O(sig0000005c)
  );
  MUXCY   blk00000090 (
    .CI(sig0000004f),
    .DI(b[14]),
    .S(sig00000078),
    .O(sig00000050)
  );
  XORCY   blk00000091 (
    .CI(sig0000004f),
    .LI(sig00000078),
    .O(sig0000005d)
  );
  MUXCY   blk00000092 (
    .CI(sig00000050),
    .DI(b[15]),
    .S(sig00000079),
    .O(sig00000051)
  );
  XORCY   blk00000093 (
    .CI(sig00000050),
    .LI(sig00000079),
    .O(sig0000005e)
  );
  MUXCY   blk00000094 (
    .CI(sig00000051),
    .DI(b[16]),
    .S(sig0000007a),
    .O(sig00000052)
  );
  XORCY   blk00000095 (
    .CI(sig00000051),
    .LI(sig0000007a),
    .O(sig0000005f)
  );
  MUXCY   blk00000096 (
    .CI(sig00000052),
    .DI(b[17]),
    .S(sig0000007b),
    .O(sig00000053)
  );
  XORCY   blk00000097 (
    .CI(sig00000052),
    .LI(sig0000007b),
    .O(sig00000060)
  );
  MUXCY   blk00000098 (
    .CI(sig00000053),
    .DI(b[18]),
    .S(sig0000007c),
    .O(sig00000054)
  );
  XORCY   blk00000099 (
    .CI(sig00000053),
    .LI(sig0000007c),
    .O(sig00000061)
  );
  MUXCY   blk0000009a (
    .CI(sig00000054),
    .DI(b[19]),
    .S(sig0000007d),
    .O(sig00000055)
  );
  XORCY   blk0000009b (
    .CI(sig00000054),
    .LI(sig0000007d),
    .O(sig00000062)
  );
  MUXCY   blk0000009c (
    .CI(sig00000055),
    .DI(b[20]),
    .S(sig0000007e),
    .O(sig0000004a)
  );
  XORCY   blk0000009d (
    .CI(sig00000055),
    .LI(sig0000007e),
    .O(sig00000063)
  );
  MUXCY   blk0000009e (
    .CI(sig0000004a),
    .DI(b[21]),
    .S(sig00000074),
    .O(sig0000004b)
  );
  XORCY   blk0000009f (
    .CI(sig0000004a),
    .LI(sig00000074),
    .O(sig00000059)
  );
  MUXCY   blk000000a0 (
    .CI(sig0000004b),
    .DI(b[22]),
    .S(sig00000075),
    .O(sig0000004c)
  );
  XORCY   blk000000a1 (
    .CI(sig0000004b),
    .LI(sig00000075),
    .O(sig0000005a)
  );
  XORCY   blk000000a2 (
    .CI(sig0000004c),
    .LI(sig00000001),
    .O(sig00000056)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a3 (
    .C(clk),
    .D(sig00000041),
    .Q(sig00000035)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a4 (
    .C(clk),
    .D(sig00000040),
    .Q(sig00000034)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a5 (
    .C(clk),
    .D(sig00000049),
    .Q(sig0000003d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a6 (
    .C(clk),
    .D(sig00000048),
    .Q(sig0000003c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a7 (
    .C(clk),
    .D(sig00000047),
    .Q(sig0000003b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a8 (
    .C(clk),
    .D(sig00000046),
    .Q(sig0000003a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a9 (
    .C(clk),
    .D(sig00000045),
    .Q(sig00000039)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000aa (
    .C(clk),
    .D(sig00000044),
    .Q(sig00000038)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ab (
    .C(clk),
    .D(sig00000043),
    .Q(sig00000037)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ac (
    .C(clk),
    .D(sig00000042),
    .Q(sig00000036)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ad (
    .C(clk),
    .D(sig0000003f),
    .Q(sig00000033)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ae (
    .C(clk),
    .D(sig0000003e),
    .Q(sig00000032)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000af (
    .C(clk),
    .D(sig0000005a),
    .Q(sig00000041)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b0 (
    .C(clk),
    .D(sig00000059),
    .Q(sig00000040)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b1 (
    .C(clk),
    .D(sig00000063),
    .Q(sig00000049)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b2 (
    .C(clk),
    .D(sig00000062),
    .Q(sig00000048)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b3 (
    .C(clk),
    .D(sig00000061),
    .Q(sig00000047)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b4 (
    .C(clk),
    .D(sig00000060),
    .Q(sig00000046)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b5 (
    .C(clk),
    .D(sig0000005f),
    .Q(sig00000045)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b6 (
    .C(clk),
    .D(sig0000005e),
    .Q(sig00000044)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b7 (
    .C(clk),
    .D(sig0000005d),
    .Q(sig00000043)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b8 (
    .C(clk),
    .D(sig0000005c),
    .Q(sig00000042)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b9 (
    .C(clk),
    .D(sig0000005b),
    .Q(sig0000003f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ba (
    .C(clk),
    .D(sig00000058),
    .Q(sig0000003e)
  );
  MUXCY   blk000000bb (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000016),
    .O(sig00000013)
  );
  MUXCY   blk000000bc (
    .CI(sig00000013),
    .DI(sig00000001),
    .S(sig00000017),
    .O(sig00000014)
  );
  MUXCY   blk000000bd (
    .CI(sig00000014),
    .DI(sig00000001),
    .S(sig00000018),
    .O(sig00000015)
  );
  MUXCY   blk000000be (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000010),
    .O(sig0000000d)
  );
  MUXCY   blk000000bf (
    .CI(sig0000000d),
    .DI(sig00000001),
    .S(sig00000011),
    .O(sig0000000e)
  );
  MUXCY   blk000000c0 (
    .CI(sig0000000e),
    .DI(sig00000001),
    .S(sig00000012),
    .O(sig0000000f)
  );
  MUXCY   blk000000c1 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000001c),
    .O(sig00000019)
  );
  MUXCY   blk000000c2 (
    .CI(sig00000019),
    .DI(sig00000001),
    .S(sig0000001d),
    .O(sig0000001a)
  );
  MUXCY   blk000000c3 (
    .CI(sig0000001a),
    .DI(sig00000001),
    .S(sig0000001e),
    .O(sig0000001b)
  );
  MUXCY   blk000000c4 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000028),
    .O(sig00000025)
  );
  MUXCY   blk000000c5 (
    .CI(sig00000025),
    .DI(sig00000001),
    .S(sig00000029),
    .O(sig00000026)
  );
  MUXCY   blk000000c6 (
    .CI(sig00000026),
    .DI(sig00000001),
    .S(sig0000002a),
    .O(sig00000027)
  );
  MUXCY   blk000000c7 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000022),
    .O(sig0000001f)
  );
  MUXCY   blk000000c8 (
    .CI(sig0000001f),
    .DI(sig00000001),
    .S(sig00000023),
    .O(sig00000020)
  );
  MUXCY   blk000000c9 (
    .CI(sig00000020),
    .DI(sig00000001),
    .S(sig00000024),
    .O(sig00000021)
  );
  MUXCY   blk000000ca (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000002e),
    .O(sig0000002b)
  );
  MUXCY   blk000000cb (
    .CI(sig0000002b),
    .DI(sig00000001),
    .S(sig0000002f),
    .O(sig0000002c)
  );
  MUXCY   blk000000cc (
    .CI(sig0000002c),
    .DI(sig00000001),
    .S(sig00000030),
    .O(sig0000002d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000cd (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000015),
    .Q(sig0000006e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ce (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000000f),
    .Q(sig0000006d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000cf (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001b),
    .Q(sig0000006f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d0 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000027),
    .Q(sig00000080)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d1 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000021),
    .Q(sig0000007f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d2 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000002d),
    .Q(sig00000081)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d3 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000071),
    .Q(sig0000000b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d4 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000085),
    .Q(sig00000064)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d5 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000070),
    .Q(sig0000000a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d6 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000072),
    .Q(sig0000000c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d7 (
    .C(clk),
    .D(sig00000086),
    .Q(sig00000065)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d8 (
    .C(clk),
    .D(sig00000065),
    .Q(sig00000066)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d9 (
    .I0(b[23]),
    .I1(a[23]),
    .O(sig00000086)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk000000da (
    .I0(sig0000006e),
    .I1(sig00000080),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  blk000000db (
    .I0(sig0000006d),
    .I1(sig0000006f),
    .I2(sig0000007f),
    .I3(sig00000081),
    .O(sig00000071)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  blk000000dc (
    .I0(sig0000006d),
    .I1(sig0000006f),
    .I2(sig0000007f),
    .I3(sig00000081),
    .O(sig00000070)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000dd (
    .I0(b[10]),
    .I1(b[9]),
    .I2(b[8]),
    .O(sig00000030)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000de (
    .I0(a[10]),
    .I1(a[9]),
    .I2(a[8]),
    .O(sig0000001e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000df (
    .I0(b[20]),
    .I1(b[19]),
    .I2(b[22]),
    .I3(b[21]),
    .O(sig0000002a)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e0 (
    .I0(b[20]),
    .I1(b[19]),
    .I2(b[22]),
    .I3(b[21]),
    .O(sig00000024)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e1 (
    .I0(a[20]),
    .I1(a[19]),
    .I2(a[22]),
    .I3(a[21]),
    .O(sig00000018)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e2 (
    .I0(a[20]),
    .I1(a[19]),
    .I2(a[22]),
    .I3(a[21]),
    .O(sig00000012)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e3 (
    .I0(b[5]),
    .I1(b[4]),
    .I2(b[7]),
    .I3(b[6]),
    .O(sig0000002f)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e4 (
    .I0(b[16]),
    .I1(b[15]),
    .I2(b[18]),
    .I3(b[17]),
    .O(sig00000029)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e5 (
    .I0(b[16]),
    .I1(b[15]),
    .I2(b[18]),
    .I3(b[17]),
    .O(sig00000023)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e6 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig0000001d)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e7 (
    .I0(a[16]),
    .I1(a[15]),
    .I2(a[18]),
    .I3(a[17]),
    .O(sig00000017)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e8 (
    .I0(a[16]),
    .I1(a[15]),
    .I2(a[18]),
    .I3(a[17]),
    .O(sig00000011)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000e9 (
    .I0(b[1]),
    .I1(b[0]),
    .I2(b[3]),
    .I3(b[2]),
    .O(sig0000002e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ea (
    .I0(b[12]),
    .I1(b[11]),
    .I2(b[14]),
    .I3(b[13]),
    .O(sig00000028)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000eb (
    .I0(b[12]),
    .I1(b[11]),
    .I2(b[14]),
    .I3(b[13]),
    .O(sig00000022)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ec (
    .I0(a[1]),
    .I1(a[0]),
    .I2(a[3]),
    .I3(a[2]),
    .O(sig0000001c)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ed (
    .I0(a[12]),
    .I1(a[11]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig00000016)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000ee (
    .I0(a[12]),
    .I1(a[11]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig00000010)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk000000ef (
    .I0(sig0000000a),
    .I1(sig00000064),
    .I2(sig0000000b),
    .O(sig00000088)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk000000f0 (
    .I0(sig0000007f),
    .I1(sig0000006e),
    .I2(sig00000081),
    .O(sig00000007)
  );
  LUT4 #(
    .INIT ( 16'hEAAA ))
  blk000000f1 (
    .I0(sig00000007),
    .I1(sig00000080),
    .I2(sig0000006d),
    .I3(sig0000006f),
    .O(sig00000085)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f2 (
    .I0(sig000000d7),
    .I1(sig000000ce),
    .O(sig00000100)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f3 (
    .I0(b[22]),
    .I1(a[22]),
    .O(sig00000075)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f4 (
    .I0(b[21]),
    .I1(a[21]),
    .O(sig00000074)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f5 (
    .I0(b[20]),
    .I1(a[20]),
    .O(sig0000007e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f6 (
    .I0(b[19]),
    .I1(a[19]),
    .O(sig0000007d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f7 (
    .I0(b[18]),
    .I1(a[18]),
    .O(sig0000007c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f8 (
    .I0(b[17]),
    .I1(a[17]),
    .O(sig0000007b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f9 (
    .I0(b[16]),
    .I1(a[16]),
    .O(sig0000007a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fa (
    .I0(b[15]),
    .I1(a[15]),
    .O(sig00000079)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fb (
    .I0(b[14]),
    .I1(a[14]),
    .O(sig00000078)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fc (
    .I0(b[13]),
    .I1(a[13]),
    .O(sig00000077)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fd (
    .I0(b[12]),
    .I1(a[12]),
    .O(sig00000076)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000fe (
    .I0(sig0000011f),
    .I1(sig0000011d),
    .I2(sig0000011e),
    .O(sig0000010c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ff (
    .I0(b[11]),
    .I1(a[11]),
    .O(sig00000073)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000100 (
    .I0(sig0000011f),
    .I1(sig0000011c),
    .I2(sig0000011d),
    .O(sig0000010b)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000101 (
    .I0(sig0000011f),
    .I1(sig00000128),
    .I2(sig0000011c),
    .O(sig0000010a)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000102 (
    .I0(sig0000011f),
    .I1(sig00000127),
    .I2(sig00000128),
    .O(sig00000109)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000103 (
    .I0(sig0000011f),
    .I1(sig00000126),
    .I2(sig00000127),
    .O(sig00000108)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000104 (
    .I0(sig0000011f),
    .I1(sig00000125),
    .I2(sig00000126),
    .O(sig00000107)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000105 (
    .I0(sig0000011f),
    .I1(sig00000124),
    .I2(sig00000125),
    .O(sig00000106)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000106 (
    .I0(sig0000011f),
    .I1(sig00000123),
    .I2(sig00000124),
    .O(sig00000105)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000107 (
    .I0(sig00000123),
    .I1(sig00000122),
    .I2(sig0000011f),
    .O(sig00000104)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000108 (
    .I0(sig00000122),
    .I1(sig00000121),
    .I2(sig0000011f),
    .O(sig00000103)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk00000109 (
    .I0(sig0000011b),
    .I1(sig00000120),
    .I2(sig0000011f),
    .O(sig000000fe)
  );
  LUT3 #(
    .INIT ( 8'h15 ))
  blk0000010a (
    .I0(sig00000099),
    .I1(sig0000011b),
    .I2(sig0000011f),
    .O(sig000000ff)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000010b (
    .I0(sig00000121),
    .I1(sig00000120),
    .I2(sig0000011f),
    .O(sig000000fc)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk0000010c (
    .I0(sig00000036),
    .I1(sig00000037),
    .I2(sig0000003c),
    .I3(sig0000003d),
    .O(sig00000083)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk0000010d (
    .I0(sig00000038),
    .I1(sig00000039),
    .I2(sig0000003a),
    .I3(sig0000003b),
    .O(sig00000082)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk0000010e (
    .I0(sig00000036),
    .I1(sig00000037),
    .I2(sig00000038),
    .I3(sig00000039),
    .O(sig0000008e)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk0000010f (
    .I0(sig0000003a),
    .I1(sig0000003b),
    .I2(sig0000003c),
    .I3(sig0000003d),
    .O(sig0000008f)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000110 (
    .I0(sig00000031),
    .I1(sig0000000c),
    .O(sig00000090)
  );
  LUT4 #(
    .INIT ( 16'hF0E0 ))
  blk00000111 (
    .I0(sig0000008f),
    .I1(sig0000008e),
    .I2(sig00000090),
    .I3(sig0000008d),
    .O(sig00000091)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk00000112 (
    .C(clk),
    .D(sig00000089),
    .S(sig00000088),
    .Q(sig00000068)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk00000113 (
    .C(clk),
    .D(sig00000064),
    .S(sig0000000b),
    .Q(sig0000006a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000114 (
    .C(clk),
    .D(sig00000093),
    .R(sig0000000b),
    .Q(sig0000006b)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk00000115 (
    .C(clk),
    .D(sig00000094),
    .S(sig00000064),
    .Q(sig0000006c)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000116 (
    .C(clk),
    .D(sig00000087),
    .R(sig00000064),
    .Q(sig00000067)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk00000117 (
    .I0(sig0000000b),
    .I1(sig00000066),
    .O(sig00000087)
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000118 (
    .C(clk),
    .D(sig0000008c),
    .R(sig00000088),
    .S(sig0000000c),
    .Q(sig00000069)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000119 (
    .I0(sig00000031),
    .I1(sig00000035),
    .O(sig0000008c)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000011a (
    .I0(sig00000121),
    .I1(sig00000120),
    .I2(sig0000011f),
    .O(sig000000fd)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011b (
    .I0(sig000000cb),
    .O(sig000000b5)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011c (
    .I0(sig000000cc),
    .O(sig000000b7)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011d (
    .I0(sig000000cf),
    .O(sig000000b8)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011e (
    .I0(sig000000d0),
    .O(sig000000b9)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011f (
    .I0(sig000000d1),
    .O(sig000000ba)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000120 (
    .I0(sig000000d2),
    .O(sig000000bb)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000121 (
    .I0(sig000000d3),
    .O(sig000000bc)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000122 (
    .I0(sig000000d4),
    .O(sig000000bd)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000123 (
    .I0(sig000000d5),
    .O(sig000000be)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000124 (
    .I0(sig000000d6),
    .O(sig000000bf)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000125 (
    .I0(sig000000cd),
    .O(sig000000b6)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  blk00000126 (
    .I0(sig00000031),
    .I1(sig0000000c),
    .O(sig00000008)
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  blk00000127 (
    .I0(sig00000083),
    .I1(sig00000082),
    .I2(sig00000034),
    .I3(sig00000009),
    .O(sig00000084)
  );
  LUT4 #(
    .INIT ( 16'h0515 ))
  blk00000128 (
    .I0(sig00000064),
    .I1(sig00000035),
    .I2(sig00000006),
    .I3(sig00000003),
    .O(sig00000093)
  );
  LUT4 #(
    .INIT ( 16'h5F7F ))
  blk00000129 (
    .I0(sig00000033),
    .I1(sig00000032),
    .I2(sig00000034),
    .I3(sig0000011f),
    .O(sig00000004)
  );
  LUT4 #(
    .INIT ( 16'hBFAF ))
  blk0000012a (
    .I0(sig0000000b),
    .I1(sig00000035),
    .I2(sig00000092),
    .I3(sig00000005),
    .O(sig00000094)
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  blk0000012b (
    .I0(sig0000000c),
    .I1(sig00000031),
    .I2(sig00000084),
    .O(sig00000003)
  );
  INV   blk0000012c (
    .I(sig0000011f),
    .O(sig0000010e)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk0000012d (
    .I0(sig0000000c),
    .I1(sig00000031),
    .O(sig0000008a)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  blk0000012e (
    .I0(sig00000083),
    .I1(sig00000008),
    .I2(sig00000004),
    .I3(sig00000082),
    .O(sig0000008b)
  );
  MUXF5   blk0000012f (
    .I0(sig0000008b),
    .I1(sig0000008a),
    .S(sig00000035),
    .O(sig00000089)
  );
  LUT4_L #(
    .INIT ( 16'hFFFE ))
  blk00000130 (
    .I0(sig00000033),
    .I1(sig00000034),
    .I2(sig00000032),
    .I3(sig0000011f),
    .LO(sig0000008d)
  );
  LUT3_D #(
    .INIT ( 8'h31 ))
  blk00000131 (
    .I0(sig00000035),
    .I1(sig0000000a),
    .I2(sig00000091),
    .LO(sig00000006),
    .O(sig00000092)
  );
  LUT3_L #(
    .INIT ( 8'hC8 ))
  blk00000132 (
    .I0(sig00000032),
    .I1(sig00000033),
    .I2(sig0000011f),
    .LO(sig00000009)
  );
  LUT3_L #(
    .INIT ( 8'hDF ))
  blk00000133 (
    .I0(sig00000031),
    .I1(sig0000000c),
    .I2(sig00000084),
    .LO(sig00000005)
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
