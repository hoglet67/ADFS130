; Optional ADFS patches
PATCH_IDE                = FALSE   ; replace SCSI drivers with IDE
PATCH_IDE_RESULTCODES    = FALSE   ; correct the result codes returned by IDE driver
PATCH_FULL_ACCESS        = FALSE   ; allow the E access bit to be removed
PATCH_INFO               = FALSE   ; show full info on directories
PATCH_UNSUPPORTED_OSFILE = FALSE   ; fix corrupted A register in unsupported OSFILE
PATCH_PRESERVE_CONTEXT   = FALSE   ; preseve context (e.g. directory) over hard-break

; IO specific addresses
FDC_BASE                 = $FCC0
ROM_LATCH                = $FE05
SCSI_IDE_BASE            = $FC40
TUBE_BASE                = $FCE0
VIA_BASE                 = $FCB0

; Whether to preserve padding, for binary comparison with known versions
PRESERVE_PADDING         = FALSE

; Common build version
include "BUILD.asm"

; Version macros
MACRO INSERT_NAME_STR
        EQUS    "Electron ADFS"
ENDMACRO
MACRO INSERT_COPYRIGHT_STR
        EQUS    "(C)2017 Acorn"
ENDMACRO
MACRO INSERT_VERSION_STR
        EQUS    "1.00"
ENDMACRO
MACRO INSERT_VERSION_BIN
        EQUS    $00
ENDMACRO
MACRO INSERT_HELP_STR
        INSERT_NAME_STR
        EQUS " "
        INSERT_VERSION_STR
        EQUS "."
        INSERT_BUILD_STR
ENDMACRO

; Include common source file
include "ADFS130.asm"
