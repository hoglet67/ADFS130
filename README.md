# Acorn ADFS 1.0x / 1.3x - Release 004

## Summary

* The 1.0x builds are for the Electron
* The 1.3x builds are for the Model B
* The 1.x0 builds include the SCSI and Floppy Drivers
* The 1.x3 builds include th IDE and Floppy Drivers

## Details

The following top level builds exist:

__src/top_ADFS130.asm__

* The original Acorn ADFS for the Model B
* preserves all padding and dead code
* contains HELP message: Advanced DFS 1.30
* md5sum = 831ee90ac5d49ba5507252faf0c12536 (will never change)
* 0 bytes free

__src/top_ADFS133.asm__

* My preferred Acorn ADFS build with IDE drivers for the Model B
* includes most of JGH's v1.23 IDE Patch
* excludes the PRESERVE CONTEXT patch
* excludes the TUBE DELAY patch
* doesn't preserve padding, so code is squished up and dead code removed
* contains HELP message: Acorn ADFS 1.33.002 (with my build number)
* md5sum = 802d9dff4964eef91f7aa43add0f1aa5 (will change)
* currently 151 bytes free

__src/top_DC133.asm__

* The IDE version of Acorn ADFS shipped in 2008 with Data Centre
* includes JGH's v1.18 IDE Patch
* preserves all padding and dead code
* contains HELP message: Advanced DFS 1.30
* md5sum = c7714bd93602fdc11d2cdaab4af03b07 (will never change)
* 0 bytes free

__src/top_ELK100.asm__

* Non-original ADFS 1.00 for the Acorn Electron
* identical to ADFS 1.30, but with Electrion I/O addresses
* preserves all padding and dead code
* contains HELP message: Advanced DFS 1.00
* md5sum = 883ab9513765f25d16277fce4a4581bc (might change)
* 0 bytes free

__src/top_ELK103.asm__

* My preferred Acorn ADFS build with IDE drivers for the Electron
* includes most of JGH's v1.23 IDE Patch
* excludes the PRESERVE CONTEXT patch
* excludes the TUBE DELAY patch
* doesn't preserve padding, so code is squished up and dead code removed
* contains HELP message: Electron ADFS 1.03.002 (with my build number)
* md5sum = da081bc503368cdb621e5d3f6588a968 (will change)
* currently 7 bytes free

__src/top_JGH133.asm__

* JGH's Acorn ADFS build with IDE drivers for the Model B
* contains his complete v1.23 IDE patch
* identical to the version here: http://mdfs.net/Info/Comp/BBC/IDE/ADFS/ADFS133
* preserves all padding and dead code
* contains HELP message: Acorn ADFS 1.33r23
* md5sum = 2be42f51899aded44607c5167d72e34d (will change)
* 0 bytes free

__src/top_MAST130.asm__

* Acorn ADFS 1.30 adapted for the Master register addresses
* preserves all padding and dead code
* contains HELP message: Advanced DFS 1.30
* md5sum = eba60d5fa071148444581bb65fb2d75b
* 0 bytes free

## Full build log
```
Blank build/adfs.ssd created

Building ADFS130...
    code ends at &C000  ( 0 bytes free )
    mdsum is 831ee90ac5d49ba5507252faf0c12536 -
Building ADFS133...
    code ends at &BF69  ( 151 bytes free )
    mdsum is 802d9dff4964eef91f7aa43add0f1aa5 -
Building DC133...
    code ends at &C000  ( 0 bytes free )
    mdsum is c7714bd93602fdc11d2cdaab4af03b07 -
Building ELK100...
    code ends at &C000  ( 0 bytes free )
    mdsum is 883ab9513765f25d16277fce4a4581bc -
Building ELK103...
    code ends at &BFF9  ( 7 bytes free )
    mdsum is da081bc503368cdb621e5d3f6588a968 -
Building JGH133...
    code ends at &C000  ( 0 bytes free )
    mdsum is 2be42f51899aded44607c5167d72e34d -
Building MAST130...
    code ends at &C000  ( 0 bytes free )
    mdsum is eba60d5fa071148444581bb65fb2d75b -

Disk title:  (1)  Disk size: &320 - 200K
Boot Option: 0 (None)   File count: 7

Filename:  Lck Lo.add Ex.add Length Sct
$.MAST130      008000 008000 004000 182
$.JGH133       008000 008000 004000 142
$.ELK103       008000 008000 004000 102
$.ELK100       008000 008000 004000 0C2
$.DC133        008000 008000 004000 082
$.ADFS133      008000 008000 004000 042
$.ADFS130      008000 008000 004000 002
```
