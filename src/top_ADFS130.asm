; Define platforms
PLAT_ELK                 = 1
PLAT_BBC                 = 2
PLATFORM                 = PLAT_BBC

; Optional ADFS patches
PATCH_IDE                = FALSE   ; replace SCSI drivers with IDE
PATCH_IDE_JGH            = FALSE   ; track JGH's latest IDE patch
PATCH_IDE_RESULTCODES    = FALSE   ; correct the result codes returned by IDE driver
PATCH_FULL_ACCESS        = FALSE   ; allow the E access bit to be removed
PATCH_INFO               = FALSE   ; show full info on directories
PATCH_UNSUPPORTED_OSFILE = FALSE   ; fix corrupted A register in unsupported OSFILE
PATCH_PRESERVE_CONTEXT   = FALSE   ; preseve context (e.g. directory) over hard-break
PATCH_TUBE_DELAY         = FALSE   ; add additional delay to tube accesses for 6MHz 32016
PATCH_DATACENTRE         = FALSE   ; forward on to DataCentre OSWORD &76
PATCH_COMPACT_CURSOR     = FALSE   ; patch *COMPACT to use screen RAM + turn off cursor

; IO specific addresses
SCSI_IDE_BASE            = $FC40
TUBE_BASE                = $FEE0
VIA_BASE                 = $FE40

; Whether to preserve padding, for binary comparison with known versions
PRESERVE_PADDING         = TRUE

; Version macros
MACRO INSERT_NAME_STR
        EQUS    "Acorn ADFS"
ENDMACRO
MACRO INSERT_COPYRIGHT_STR
        EQUS    "(C)1983 Acorn"
ENDMACRO
MACRO INSERT_VERSION_STR
        EQUS    "1.30"
ENDMACRO
MACRO INSERT_VERSION_BIN
        EQUS    $30
ENDMACRO
MACRO INSERT_HELP_STR
        EQUS    "Advanced DFS "
        INSERT_VERSION_STR
ENDMACRO

; Note: this generates a version with the same md5sum as ADFS130
; released by Acorn: 831e831ee90ac5d49ba5507252faf0c12536

; Include common source file
include "ADFS130.asm"
