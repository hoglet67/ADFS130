        RTS

IF PATCH_PRESERVE_CONTEXT
.ReadBreak
        LDA     L028D
        AND     #$01
        RTS
ELSE
        PAD     6
ENDIF

.WaitForData
        PHA
.WaitLp
        PLA
        LDA     LFC47
        PHA
        AND     #$08
        BEQ     WaitLp
        PLA
        RTS

.MountCheck
        JSR     LA15E
        JMP     L9B3C

IF PRESERVE_PADDING
        ;; Junk bytes
        EQUB    $f9, $60
ENDIF        
        
        
