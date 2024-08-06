// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Aug  5 18:21:17 2024
// Host        : DESKTOP-QKFN6QS running 64-bit major release  (build 9200)
// Command     : write_verilog {D:/Digital IC design/-Digital-Design-using-Verilog-FPGA-flow-using-Vivado/SPI slave
//               interface/SPI_slave_netlist.v}
// Design      : spi_slave_with_single_port_ram
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Slave_iterface
   (MISO_OBUF,
    \rx_data_reg[0]_0 ,
    rx_valid_reg_0,
    rx_valid_reg_1,
    \rx_data_reg[9]_0 ,
    \counter_reg[0]_0 ,
    \address_reg[7] ,
    D,
    E,
    mem_reg,
    tx_valid_reg,
    write_enable_reg,
    \counter_reg[2]_0 ,
    clk_IBUF_BUFG,
    rst_n_IBUF,
    tx_valid,
    SS_n_IBUF,
    MOSI_IBUF,
    write_enable);
  output MISO_OBUF;
  output \rx_data_reg[0]_0 ;
  output rx_valid_reg_0;
  output rx_valid_reg_1;
  output \rx_data_reg[9]_0 ;
  output \counter_reg[0]_0 ;
  output [0:0]\address_reg[7] ;
  output [7:0]D;
  output [0:0]E;
  output mem_reg;
  output tx_valid_reg;
  output write_enable_reg;
  input \counter_reg[2]_0 ;
  input clk_IBUF_BUFG;
  input rst_n_IBUF;
  input tx_valid;
  input SS_n_IBUF;
  input MOSI_IBUF;
  input write_enable;

  wire \<const1> ;
  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_gray_cs[0]_i_1_n_0 ;
  wire \FSM_gray_cs[0]_i_2_n_0 ;
  wire \FSM_gray_cs[1]_i_1_n_0 ;
  wire \FSM_gray_cs[2]_i_2_n_0 ;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MOSI_IBUF;
  wire SS_n_IBUF;
  wire [0:0]\address_reg[7] ;
  wire address_sent_i_1_n_0;
  wire address_sent_reg_n_0;
  wire clk_IBUF_BUFG;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire \counter[3]_i_3_n_0 ;
  wire \counter[3]_i_5_n_0 ;
  wire \counter[3]_i_6_n_0 ;
  wire \counter_reg[0]_0 ;
  wire \counter_reg[2]_0 ;
  wire \counter_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire [2:0]cs;
  wire mem_reg;
  wire rst_n_IBUF;
  wire [9:8]rx_data;
  wire [9:7]rx_data1_in;
  wire \rx_data[0]_i_1_n_0 ;
  wire \rx_data[1]_i_1_n_0 ;
  wire \rx_data[2]_i_1_n_0 ;
  wire \rx_data[2]_i_2_n_0 ;
  wire \rx_data[3]_i_1_n_0 ;
  wire \rx_data[3]_i_2_n_0 ;
  wire \rx_data[4]_i_1_n_0 ;
  wire \rx_data[4]_i_2_n_0 ;
  wire \rx_data[5]_i_1_n_0 ;
  wire \rx_data[5]_i_2_n_0 ;
  wire \rx_data[6]_i_1_n_0 ;
  wire \rx_data[6]_i_2_n_0 ;
  wire \rx_data[6]_i_3_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[7]_i_3_n_0 ;
  wire \rx_data[8]_i_1_n_0 ;
  wire \rx_data[8]_i_2_n_0 ;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_3_n_0 ;
  wire \rx_data_reg[0]_0 ;
  wire \rx_data_reg[9]_0 ;
  wire rx_valid;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire rx_valid_reg_0;
  wire rx_valid_reg_1;
  wire tx_valid;
  wire tx_valid_reg;
  wire write_enable;
  wire write_enable_reg;

  LUT6 #(
    .INIT(64'h4400545544005555)) 
    \FSM_gray_cs[0]_i_1 
       (.I0(\FSM_gray_cs[0]_i_2_n_0 ),
        .I1(cs[1]),
        .I2(address_sent_reg_n_0),
        .I3(cs[0]),
        .I4(SS_n_IBUF),
        .I5(MOSI_IBUF),
        .O(\FSM_gray_cs[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFB33AAAA)) 
    \FSM_gray_cs[0]_i_2 
       (.I0(cs[2]),
        .I1(cs[0]),
        .I2(rx_valid),
        .I3(SS_n_IBUF),
        .I4(cs[1]),
        .O(\FSM_gray_cs[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0030B2B2)) 
    \FSM_gray_cs[1]_i_1 
       (.I0(cs[0]),
        .I1(cs[2]),
        .I2(cs[1]),
        .I3(rx_valid),
        .I4(SS_n_IBUF),
        .O(\FSM_gray_cs[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_gray_cs[2]_i_1 
       (.I0(rst_n_IBUF),
        .O(\rx_data_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000908000008080)) 
    \FSM_gray_cs[2]_i_2 
       (.I0(cs[1]),
        .I1(cs[2]),
        .I2(cs[0]),
        .I3(MOSI_IBUF),
        .I4(SS_n_IBUF),
        .I5(address_sent_reg_n_0),
        .O(\FSM_gray_cs[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_gray_cs[0]_i_1_n_0 ),
        .Q(cs[0]),
        .R(\rx_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_gray_cs[1]_i_1_n_0 ),
        .Q(cs[1]),
        .R(\rx_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_gray_cs[2]_i_2_n_0 ),
        .Q(cs[2]),
        .R(\rx_data_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h91)) 
    MISO_i_1
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .O(MISO_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(clk_IBUF_BUFG),
        .CE(MISO_i_1_n_0),
        .D(\counter_reg[2]_0 ),
        .Q(MISO_OBUF),
        .R(\rx_data_reg[0]_0 ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[7]_i_1 
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .O(\address_reg[7] ));
  LUT6 #(
    .INIT(64'h7F7FFF0F0000000F)) 
    address_sent_i_1
       (.I0(cs[1]),
        .I1(tx_valid),
        .I2(cs[2]),
        .I3(\counter[3]_i_5_n_0 ),
        .I4(cs[0]),
        .I5(address_sent_reg_n_0),
        .O(address_sent_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    address_sent_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(address_sent_i_1_n_0),
        .Q(address_sent_reg_n_0),
        .R(\rx_data_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(rx_valid_reg_0),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(rx_valid_reg_1),
        .I1(rx_valid_reg_0),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[2]_i_1 
       (.I0(\rx_data_reg[9]_0 ),
        .I1(rx_valid_reg_0),
        .I2(rx_valid_reg_1),
        .O(\counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000700040007000)) 
    \counter[3]_i_1 
       (.I0(\counter_reg[0]_0 ),
        .I1(cs[2]),
        .I2(\counter[3]_i_5_n_0 ),
        .I3(rst_n_IBUF),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(\counter[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7000)) 
    \counter[3]_i_2 
       (.I0(\counter_reg[0]_0 ),
        .I1(cs[2]),
        .I2(\counter[3]_i_5_n_0 ),
        .I3(rst_n_IBUF),
        .O(\counter[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_3 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(rx_valid_reg_1),
        .I2(rx_valid_reg_0),
        .I3(\rx_data_reg[9]_0 ),
        .O(\counter[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0010FFFF)) 
    \counter[3]_i_4 
       (.I0(rx_valid_reg_1),
        .I1(rx_valid_reg_0),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\rx_data_reg[9]_0 ),
        .I4(tx_valid),
        .I5(\counter[3]_i_6_n_0 ),
        .O(\counter_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFDFFFFF)) 
    \counter[3]_i_5 
       (.I0(cs[1]),
        .I1(rx_valid_reg_0),
        .I2(rx_valid_reg_1),
        .I3(cs[2]),
        .I4(\counter_reg_n_0_[3] ),
        .I5(\rx_data_reg[9]_0 ),
        .O(\counter[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \counter[3]_i_6 
       (.I0(cs[1]),
        .I1(cs[0]),
        .O(\counter[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_2_n_0 ),
        .D(\counter[0]_i_1_n_0 ),
        .Q(rx_valid_reg_0),
        .R(\counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_2_n_0 ),
        .D(\counter[1]_i_1_n_0 ),
        .Q(rx_valid_reg_1),
        .R(\counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_2_n_0 ),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\rx_data_reg[9]_0 ),
        .R(\counter[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\counter[3]_i_2_n_0 ),
        .D(\counter[3]_i_3_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(\counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \data_in[7]_i_1 
       (.I0(rx_data[9]),
        .I1(rx_valid),
        .I2(rx_data[8]),
        .I3(rst_n_IBUF),
        .O(E));
  LUT4 #(
    .INIT(16'h80FF)) 
    mem_reg_i_1
       (.I0(rx_data[9]),
        .I1(rx_data[8]),
        .I2(rx_valid),
        .I3(rst_n_IBUF),
        .O(mem_reg));
  LUT6 #(
    .INIT(64'hBBBBABBB8888A888)) 
    \rx_data[0]_i_1 
       (.I0(rx_data1_in[7]),
        .I1(MISO_i_1_n_0),
        .I2(\rx_data[8]_i_2_n_0 ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\rx_data_reg[9]_0 ),
        .I5(D[0]),
        .O(\rx_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBABBB8888A888)) 
    \rx_data[1]_i_1 
       (.I0(rx_data1_in[7]),
        .I1(MISO_i_1_n_0),
        .I2(\rx_data[9]_i_3_n_0 ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\rx_data_reg[9]_0 ),
        .I5(D[1]),
        .O(\rx_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \rx_data[2]_i_1 
       (.I0(rx_data1_in[7]),
        .I1(MISO_i_1_n_0),
        .I2(\counter_reg_n_0_[3] ),
        .I3(cs[2]),
        .I4(\rx_data[2]_i_2_n_0 ),
        .I5(D[2]),
        .O(\rx_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \rx_data[2]_i_2 
       (.I0(\rx_data_reg[9]_0 ),
        .I1(rx_valid_reg_0),
        .I2(rx_valid_reg_1),
        .O(\rx_data[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00A03FF000A00000)) 
    \rx_data[3]_i_1 
       (.I0(MOSI_IBUF),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(cs[2]),
        .I4(\rx_data[3]_i_2_n_0 ),
        .I5(D[3]),
        .O(\rx_data[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \rx_data[3]_i_2 
       (.I0(rx_valid_reg_0),
        .I1(rx_valid_reg_1),
        .I2(\rx_data_reg[9]_0 ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(cs[2]),
        .O(\rx_data[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00A03FF000A00000)) 
    \rx_data[4]_i_1 
       (.I0(MOSI_IBUF),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(cs[2]),
        .I4(\rx_data[4]_i_2_n_0 ),
        .I5(D[4]),
        .O(\rx_data[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \rx_data[4]_i_2 
       (.I0(rx_valid_reg_0),
        .I1(cs[2]),
        .I2(rx_valid_reg_1),
        .I3(\rx_data_reg[9]_0 ),
        .I4(\counter_reg_n_0_[3] ),
        .O(\rx_data[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00A03FF000A00000)) 
    \rx_data[5]_i_1 
       (.I0(MOSI_IBUF),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(cs[2]),
        .I4(\rx_data[5]_i_2_n_0 ),
        .I5(D[5]),
        .O(\rx_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    \rx_data[5]_i_2 
       (.I0(rx_valid_reg_0),
        .I1(cs[2]),
        .I2(rx_valid_reg_1),
        .I3(\rx_data_reg[9]_0 ),
        .I4(\counter_reg_n_0_[3] ),
        .O(\rx_data[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBA8888888A)) 
    \rx_data[6]_i_1 
       (.I0(rx_data1_in[7]),
        .I1(MISO_i_1_n_0),
        .I2(\rx_data[6]_i_2_n_0 ),
        .I3(cs[2]),
        .I4(\rx_data[6]_i_3_n_0 ),
        .I5(D[6]),
        .O(\rx_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \rx_data[6]_i_2 
       (.I0(rx_valid_reg_1),
        .I1(rx_valid_reg_0),
        .O(\rx_data[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \rx_data[6]_i_3 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\rx_data_reg[9]_0 ),
        .O(\rx_data[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \rx_data[7]_i_1 
       (.I0(rx_data1_in[7]),
        .I1(MISO_i_1_n_0),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\rx_data_reg[9]_0 ),
        .I4(\rx_data[7]_i_3_n_0 ),
        .I5(D[7]),
        .O(\rx_data[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \rx_data[7]_i_2 
       (.I0(MOSI_IBUF),
        .I1(cs[2]),
        .I2(cs[1]),
        .O(rx_data1_in[7]));
  LUT3 #(
    .INIT(8'h04)) 
    \rx_data[7]_i_3 
       (.I0(rx_valid_reg_0),
        .I1(rx_valid_reg_1),
        .I2(cs[2]),
        .O(\rx_data[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \rx_data[8]_i_1 
       (.I0(rx_data1_in[9]),
        .I1(MISO_i_1_n_0),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\rx_data_reg[9]_0 ),
        .I4(\rx_data[8]_i_2_n_0 ),
        .I5(rx_data[8]),
        .O(\rx_data[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \rx_data[8]_i_2 
       (.I0(cs[2]),
        .I1(rx_valid_reg_0),
        .I2(rx_valid_reg_1),
        .O(\rx_data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABBBB888A8888)) 
    \rx_data[9]_i_1 
       (.I0(rx_data1_in[9]),
        .I1(MISO_i_1_n_0),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\rx_data_reg[9]_0 ),
        .I4(\rx_data[9]_i_3_n_0 ),
        .I5(rx_data[9]),
        .O(\rx_data[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hE020)) 
    \rx_data[9]_i_2 
       (.I0(MOSI_IBUF),
        .I1(cs[2]),
        .I2(cs[1]),
        .I3(cs[0]),
        .O(rx_data1_in[9]));
  LUT3 #(
    .INIT(8'h01)) 
    \rx_data[9]_i_3 
       (.I0(cs[2]),
        .I1(rx_valid_reg_0),
        .I2(rx_valid_reg_1),
        .O(\rx_data[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[0]_i_1_n_0 ),
        .Q(D[0]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[1]_i_1_n_0 ),
        .Q(D[1]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[2]_i_1_n_0 ),
        .Q(D[2]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[3]_i_1_n_0 ),
        .Q(D[3]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[4]_i_1_n_0 ),
        .Q(D[4]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[5]_i_1_n_0 ),
        .Q(D[5]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[6]_i_1_n_0 ),
        .Q(D[6]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(D[7]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[8]_i_1_n_0 ),
        .Q(rx_data[8]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[9]_i_1_n_0 ),
        .Q(rx_data[9]),
        .R(\rx_data_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF0000004000)) 
    rx_valid_i_1
       (.I0(rx_valid_reg_0),
        .I1(rx_valid_reg_1),
        .I2(rx_valid_i_2_n_0),
        .I3(cs[1]),
        .I4(cs[2]),
        .I5(rx_valid),
        .O(rx_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rx_valid_i_2
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\rx_data_reg[9]_0 ),
        .O(rx_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid),
        .R(\rx_data_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    tx_valid_i_1
       (.I0(rx_data[8]),
        .I1(rx_data[9]),
        .I2(rx_valid),
        .I3(tx_valid),
        .O(tx_valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h74)) 
    write_enable_i_1
       (.I0(rx_data[9]),
        .I1(rx_valid),
        .I2(write_enable),
        .O(write_enable_reg));
endmodule

module singlePort_Ram
   (write_enable,
    tx_valid,
    MISO_reg,
    clk_IBUF_BUFG,
    \rx_data_reg[9] ,
    rst_n,
    \rx_data_reg[9]_0 ,
    \rx_data_reg[8] ,
    \counter_reg[2] ,
    \counter_reg[1] ,
    \counter_reg[1]_0 ,
    \counter_reg[0] ,
    E,
    D,
    rx_valid_reg);
  output write_enable;
  output tx_valid;
  output MISO_reg;
  input clk_IBUF_BUFG;
  input \rx_data_reg[9] ;
  input rst_n;
  input \rx_data_reg[9]_0 ;
  input \rx_data_reg[8] ;
  input \counter_reg[2] ;
  input \counter_reg[1] ;
  input \counter_reg[1]_0 ;
  input \counter_reg[0] ;
  input [0:0]E;
  input [7:0]D;
  input [0:0]rx_valid_reg;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]D;
  wire [0:0]E;
  wire MISO_i_3_n_0;
  wire MISO_i_4_n_0;
  wire MISO_reg;
  wire [7:0]address;
  wire clk_IBUF_BUFG;
  wire \counter_reg[0] ;
  wire \counter_reg[1] ;
  wire \counter_reg[1]_0 ;
  wire \counter_reg[2] ;
  wire [7:0]data_in;
  wire rst_n;
  wire \rx_data_reg[8] ;
  wire \rx_data_reg[9] ;
  wire \rx_data_reg[9]_0 ;
  wire [0:0]rx_valid_reg;
  wire [7:0]tx_data;
  wire tx_valid;
  wire write_enable;

  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'h00B8)) 
    MISO_i_2
       (.I0(MISO_i_3_n_0),
        .I1(\counter_reg[2] ),
        .I2(MISO_i_4_n_0),
        .I3(\counter_reg[1] ),
        .O(MISO_reg));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_3
       (.I0(tx_data[0]),
        .I1(tx_data[1]),
        .I2(\counter_reg[1]_0 ),
        .I3(tx_data[2]),
        .I4(\counter_reg[0] ),
        .I5(tx_data[3]),
        .O(MISO_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_4
       (.I0(tx_data[4]),
        .I1(tx_data[5]),
        .I2(\counter_reg[1]_0 ),
        .I3(tx_data[6]),
        .I4(\counter_reg[0] ),
        .I5(tx_data[7]),
        .O(MISO_i_4_n_0));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[0]),
        .Q(address[0]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[1]),
        .Q(address[1]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[2]),
        .Q(address[2]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[3]),
        .Q(address[3]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[4]),
        .Q(address[4]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[5]),
        .Q(address[5]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[6]),
        .Q(address[6]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(rx_valid_reg),
        .D(D[7]),
        .Q(address[7]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(data_in[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(data_in[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(data_in[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(data_in[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(data_in[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(data_in[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(data_in[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \data_in_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(data_in[7]),
        .R(\<const0> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "ram/mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,address,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,address,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,data_in}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(tx_data),
        .ENARDEN(write_enable),
        .ENBWREN(\rx_data_reg[9] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(rst_n),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({\<const1> ,\<const1> }),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data_reg[8] ),
        .Q(tx_valid),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    write_enable_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data_reg[9]_0 ),
        .Q(write_enable),
        .R(rst_n));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module spi_slave_with_single_port_ram
   (MOSI,
    MISO,
    SS_n,
    clk,
    rst_n);
  input MOSI;
  output MISO;
  input SS_n;
  input clk;
  input rst_n;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire SS_n;
  wire SS_n_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire ram_n_2;
  wire rst_n;
  wire rst_n_IBUF;
  wire [7:0]rx_data;
  wire slave_n_1;
  wire slave_n_15;
  wire slave_n_16;
  wire slave_n_17;
  wire slave_n_18;
  wire slave_n_2;
  wire slave_n_3;
  wire slave_n_4;
  wire slave_n_5;
  wire slave_n_6;
  wire tx_valid;
  wire write_enable;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  IBUF SS_n_IBUF_inst
       (.I(SS_n),
        .O(SS_n_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  singlePort_Ram ram
       (.D(rx_data),
        .E(slave_n_15),
        .MISO_reg(ram_n_2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_reg[0] (slave_n_2),
        .\counter_reg[1] (slave_n_5),
        .\counter_reg[1]_0 (slave_n_3),
        .\counter_reg[2] (slave_n_4),
        .rst_n(slave_n_1),
        .\rx_data_reg[8] (slave_n_17),
        .\rx_data_reg[9] (slave_n_16),
        .\rx_data_reg[9]_0 (slave_n_18),
        .rx_valid_reg(slave_n_6),
        .tx_valid(tx_valid),
        .write_enable(write_enable));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  Slave_iterface slave
       (.D(rx_data),
        .E(slave_n_15),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .SS_n_IBUF(SS_n_IBUF),
        .\address_reg[7] (slave_n_6),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_reg[0]_0 (slave_n_5),
        .\counter_reg[2]_0 (ram_n_2),
        .mem_reg(slave_n_16),
        .rst_n_IBUF(rst_n_IBUF),
        .\rx_data_reg[0]_0 (slave_n_1),
        .\rx_data_reg[9]_0 (slave_n_4),
        .rx_valid_reg_0(slave_n_2),
        .rx_valid_reg_1(slave_n_3),
        .tx_valid(tx_valid),
        .tx_valid_reg(slave_n_17),
        .write_enable(write_enable),
        .write_enable_reg(slave_n_18));
endmodule
