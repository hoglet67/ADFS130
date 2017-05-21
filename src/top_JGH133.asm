; Optional ADFS patches
PATCH_IDE                = TRUE    ; replace SCSI drivers with IDE
PATCH_IDE_JGH            = TRUE    ; track JGH's latest IDE patch
PATCH_IDE_RESULTCODES    = TRUE    ; correct the result codes returned by IDE driver
PATCH_FULL_ACCESS        = TRUE    ; allow the E access bit to be removed
PATCH_INFO               = TRUE    ; show full info on directories
PATCH_UNSUPPORTED_OSFILE = TRUE    ; fix corrupted A register in unsupported OSFILE
PATCH_PRESERVE_CONTEXT   = TRUE    ; preseve context (e.g. directory) over hard-brea
PATCH_TUBE_DELAY         = TRUE    ; add additional delay to tube accesses for 6MHz 32016
PATCH_DATACENTRE         = TRUE    ; forward on to DataCentre OSWORD &76
        
; IO specific addresses
FDC_BASE                 = $FE80
ROM_LATCH                = $FE30
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
        EQUS    "(C)2005 Acorn"
ENDMACRO
MACRO INSERT_VERSION_STR
        EQUS    "1.33"
ENDMACRO
MACRO INSERT_VERSION_BIN
        EQUS    $33
ENDMACRO
MACRO INSERT_HELP_STR
        EQUS    "Acorn ADFS 1.33r23"
ENDMACRO

; Note: this generates a version with the same md5sum as ADFS133
; distributed by JGH:

; Include common source file
include "ADFS130.asm"
