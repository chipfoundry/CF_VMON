// Structural PG wrapper. Analog leaf is CF_VMON_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_VMON (
    vgnd,
    vgnda,
    vdd_rl,
    vda_rl,
    vpwr,
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
    input vgnd;
    inout vgnda;
    inout vdd_rl;
    inout vda_rl;
    input vpwr;
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
    CF_VMON_core u_core (
        .vgndd_rl(vgnd),
        .vgndd_nb(vgnd),
        .vgndd(vgnd),
        .vgnda_rl(vgnda),
        .vgnda_nb(vgnda),
        .vgnda(vgnda),
        .vdd_rl(vdd_rl),
        .vda_rl(vda_rl),
        .vcd_rl(vpwr),
        .vcd_pb(vpwr),
        .vcd(vpwr),
        .vca_rl(vca),
        .vca_pb(vca),
        .vca(vca),
        .PRES_D_OUT(PRES_D_OUT),
        .PRES_A_OUT(PRES_A_OUT),
        .LVI_D_OUT(LVI_D_OUT),
        .LVI_A_OUT(LVI_A_OUT),
        .HVI_OUT(HVI_OUT),
        .TR_BIT_D(TR_BIT_D),
        .TR_BIT_A(TR_BIT_A),
        .PD(PD),
        .LVI_D_SEL(LVI_D_SEL),
        .LVI_A_SEL(LVI_A_SEL),
        .ISO(ISO),
        .vca_int(vca),
        .vcd_int(vpwr),
        .VREF_PRES(VREF_PRES),
        .VREF_LVI_HVI(VREF_LVI_HVI),
        .SLEEP(SLEEP),
        .en_iso_vcca(en_iso_vcca),
        .HVI_SEL(HVI_SEL),
        .EN_HVI_A(EN_HVI_A),
        .EN_LVI_A(EN_LVI_A),
        .EN_LVI_D(EN_LVI_D),
        .EN_PRES_A(EN_PRES_A),
        .EN_PRES_D(EN_PRES_D),
        .IINA(IINA),
        .IIND(IIND)
    );
endmodule
