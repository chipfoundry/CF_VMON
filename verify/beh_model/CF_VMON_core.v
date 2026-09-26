`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_VMON_core.
// Drop this file in place of hdl/gl/CF_VMON_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Rail voltages are Verilog real backdoors (1-bit pins stay digital):
//   vpwr_v  digital-core rail
//   vca_v   analog-core rail
//
// Assumed protocol (ideal, not silicon-verified):
//   * PRES_* is 1 when that rail is at or above 1.6 V and the detector is on
//   * LVI_* is 1 when that rail is below 1.6 V and the detector is on
//   * HVI_OUT is 1 when vca_v is above 2.2 V and EN_HVI_A is high
//   * PD, SLEEP, or ISO forces every indicator low
// Threshold selects, trims, and bias currents are not modeled.

module CF_VMON_core (
    vgndd_rl,
    vgndd_nb,
    vgndd,
    vgnda_rl,
    vgnda_nb,
    vgnda,
    vdd_rl,
    vda_rl,
    vcd_rl,
    vcd_pb,
    vcd,
    vca_rl,
    vca_pb,
    vca,
    PRES_D_OUT,
    PRES_A_OUT,
    LVI_D_OUT,
    LVI_A_OUT,
    HVI_OUT,
    TR_BIT_D,
    TR_BIT_A,
    PD,
    LVI_D_SEL,
    LVI_A_SEL,
    ISO,
    vca_int,
    vcd_int,
    VREF_PRES,
    VREF_LVI_HVI,
    SLEEP,
    en_iso_vcca,
    HVI_SEL,
    EN_HVI_A,
    EN_LVI_A,
    EN_LVI_D,
    EN_PRES_A,
    EN_PRES_D,
    IINA,
    IIND
);
    inout vgndd_rl;
    inout vgndd_nb;
    inout vgndd;
    inout vgnda_rl;
    inout vgnda_nb;
    inout vgnda;
    inout vdd_rl;
    inout vda_rl;
    inout vcd_rl;
    inout vcd_pb;
    inout vcd;
    inout vca_rl;
    inout vca_pb;
    inout vca;
    output PRES_D_OUT;
    output PRES_A_OUT;
    output LVI_D_OUT;
    output LVI_A_OUT;
    output HVI_OUT;
    input [3:0] TR_BIT_D;
    input [3:0] TR_BIT_A;
    input PD;
    input [3:0] LVI_D_SEL;
    input [3:0] LVI_A_SEL;
    input ISO;
    inout vca_int;
    inout vcd_int;
    input VREF_PRES;
    input VREF_LVI_HVI;
    input SLEEP;
    input en_iso_vcca;
    input HVI_SEL;
    input EN_HVI_A;
    input EN_LVI_A;
    input EN_LVI_D;
    input EN_PRES_A;
    input EN_PRES_D;
    input IINA;
    input IIND;

    localparam real PRES_TRIP = 1.6;
    localparam real LVI_TRIP = 1.6;
    localparam real HVI_TRIP = 2.2;

    real vpwr_v;
    real vca_v;

    initial begin
        vpwr_v = 1.8;
        vca_v = 1.8;
    end

    wire quiet = (PD === 1'b1) || (SLEEP === 1'b1) || (ISO === 1'b1);
    wire pres_ref = (VREF_PRES === 1'b1);
    wire lvi_ref = (VREF_LVI_HVI === 1'b1);

    assign PRES_D_OUT = (!quiet && pres_ref && (EN_PRES_D === 1'b1) && (vpwr_v >= PRES_TRIP)) ? 1'b1 : 1'b0;
    assign PRES_A_OUT = (!quiet && pres_ref && (EN_PRES_A === 1'b1) && (vca_v >= PRES_TRIP) && (en_iso_vcca !== 1'b1)) ? 1'b1 : 1'b0;
    assign LVI_D_OUT = (!quiet && lvi_ref && (EN_LVI_D === 1'b1) && (vpwr_v < LVI_TRIP)) ? 1'b1 : 1'b0;
    assign LVI_A_OUT = (!quiet && lvi_ref && (EN_LVI_A === 1'b1) && (vca_v < LVI_TRIP) && (en_iso_vcca !== 1'b1)) ? 1'b1 : 1'b0;
    assign HVI_OUT = (!quiet && lvi_ref && (EN_HVI_A === 1'b1) && (vca_v > HVI_TRIP) && (en_iso_vcca !== 1'b1)) ? 1'b1 : 1'b0;
endmodule
