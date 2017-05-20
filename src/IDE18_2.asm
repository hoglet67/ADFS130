        JMP     BYE
        PAD     4

.CommandSaveLp1
        LDY     #$09

.CommandSaveLp
        LDA     L007F,Y
        PHA
        LDA     (L00B0),Y
        STA     L007F,Y
        DEY
        BNE     CommandSaveLp

        LDA     L00B0
        PHA
        LDA     L00B1
        PHA
        JSR     UpdateDrive
        STA     L00B0
        STY     L00B1
        PHP
        JSR     SetGeometry
        PLP

.CommandLoop
        LDX     #$02

.Twice
        BIT     L00CD
        BVC     CommandStart
        PHP
        TXA
        PHA
        LDX     #$27
        LDY     #$10
        LDA     #$00
        ROL     A
        EOR     #$01
        JSR     SetTubeAction+1
        PLA
        TAX
        PLP

.CommandStart
        JSR     SetSector

.TransferLoop
        JSR     WaitForData
        AND     #$21
        BNE     TransDone
        BIT     L00CD
        BVS     TransTube
        BCC     IORead

.IOWrite
        LDA     (L0080),Y
        STA     LFC40
        JMP     TransferByte

.IORead
        LDA     LFC40
        STA     (L0080),Y
        JMP     TransferByte

.TransTube
        BCC     TubeRead

.TubeWrite
        LDA     LFEE5
        STA     LFC40
        JMP     TransferByte

.TubeRead
        LDA     LFC40
        STA     LFEE5
        JMP     TransferByte

.CommandLoop1
        JMP     CommandLoop

.L818A

.CommandDone
        JSR     GetResult

.CommandExit
        PHA
        JSR     L8043
        PLA
        LDX     L00B0
        LDY     L00B1
        AND     #$7F
        RTS

.TransferByte
        INY
        BNE     TransferLoop
        DEX
        BNE     Twice
        INC     L0081
        LDA     LFC47
        AND     #$21
        BNE     TransDone
        INC     L1028
        BNE     TubeAddr
        INC     L1029
        BNE     TubeAddr
        INC     L102A

.TubeAddr
        INC     L0087
        BNE     TransCount
        INC     L0086
        BNE     TransCount
        INC     L0085

.TransCount
        DEC     L0088
        BNE     CommandLoop1

.TransDone
        PLA
        STA     L00B1
        PLA
        STA     L00B0
        INY

.CommandRestore
        PLA
        STA     L007F,Y
        INY
        CPY     #$0A
        BNE     CommandRestore
        BEQ     CommandDone

.SetGeometry
        JSR     WaitNotBusy
        LDA     #$40
        STA     LFC42
        STA     LFC43
        LDY     #$06
        LDA     (L00B0),Y
        LSR     A
        LSR     A
        ORA     #$03
        JSR     SetDriveA
        LDA     #$91
        BNE     SetCmd
.SetTubeAction
