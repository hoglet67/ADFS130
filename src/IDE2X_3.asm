.TubeAction
        LDA     #0
        ROL     A
        EOR     #1
        BCC     L81F0

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
;       ADC     #$00
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
        ASL     A
        ASL     A
        ASL     A
        EOR     #$60
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
;       ADC     #$00
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
        PHP
        JMP     SetCommand

.GetResult
        LDA     LFC47
        AND     #$21
        BEQ     GetResOk
        LDA     LFC41
        LDX     #$FF

.GetResLp
        INX
        ROR     A
        BCC     GetResLp
        LDA     ResultCodes,X

.GetResOk
        RTS

        PAD00   11
