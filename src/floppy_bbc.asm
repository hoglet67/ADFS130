LFE30   = $FE30

.LBA00
        JMP     LBB14

.LBA03
        JMP     LBB25

.LBA06
        JMP     LBA26

.LBA09
        JMP     LBA2A

.LBA0C
        LDA     #$FF
        STA     L10E4
.LBA11
        LDA     #$5A
        STA     LFE85
        LDA     LFE85
        CMP     #$5A
        BNE     LBA25

IF PLATFORM = PLAT_BBC
;; this test fails on the Master
        LDA     LFE80
        AND     #$03
        BEQ     LBA25
ELSE
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
ENDIF

        CLC
.LBA25
        RTS

.LBA26
        LDA     #$40
        BNE     LBA2C

.LBA2A
        LDA     #$C0
.LBA2C
        STA     L10E0
        TXA
        TSX
        STX     L10E7
        PHA
        JSR     LBBB4

        JSR     LBB92

        PLA
        TAX
        BIT     L00A1
        BMI     LBA4D

        LDA     L00BC
        STA     L0D0B
        LDA     L00BD
        STA     L0D0C
        BNE     LBA57

.LBA4D
        LDA     L00BE
        STA     L0D0E
        LDA     L00BF
        STA     L0D0F
.LBA57
        LDA     L1003,X
        PHA
        AND     #$1F
        BEQ     LBA63

.LBA5F
        PLA
        JMP     LBF66

.LBA63
        PLA
        PHA
        AND     #$40
        BNE     LBA5F

        PLA
        AND     #$20
        BNE     LBA72

        LDA     #DS0SEL
        BNE     LBA74

.LBA72
        LDA     #DS1SEL
.LBA74
        STA     L0D5E
        ROR     L10E4
        SEC
        ROL     L10E4
        LDA     L1001,X
        PHA
        LDA     L1002,X
        TAX
        PLA
        LDY     #$FF
        JSR     LBFA2

        STA     L00A4
        STY     L00A5
        TYA
        SEC
        SBC     #$50
        BMI     LBA9B

        STA     L00A5
        JSR     LBD22

.LBA9B
        LDA     L0D5E
        STA     LFE80
        ROR     A
        BCC     LBAB0

        LDA     L10E5
        STA     L00A3
        BIT     L10E4
        BPL     LBABD

        BMI     LBABA

.LBAB0
        LDA     L10E6
        STA     L00A3
        BIT     L10E4
        BVC     LBABD

.LBABA
        JSR     LBD3F

.LBABD
        JSR     LBAC6

        JSR     LBCFD

        JMP     LBFAE

.LBAC6
        JSR     LBD2B

        LDX     #$00
        JSR     LBB09

        INX
        JSR     LBB09

        INX
        JSR     LBB09

        CMP     L00A3
        BEQ     LBAF4

        ROR     L10E4
        SEC
        ROL     L10E4
        LDA     #$14
        ORA     L0D5C
        STA     LFE84
        JSR     LBCC2

        LDA     L00A1
        ROR     A
        BCC     LBAF4

.LBAF1
        JMP     LBFAE

.LBAF4
        LDA     L00A5
        STA     L00A3
        BIT     L00A1
        BVS     LBB06

        LDY     #$05
        LDA     (L00B0),Y
        CMP     #$0B
        BNE     LBB06

        BEQ     LBAF1

.LBB06
        JMP     LBD2B

.LBB09
        LDA     L00A3,X
        STA     LFE85,X
        CMP     LFE85,X
        BNE     LBB09

        RTS

.LBB14
        TSX
        STX     L10E7
        LDA     #$10
        STA     L10E0
        JSR     LBB42

        JSR     LBDA6

        BEQ     LBAF1

.LBB25
        STA     L10E2
        TSX
        STX     L10E7
        LDA     #$10
        STA     L00B1
        LDA     #$15
        STA     L00B0
        LDA     #$00
        STA     L10E0
        JSR     LBB42

        JSR     LBD58

        JMP     LBFAE

.LBB42
        LDA     #$00
        STA     L10E3
        LDY     #$01
        LDA     (L00B0),Y
        STA     L00B2
        INY
        LDA     (L00B0),Y
        STA     L00B3
        INY
        LDA     (L00B0),Y
        TAX
        INY
        LDA     (L00B0),Y
        INX
        BEQ     LBB5F

        INX
        BNE     LBB63

.LBB5F
        CMP     #$FF
        BEQ     LBB6A

.LBB63
        BIT     L00CD
        BPL     LBB6A

        JSR     L8027

.LBB6A
        LDY     #$05
        LDA     (L00B0),Y
        CMP     #$08
        BEQ     LBB82

        CMP     #$0A
        BEQ     LBB89

        CMP     #$0B
        BEQ     LBB82

        LDA     #$67
        STA     L10E3
        JMP     LBFAE

.LBB82
        ROL     L10E0
        SEC
        ROR     L10E0
.LBB89
        JSR     LBBB4

        JSR     LBB92

        JMP     LBEFF

.LBB92
        JSR     LBBDA

        LDA     L10E8
        STA     L0D5C
        LDA     #$00
        STA     L00A0
        STA     L00A2
        LDA     L10E0
        ORA     #$20
        STA     L10E0
        STA     L00A1
        LDA     L00CD
        STA     L0D5D
        JSR     LBBF1

        RTS

.LBBB4
        LDA     #$00
        STA     L0D56
        STA     L10E8
        LDA     #$FF
        LDX     #$00
        TAY
        JSR     OSBYTE

        TXA
        PHA
        AND     #$20
        BEQ     LBBCF

        LDA     #$03
        STA     L10E8
.LBBCF
        PLA
        AND     #$10
        BEQ     LBBD9

        LDA     #$02
        STA     L0D56
.LBBD9
        RTS

.LBBDA
        LDA     #$8F
        LDX     #$0C
        LDY     #$FF
        JSR     OSBYTE

        STY     L10E1
        RTS

.LBBE7
        LDY     L10E1
        LDA     #$8F
        LDX     #$0B
        JMP     OSBYTE

.LBBF1
        LDY     #$48
.LBBF3
        LDA     LBC79,Y
        STA     L0D00,Y
        DEY
        BPL     LBBF3

        LDY     #$01
        LDA     (L00B0),Y
        STA     L0D0E
        INY
        LDA     (L00B0),Y
        STA     L0D0F
        BIT     L00A1
        BMI     LBC12

        LDA     #$5F
        STA     L0D05
.LBC12
        BIT     L00CD
        BVC     LBC21

        LDA     L00A1
        AND     #$FD
        STA     L00A1
        JSR     LBC2D

        BMI     LBC24

.LBC21
        JSR     LBC5C

.LBC24
        STA     L0D5F
        LDA     L00F4
        STA     L0D34
        RTS

.LBC2D
        LDA     L00A1
        ROL     A
        LDA     #$00
        ROL     A
        LDY     #$10
        LDX     #$27
        JSR     L0406

        LDA     L00A1
        AND     #$10
        BEQ     LBC4F

        BIT     L00A1
        BMI     LBC50

        LDY     #$07
.LBC46
        LDA     LBCED,Y
        STA     L0D0A,Y
        DEY
        BPL     LBC46

.LBC4F
        RTS

.LBC50
        LDY     #$07
.LBC52
        LDA     LBCF5,Y
        STA     L0D0A,Y
        DEY
        BPL     LBC52

        RTS

.LBC5C
        BIT     L00A1
        BMI     LBC78

        LDY     #$0D
.LBC62
        LDA     LBCDF,Y
        STA     L0D0A,Y
        DEY
        BPL     LBC62

        LDY     #$01
        LDA     (L00B0),Y
        STA     L0D0B
        INY
        LDA     (L00B0),Y
        STA     L0D0C
.LBC78
        RTS

;;;  Start of NMI handler
.LBC79
        PHA
        LDA     LFE84
        AND     #$1F
        CMP     #$03
        BNE     LBC93

        LDA     LFE87
        STA     LFFFF
        INC     L0D0E
        BNE     LBC91

        INC     L0D0F
.LBC91
        PLA
        RTI

.LBC93
        AND     #$58
        BEQ     LBCA5

        STA     L00A0
        ROR     L00A1
        SEC
        ROL     L00A1
.LBC9E
        ROR     L00A2
        SEC
        ROL     L00A2
        PLA
        RTI

.LBCA5
        BIT     L00A2
        BVC     LBC9E

        LDA     L00F4
        PHA
        LDA     #$00
        STA     L00F4
        STA     LFE30
        TXA
        PHA
        JSR     LBE69

        PLA
        TAX
        PLA
        STA     L00F4
        STA     LFE30
        PLA
        RTI

;;;  End of NMI handler

.LBCC2
        LDA     L00A2
        ROR     A
        BCC     LBCC8

        RTS

.LBCC8
        LDA     L0D5D
        AND     #$10
        BEQ     LBCC2

        BIT     L00FF
        BPL     LBCC2

        LDA     #$00
        STA     LFE80
        LDA     #$6F
        STA     L00A0
        JMP     LBFAE

;; Fragement of NMI handler
;; copied to &0D0A
.LBCDF
        LDA     LFFFF
        STA     LFE87
        INC     L0D0B
        BNE     LBCED
        INC     L0D0C
;; end of fragment

;; Fragement of NMI handler
;; copied to &0D0A
.LBCED
        LDA     LFEE5
        STA     LFE87
        BCS     LBCFB
;; end of fragment

;; Fragement of NMI handler
;; copied to &0D0A
.LBCF5
        LDA     LFE87
        STA     LFEE5
.LBCFB
        BCS     LBD03
;; end of fragment


.LBCFD
        BIT     L00A1
        BMI     LBD0E

        LDA     L00A3
.LBD03
        CMP     #$14
        LDA     #$A0
        BCC     LBD10

        ORA     L0D56
        BNE     LBD10

.LBD0E
        LDA     #$80
.LBD10
        JSR     LBD4C

        STA     LFE84
        JMP     LBCC2

IF PRESERVE_PADDING
        ;; TODO/FIX - how is this referenced?
        LDA     L0D5E
        AND     #($FF-SIDESEL)
        STA     L0D5E
        RTS
ENDIF

.LBD22
        LDA     L0D5E
        ORA     #SIDESEL
        STA     L0D5E
        RTS

.LBD2B
        ROR     L00A2
        CLC
        ROL     L00A2
        RTS

.LBD31
        LDA     L00A2
        AND     #$F7
        STA     L00A2
        RTS

.LBD38
        LDA     L00A2
        AND     #$FD
        STA     L00A2
        RTS

.LBD3F
        LDA     #$00
        STA     L00A3
        ORA     L0D5C
        STA     LFE84
        JMP     LBCC2

.LBD4C
        ROR     L10E4
        BCC     LBD54

        ORA     #$04
        CLC
.LBD54
        ROL     L10E4
        RTS

.LBD58
        LDA     L10E2
        STA     L0D0F
        LDA     #$00
        STA     L0D0E
        JSR     LBAC6

        JSR     LBCFD

        LDA     L00A3
        PHA
        LDA     L1016
        STA     L00A5
        LDA     L1017
        STA     L00A6
        LDA     #$00
        STA     L00A3
        LDA     L10E2
        STA     L00A4
        BIT     L00CD
        BVC     LBD97

        LDY     #$00
.LBD85
        LDA     (L00A3),Y
        LDX     #$07
.LBD89
        DEX
        BNE     LBD89

        STA     LFEE5
        INY
        CPY     L101E
        BNE     LBD85

        BEQ     LBDA2

.LBD97
        LDY     L101E
.LBD9A
        DEY
        LDA     (L00A3),Y
        STA     (L00A5),Y
        TYA
        BNE     LBD9A

.LBDA2
        PLA
        STA     L00A3
        RTS

.LBDA6
        JSR     LBAC6

        LDA     L00A2
        ORA     #$40
        STA     L00A2
        LDY     #$07
        LDA     (L00B0),Y
        STA     L0D58
        INY
        LDA     (L00B0),Y
        INY
        CLC
        ADC     (L00B0),Y
        STA     L0D59
        BCC     LBDC5

        INC     L0D58
.LBDC5
        LDA     L0D58
        TAX
        LDA     L0D59
        LDY     #$FF
        JSR     LBFA2

        CMP     #$00
        BNE     LBDD7

        LDA     #$10
.LBDD7
        LDY     #$09
        SEC
        SBC     (L00B0),Y
        BCS     LBDFB

        LDA     #$10
        SEC
        SBC     L00A4
        STA     L0D58
        LDA     (L00B0),Y
        SEC
        SBC     L0D58
        LDX     #$00
        LDY     #$FF
        JSR     LBFA2

        STY     L0D57
        STA     L0D59
        BPL     LBE0C

.LBDFB
        LDY     #$09
        LDA     (L00B0),Y
        STA     L0D58
        LDA     #$FF
        STA     L0D57
        LDA     #$00
        STA     L0D59
.LBE0C
        LDA     #$00
        STA     L0D5A
        INC     L0D57
        DEC     L0D58
        LDX     #$01
        JSR     LBB09

        BIT     L00A1
        BMI     LBE27

        LDA     #$A0
        ORA     L0D56
        BNE     LBE29

.LBE27
        LDA     #$80
.LBE29
        STA     L00A6
        JSR     LBD2B

        LDA     L00A6
        STA     LFE84
.LBE33
        JSR     LBCC2

        LDA     L00A2
        AND     #$02
        BEQ     LBE4E

        JSR     LBD2B

        JSR     LBD38

        LDA     #$54
        ORA     L0D5C
        STA     LFE84
        INC     L00A3
        BNE     LBE33

.LBE4E
        LDA     L00A2
        AND     #$08
        BEQ     LBE83

        JSR     LBD2B

        JSR     LBD31

        INC     L00A3
        JSR     LBD22

        LDA     #$00
        ORA     L0D5C
        STA     LFE84
        BPL     LBE33

.LBE69
        JSR     LBD2B

        JSR     LBE84

        TXA
        BNE     LBE78

        ROR     L00A2
        SEC
        ROL     L00A2
        RTS

.LBE78
        JSR     LBD38

        LDA     L00A6
        JSR     LBD4C

        STA     LFE84
.LBE83
        RTS

.LBE84
        LDA     L0D58
        BNE     LBEED

        LDA     L0D57
        BNE     LBE9D

        LDA     L0D59
        BNE     LBE97

        LDX     #$00
        BEQ     LBEFE

.LBE97
        DEC     L0D59
        JMP     LBEF0

.LBE9D
        LDA     L0D5A
        BNE     LBEE7

        ROR     L10E4
        SEC
        ROL     L10E4
        LDA     LFE85
        CMP     #$4F
        BCC     LBECF

        LDA     L0D5E
        AND     #SIDESEL
        BEQ     LBEBC

        LDX     #$00
        JMP     LBEF2

.LBEBC
        LDA     #$FF
        STA     L00A3
        JSR     LBD22

        LDA     L0D5E
        STA     LFE80
        LDA     L00A2
        ORA     #$08
        BNE     LBED3

.LBECF
        LDA     L00A2
        ORA     #$02
.LBED3
        STA     L00A2
        DEC     L0D57
        BEQ     LBEDF

        LDA     #$10
        STA     L0D5A
.LBEDF
        LDA     #$FE
        STA     L00A4
        LDX     #$00
        BEQ     LBEF2

.LBEE7
        DEC     L0D5A
        JMP     LBEF0

.LBEED
        DEC     L0D58
.LBEF0
        LDX     #$FF
.LBEF2
        INC     L00A4
.LBEF4
        LDA     L00A4
        STA     LFE86
        CMP     LFE86
        BNE     LBEF4

.LBEFE
        RTS

.LBEFF
        LDY     #$06
        LDA     (L00B0),Y
        ORA     L1117
        STA     L00A6
        AND     #$1F
        BEQ     LBF0F

        JMP     LBF66

.LBF0F
        BIT     L00A6
        BVC     LBF19

        LDA     #$65
        STA     L00A0
        BNE     LBF6A

.LBF19
        LDA     L00A6
        AND     #$20
        BNE     LBF23

        LDA     #DS0SEL
        BNE     LBF25

.LBF23
        LDA     #DS1SEL
.LBF25
        STA     L0D5E
        ROR     L10E4
        SEC
        ROL     L10E4
        JSR     LBF55

        LDA     L0D5E
        STA     LFE80
        ROR     A
        BCC     LBF47

        LDA     L10E5
        STA     L00A3
        BIT     L10E4
        BPL     LBF54

        BMI     LBF51

.LBF47
        LDA     L10E6
        STA     L00A3
        BIT     L10E4
        BVC     LBF54

.LBF51
        JSR     LBD3F

.LBF54
        RTS

.LBF55
        LDY     #$07
        LDA     (L00B0),Y
        CMP     #$0A
        BCC     LBF86

        BNE     LBF66

        INY
        LDA     (L00B0),Y
        CMP     #$00
        BCC     LBF6C

.LBF66
        LDA     #$61
        STA     L00A0

IF PATCH_DATACENTRE

        BNE     LBFAE
.LBF6A
.LBF6C
        LDX     L00B0
        LDY     L00B1
        LDA     #$76
        JSR     OSWORD
        JMP     LBFAE
        PAD00   14

ELSE

.LBF6A
        BNE     LBFAE

.LBF6C
        LDA     L00A1
        AND     #$10
        BEQ     LBF86

        LDY     #$09
        LDA     (L00B0),Y
        DEY
        CLC
        ADC     (L00B0),Y
        BCS     LBF80

        CMP     #$01
        BCC     LBF86

.LBF80
        LDA     #$63
        STA     L00A0
        BNE     LBFAE
ENDIF

.LBF86
        LDY     #$07
        LDA     (L00B0),Y
        TAX
        INY
        LDA     (L00B0),Y
        LDY     #$FF
        JSR     LBFA2

        STA     L00A4
        STY     L00A5
        TYA
        SEC
        SBC     #$50
        BMI     LBFAD

        STA     L00A5
        JMP     LBD22

.LBFA2
        SEC
        SBC     #$10
        INY
        BCS     LBFA2

        DEX
        BPL     LBFA2

        ADC     #$10
.LBFAD
        RTS

.LBFAE
        LDX     L10E7
        TXS
        LDA     L10E0
        AND     #$20
        BEQ     LBFE0

        LDA     L0D5E
        ROR     A
        LDA     L00A3
        BCC     LBFCD

        STA     L10E5
        ROL     L10E4
        CLC
        ROR     L10E4
        BCS     LBFD8

.LBFCD
        STA     L10E6
        LDA     L10E4
        AND     #$BF
        STA     L10E4
.LBFD8
        LDA     L00A0
        STA     L10E3
        JSR     LBBE7

.LBFE0
        JSR     L8043

        LDX     L00B0
        LDA     L10E3
        BEQ     LBFF1

        ORA     #$40
        LDY     #$FF
        STY     L10E4
.LBFF1
        LDY     L00B1
        AND     #$7F
        RTS

IF PRESERVE_PADDING
        EQUS    "and Hugo."
    IF PATCH_IDE_JGH
        EQUB    $23
    ELSE
        EQUB    $0D
    ENDIF
ENDIF
