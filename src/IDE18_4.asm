        RTS

.BYE
        LDY     #$05
        LDA     (L00B0),Y
        CMP     #$09            ; Get command, CC=Read, CS=Write
        AND     #$FD
        EOR     #$08
        BEQ     CommandOk       ; Jump if Read (&08) or Write (&0A)
        LDA     #$60
        JMP     CommandExit     ; Return 'bad command' otherwise

.CommandOk
        JMP     CommandSaveLp1  ; Memory FULL

.SetCommand1
        PHP
        JMP     SetCommand

;; Junk bytes....

        EQUB $11,$38,$E9,$20,$8D,$17,$11,$B0,$EE
