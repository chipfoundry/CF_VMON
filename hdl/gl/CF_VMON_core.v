// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
