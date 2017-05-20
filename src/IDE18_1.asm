        RTS

        PAD     4

IF PATCH_PRESERVE_CONTEXT
.ReadBreak
        LDA     L028D
        AND     #$01
        RTS
ELSE
        PAD     6
ENDIF
        PAD     1

.WaitForData
        LDA     LFC47
        AND     #$08
        BEQ     WaitForData
        RTS

.MountCheck
        JSR     LA15E
        JMP     L9B38

.L807F
        RTS

        
