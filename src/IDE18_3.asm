
.SetSector
        PHP
        JSR     WaitNotBusy
        LDY     #$08
        LDA     #$01
        STA     LFC42
        CLC
        LDA     (L00B0),Y
        AND     #$3F
        ADC     #$01
        STA     LFC43
        DEY
        LDA     (L00B0),Y
        ADC     #$00
        STA     LFC44
        DEY
        LDA     (L00B0),Y
        JSR     SetCylinder
        INY
        INY
        EOR     (L00B0),Y
        AND     #$02
        EOR     (L00B0),Y
        JSR     SetDrive
        DEY
        DEY
        DEY
        LDA     (L00B0),Y

.SetCommand
        AND     #$02
        PHA
        EOR     #$02
        LSR     A
        LSR     A
        PLA
        ASL     A
        ASL     A
        ASL     A
        ORA     #$20
        LDY     #$0
        PLP

.SetCmd
        STA     LFC47
        RTS

.SetDrive
        ROL     A
        ROL     A
        ROL     A

.SetDriveA
        AND     #$13
        STA     LFC46
        RTS


.SetCylinder
        PHA
        AND     #$3F
        ADC     #$00
        STA     LFC45
        PLA
        ROL     A
        ROL     A
        ROL     A
        ROL     A
        RTS


.SetRandom
        JSR     SetCylinder
        EOR     L1001,X
        AND     #$02
        EOR     L1001,X
        JSR     SetDrive
        PLA
        JMP     SetCommand1

.GetResult
        LDA     LFC47
        AND     #$21
        BEQ     GetResOk
        ORA     LFC41
        LDX     #$FF

.GetResLp
        INX
        ROR     A
        BCC     GetResLp
        LDA     ResultCodes,X

.GetResOk
        RTS

        PAD     7
