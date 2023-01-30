    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    lda #1; Load the A register with the decimal value 1
    lda #2; Load the X register with the decimal value 2
    lda #3; Load the Y register with the decimal value 3
    inx ; Increment X
    iny; Increment Y
    adc #1; Increment A
    dex; Decrement X
    dey; Decrement Y
    sbc #1; Decrement A
    org $FFFC ; End the ROM always at position $FFFC
    .word Start ; Put 2 bytes with reset address at memory position $FFFC
    .word Start ; Put 2 bytes with break address at memory position $FFFE