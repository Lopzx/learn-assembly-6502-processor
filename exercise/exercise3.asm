	processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    lda #15; Load the A register with the literal decimal value 15
    tax    ; Transfer the value from A to X
    tay    ; Transfer the value from A to Y
    txa    ; Transfer the value from X to A
    tay    ; Transfer the value from Y to A

    LDX #6 ; Load X with the decimal value 6
    txa    ; Transfer the value from X to Y
    tay
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE