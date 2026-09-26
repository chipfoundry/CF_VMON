`timescale 1ns / 1ps

module tb_CF_VMON;
    integer errors;
    reg [3:0] TR_BIT_D, TR_BIT_A, LVI_D_SEL, LVI_A_SEL;
    reg PD, ISO, VREF_PRES, VREF_LVI_HVI, SLEEP, en_iso_vcca, HVI_SEL;
    reg EN_HVI_A, EN_LVI_A, EN_LVI_D, EN_PRES_A, EN_PRES_D, IINA, IIND;
    reg vpwr, vgnd;
    wire vgnda, vdd_rl, vda_rl, vca;
    wire PRES_D_OUT, PRES_A_OUT, LVI_D_OUT, LVI_A_OUT, HVI_OUT;

    CF_VMON u (
        .vgnd(vgnd), .vgnda(vgnda), .vdd_rl(vdd_rl), .vda_rl(vda_rl), .vpwr(vpwr), .vca(vca),
        .PRES_D_OUT(PRES_D_OUT), .PRES_A_OUT(PRES_A_OUT), .LVI_D_OUT(LVI_D_OUT),
        .LVI_A_OUT(LVI_A_OUT), .HVI_OUT(HVI_OUT), .TR_BIT_D(TR_BIT_D), .TR_BIT_A(TR_BIT_A),
        .PD(PD), .LVI_D_SEL(LVI_D_SEL), .LVI_A_SEL(LVI_A_SEL), .ISO(ISO),
        .VREF_PRES(VREF_PRES), .VREF_LVI_HVI(VREF_LVI_HVI), .SLEEP(SLEEP),
        .en_iso_vcca(en_iso_vcca), .HVI_SEL(HVI_SEL), .EN_HVI_A(EN_HVI_A),
        .EN_LVI_A(EN_LVI_A), .EN_LVI_D(EN_LVI_D), .EN_PRES_A(EN_PRES_A),
        .EN_PRES_D(EN_PRES_D), .IINA(IINA), .IIND(IIND)
    );

    task expect_bit;
        input got;
        input exp;
        input [8*24-1:0] tag;
        begin
            if (got !== exp) begin
                $display("FAIL %s got=%b exp=%b", tag, got, exp);
                errors = errors + 1;
            end else $display("PASS %s %b", tag, got);
        end
    endtask

    initial begin
        errors = 0;
        vpwr = 1; vgnd = 0; TR_BIT_D = 0; TR_BIT_A = 0; LVI_D_SEL = 0; LVI_A_SEL = 0;
        PD = 0; ISO = 0; VREF_PRES = 1; VREF_LVI_HVI = 1; SLEEP = 0; en_iso_vcca = 0;
        HVI_SEL = 0; EN_HVI_A = 1; EN_LVI_A = 1; EN_LVI_D = 1; EN_PRES_A = 1; EN_PRES_D = 1;
        IINA = 1; IIND = 1;
        u.u_core.vpwr_v = 1.8;
        u.u_core.vca_v = 1.8;
        #1;
        expect_bit(PRES_D_OUT, 1'b1, "pres d");
        expect_bit(PRES_A_OUT, 1'b1, "pres a");
        expect_bit(LVI_D_OUT, 1'b0, "lvi d ok");
        expect_bit(HVI_OUT, 1'b0, "hvi ok");
        u.u_core.vpwr_v = 1.4;
        #1;
        expect_bit(PRES_D_OUT, 1'b0, "pres d low");
        expect_bit(LVI_D_OUT, 1'b1, "lvi d");
        u.u_core.vca_v = 2.4;
        #1;
        expect_bit(HVI_OUT, 1'b1, "hvi");
        expect_bit(LVI_A_OUT, 1'b0, "lvi a high");
        PD = 1;
        #1;
        expect_bit(PRES_A_OUT, 1'b0, "pd pres");
        expect_bit(HVI_OUT, 1'b0, "pd hvi");
        expect_bit(LVI_D_OUT, 1'b0, "pd lvi");
        if (errors == 0) $display("CF_VMON behavioral self-check passed");
        else $display("CF_VMON behavioral self-check FAILED %0d", errors);
        $finish(errors != 0);
    end
endmodule
