processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    LDA #$82; Load the A register with the literal hexadecimal value $82
    LDX #82; Load the X register with the literal decimal value 82
    LDY $82; Load the Y register with the value that is inside memory position $82
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE