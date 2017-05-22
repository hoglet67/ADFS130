L0D10   = $0D10
L0D11   = $0D11
L0D12   = $0D12
L0D13   = $0D13
L0D14   = $0D14
L0D15   = $0D15
L0D16   = $0D16

LFCC0   = $FCC0
LFCC4   = $FCC4
LFCC5   = $FCC5
LFCC6   = $FCC6
LFCC7   = $FCC7
 
LFCE5   = TUBE_BASE + 5
       
LFE07   = $FE07

        ORG     &BA00
        
.LBA00
        JMP     LBC4A

.LBA03
        JMP     LBC5E

.LBA06
        JMP     LBB70

.LBA09
        JMP     LBB74

.LBA0C
        LDA     #$FF
        STA     L10E4
.LBA11
        LDA     #$5A
        STA     LFCC5
        LDA     LFCC5
        CMP     #$5A
        BNE     LBA25

        LDA     LFCC0
        AND     #$03
        BEQ     LBA25

        CLC
.LBA25
        RTS

.LBA26
        STA     LFCC4
        LDY     #$09
.LBA2B
        DEY
        BNE     LBA2B

        TXA
        BEQ     LBA7A

        BIT     L00A1
        BMI     LBA52

        JMP     (L0D10)

.LBA38
        LDA     LFCC4
        ROR     A
        BCC     LBA4A

        ROR     A
        BCC     LBA38

        STX     LFCC7
        INY
        BEQ     LBA38

        JMP     (L0D10)

.LBA4A
        ASL     A
        AND     L0D15
        BEQ     LBA95

        BNE     LBA88

.LBA52
        LDA     LFCC4
        ROR     A
        BCC     LBA4A

        ROR     A
        BCC     LBA52

        LDA     LFCC7
        JMP     (L0D10)

        LDA     LFCE5
        TAX
        JMP     LBA38

        STA     LFCE5
        JMP     LBA52

        STA     (L00CE),Y
        INY
        JMP     LBA52

        LDA     (L00CE),Y
        TAX
        JMP     LBA38

.LBA7A
        LDA     LFCC4
        ROR     A
        BCS     LBA7A

        ROL     A
        AND     L0D15
        AND     #$FB
        BEQ     LBA97

.LBA88
        STA     L00A0
        ROR     L00A1
        SEC
        ROL     L00A1
.LBA8F
        ROR     L00A2
        SEC
        ROL     L00A2
        RTS

.LBA95
        INC     L00CF
.LBA97
        LDA     L0D5D
        AND     #$10
        BEQ     LBAAE

        BIT     L00FF
        BPL     LBAAE

        LDA     #$00
        STA     LFCC0
        LDA     #$6F
        STA     L00A0
        JMP     LBFAE

.LBAAE
        BIT     L00A2
        BVC     LBA8F

        JSR     LBE7F

        RTS

.LBAB6
        LDX     #$00
        BEQ     LBABC

.LBABA
        LDX     #$FF
.LBABC
        JSR     LBA26

        LDA     L00A2
        ROR     A
        LDA     L00A6
        BCC     LBABA

        RTS

.LBAC7
        BIT     L00CD
        BVC     LBAF4

        LDA     L00A1
        AND     #$FD
        STA     L00A1
        ROL     A
        LDA     #$00
        ROL     A
        LDY     #$10
        LDX     #$27
        JSR     L0406

        LDA     L00A1
        AND     #$10
        BEQ     LBB1F

        BIT     L00A1
        BMI     LBAED

        LDX     #$61
        LDY     #$BA
        JMP     LBB03

.LBAED
        LDX     #$68
        LDY     #$BA
        JMP     LBB03

.LBAF4
        BIT     L00A1
        BMI     LBAFF

        LDX     #$74
        LDY     #$BA
        JMP     LBB03

.LBAFF
        LDX     #$6E
        LDY     #$BA
.LBB03
        STX     L0D10
        STY     L0D11
        LDY     #$01
        LDA     (L00B0),Y
        STA     L00CE
        INY
        LDA     (L00B0),Y
        STA     L00CF
        LDX     #$1C
        BIT     L00A1
        BMI     LBB1C

        LDX     #$5C
.LBB1C
        STX     L0D15
.LBB1F
        RTS

.LBB20
        PHP
        PLA
        STA     L0D16
        SEI
        LDA     L00CE
        STA     L0D13
        LDA     L00CF
        STA     L0D14
        LDX     #$01
        LDA     #$73
        JSR     LFFF4

        LDX     #$00
        LDY     #$FF
        LDA     #$F2
        JSR     LFFF4

        TXA
        STA     L0D12
        AND     #$F9
        TAX
        AND     #$20
        BNE     LBB4F

        TXA
        ORA     #$30
        TAX
.LBB4F
        STX     LFE07
        RTS

.LBB53
        LDA     L0D12
        STA     LFE07
        LDX     #$00
        LDA     #$73
        JSR     LFFF4

        LDA     L0D13
        STA     L00CE
        LDA     L0D14
        STA     L00CF
        LDA     L0D16
        PHA
        PLP
        RTS

.LBB70
        LDA     #$40
        BNE     LBB76

.LBB74
        LDA     #$C0
.LBB76
        STA     L10E0
        TXA
        TSX
        STX     L10E7
        PHA
        JSR     LBB20

        JSR     LBCF0

        JSR     LBCCE

        PLA
        TAX
        BIT     L00A1
        BMI     LBB98

        LDA     L00BC
        STA     L00CE
        LDA     L00BD
        STA     L00CF
        BNE     LBBA0

.LBB98
        LDA     L00BE
        STA     L00CE
        LDA     L00BF
        STA     L00CF
.LBBA0
        LDA     L1003,X
        PHA
        AND     #$1F
        BEQ     LBBAC

.LBBA8
        PLA
        JMP     LBF66

.LBBAC
        PLA
        PHA
        AND     #$40
        BNE     LBBA8

        PLA
        AND     #$20
        BNE     LBBBB

        LDA     #$21
        BNE     LBBBD

.LBBBB
        LDA     #$22
.LBBBD
        STA     L0D5E
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
        BMI     LBBDD

        STA     L00A5
        JSR     LBD44

.LBBDD
        LDA     L0D5E
        STA     LFCC0
        ROR     A
        BCC     LBBF2

        LDA     L10E5
        STA     L00A3
        BIT     L10E4
        BPL     LBBFF

        BMI     LBBFC

.LBBF2
        LDA     L10E6
        STA     L00A3
        BIT     L10E4
        BVC     LBBFF

.LBBFC
        JSR     LBD61

.LBBFF
        JSR     LBC08

        JSR     LBD25

        JMP     LBFAE

.LBC08
        JSR     LBD4D

        LDX     #$00
        JSR     LBC3F

        INX
        JSR     LBC3F

        INX
        JSR     LBC3F

        CMP     L00A3
        LDA     #$14
        ORA     L0D5C
        JSR     LBAB6

        LDA     L00A1
        ROR     A
        BCC     LBC2A

.LBC27
        JMP     LBFAE

.LBC2A
        LDA     L00A5
        STA     L00A3
        BIT     L00A1
        BVS     LBC3C

        LDY     #$05
        LDA     (L00B0),Y
        CMP     #$0B
        BNE     LBC3C

        BEQ     LBC27

.LBC3C
        JMP     LBD4D

.LBC3F
        LDA     L00A3,X
        STA     LFCC5,X
        CMP     LFCC5,X
        BNE     LBC3F

        RTS

.LBC4A
        TSX
        STX     L10E7
        JSR     LBB20

        LDA     #$10
        STA     L10E0
        JSR     LBC7E

        JSR     LBDB7

        BEQ     LBC27

.LBC5E
        STA     L10E2
        TSX
        STX     L10E7
        JSR     LBB20

        LDA     #$10
        STA     L00B1
        LDA     #$15
        STA     L00B0
        LDA     #$00
        STA     L10E0
        JSR     LBC7E

        JSR     LBD6B

        JMP     LBFAE

.LBC7E
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
        BEQ     LBC9B

        INX
        BNE     LBC9F

.LBC9B
        CMP     #$FF
        BEQ     LBCA6

.LBC9F
        BIT     L00CD
        BPL     LBCA6

        JSR     L8027

.LBCA6
        LDY     #$05
        LDA     (L00B0),Y
        CMP     #$08
        BEQ     LBCBE

        CMP     #$0A
        BEQ     LBCC5

        CMP     #$0B
        BEQ     LBCBE

        LDA     #$67
        STA     L10E3
        JMP     LBFAE

.LBCBE
        ROL     L10E0
        SEC
        ROR     L10E0
.LBCC5
        JSR     LBCF0

        JSR     LBCCE

        JMP     LBF06

.LBCCE
        JSR     LBD0E

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
        JSR     LBAC7

        RTS

.LBCF0
        LDA     #$FF
        LDX     #$00
        TAY
        JSR     LFFF4

        TXA
        EOR     #$FF
        ROR     A
        ROR     A
        ROR     A
        ROR     A
        PHA
        AND     #$03
        TAX
        PLA
        ROR     A
        AND     #$02
        STA     L0D56
        STX     L10E8
        RTS

.LBD0E
        LDA     #$8F
        LDX     #$0C
        LDY     #$FF
        JSR     LFFF4

        STY     L10E1
        RTS

.LBD1B
        LDY     L10E1
        LDA     #$8F
        LDX     #$0B
        JMP     LFFF4

.LBD25
        BIT     L00A1
        BMI     LBD36

        LDA     L00A3
        CMP     #$14
        LDA     #$A0
        BCC     LBD38

        ORA     L0D56
        BNE     LBD38

.LBD36
        LDA     #$80
.LBD38
        JMP     LBABA

        LDA     L0D5E
        AND     #$FB
        STA     L0D5E
        RTS

.LBD44
        LDA     L0D5E
        ORA     #$04
        STA     L0D5E
        RTS

.LBD4D
        ROR     L00A2
        CLC
        ROL     L00A2
        RTS

.LBD53
        LDA     L00A2
        AND     #$F7
        STA     L00A2
        RTS

.LBD5A
        LDA     L00A2
        AND     #$FD
        STA     L00A2
        RTS

.LBD61
        LDA     #$04
        STA     L00A3
        ORA     L0D5C
        JMP     LBAB6

.LBD6B
        LDA     L10E2
        STA     L00CF
        LDA     #$00
        STA     L00CE
        JSR     LBC08

        JSR     LBD25

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
        BVC     LBDA8

        LDY     #$00
.LBD96
        LDA     (L00A3),Y
        LDX     #$07
.LBD9A
        DEX
        BNE     LBD9A

        STA     LFCE5
        INY
        CPY     L101E
        BNE     LBD96

        BEQ     LBDB3

.LBDA8
        LDY     L101E
.LBDAB
        DEY
        LDA     (L00A3),Y
        STA     (L00A5),Y
        TYA
        BNE     LBDAB

.LBDB3
        PLA
        STA     L00A3
        RTS

.LBDB7
        JSR     LBC08

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
        BCC     LBDD6

        INC     L0D58
.LBDD6
        LDA     L0D58
        TAX
        LDA     L0D59
        LDY     #$FF
        JSR     LBFA2

        CMP     #$00
        BNE     LBDE8

        LDA     #$10
.LBDE8
        LDY     #$09
        SEC
        SBC     (L00B0),Y
        BCS     LBE0C

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
        BPL     LBE1D

.LBE0C
        LDY     #$09
        LDA     (L00B0),Y
        STA     L0D58
        LDA     #$FF
        STA     L0D57
        LDA     #$00
        STA     L0D59
.LBE1D
        LDA     #$00
        STA     L0D5A
        INC     L0D57
        DEC     L0D58
        LDX     #$01
        JSR     LBC3F

        BIT     L00A1
        BMI     LBE3E

        LDA     #$A3
        CMP     #$14
        LDA     #$A0
        BCC     LBE40

        ORA     L0D56
        BNE     LBE40

.LBE3E
        LDA     #$80
.LBE40
        STA     L00A6
        JSR     LBD4D

        LDA     L00A6
        JSR     LBABA

.LBE4A
        LDA     L00A2
        AND     #$02
        BEQ     LBE63

        JSR     LBD4D

        JSR     LBD5A

        LDA     #$54
        ORA     L0D5C
        INC     L00A3
        JSR     LBAB6

        JMP     LBE4A

.LBE63
        LDA     L00A2
        AND     #$08
        BEQ     LBE91

        JSR     LBD4D

        JSR     LBD53

        INC     L00A3
        JSR     LBD44

        LDA     #$04
        ORA     L0D5C
        JSR     LBAB6

        JMP     LBE4A

.LBE7F
        JSR     LBD4D

        JSR     LBE92

        TXA
        BNE     LBE8E

        ROR     L00A2
        SEC
        ROL     L00A2
        RTS

.LBE8E
        JSR     LBD5A

.LBE91
        RTS

.LBE92
        LDA     L0D58
        BNE     LBEF4

        LDA     L0D57
        BNE     LBEAB

        LDA     L0D59
        BNE     LBEA5

        LDX     #$00
        BEQ     LBF05

.LBEA5
        DEC     L0D59
        JMP     LBEF7

.LBEAB
        LDA     L0D5A
        BNE     LBEEE

        LDA     LFCC5
        CMP     #$4F
        BCC     LBED6

        LDA     L0D5E
        AND     #$04
        BEQ     LBEC3

        LDX     #$00
        JMP     LBEF9

.LBEC3
        LDA     #$FF
        STA     L00A3
        JSR     LBD44

        LDA     L0D5E
        STA     LFCC0
        LDA     L00A2
        ORA     #$08
        BNE     LBEDA

.LBED6
        LDA     L00A2
        ORA     #$02
.LBEDA
        STA     L00A2
        DEC     L0D57
        BEQ     LBEE6

        LDA     #$10
        STA     L0D5A
.LBEE6
        LDA     #$FE
        STA     L00A4
        LDX     #$00
        BEQ     LBEF9

.LBEEE
        DEC     L0D5A
        JMP     LBEF7

.LBEF4
        DEC     L0D58
.LBEF7
        LDX     #$FF
.LBEF9
        INC     L00A4
.LBEFB
        LDA     L00A4
        STA     LFCC6
        CMP     LFCC6
        BNE     LBEFB

.LBF05
        RTS

.LBF06
        LDY     #$06
        LDA     (L00B0),Y
        ORA     L1117
        STA     L00A6
        AND     #$1F
        BEQ     LBF16

        JMP     LBF66

.LBF16
        BIT     L00A6
        BVC     LBF20

        LDA     #$65
        STA     L00A0
        BNE     LBF6A

.LBF20
        LDA     L00A6
        AND     #$20
        BNE     LBF2A

        LDA     #$21
        BNE     LBF2C

.LBF2A
        LDA     #$22
.LBF2C
        STA     L0D5E
        JSR     LBF55

        LDA     L0D5E
        STA     LFCC0
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
        JSR     LBD61

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
        JMP     LBD44

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
        JSR     LBB53

        LDX     L10E7
        TXS
        LDA     L10E0
        AND     #$20
        BEQ     LBFE3

        LDA     L0D5E
        ROR     A
        LDA     L00A3
        BCC     LBFD0

        STA     L10E5
        ROL     L10E4
        CLC
        ROR     L10E4
        BCS     LBFDB

.LBFD0
        STA     L10E6
        LDA     L10E4
        AND     #$BF
        STA     L10E4
.LBFDB
        LDA     L00A0
        STA     L10E3
        JSR     LBD1B

.LBFE3
        JSR     L8043

        LDX     L00B0
        LDA     L10E3
        BEQ     LBFF4

        ORA     #$40
        LDY     #$FF
        STY     L10E4
.LBFF4
        LDY     L00B1
        AND     #$7F
        RTS

IF PRESERVE_PADDING
        EQUB    $00
        EQUS    "Roger"
        EQUB    $00
ENDIF
        
