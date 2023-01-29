    processor 6502  ; Memberitahu assembler processor yang menjadi target assmbler
    
    seg code    ; memberitahu bahwa akan memulai segment of code
    org $F000   ; Define the code origin at $F000 org untuk memberitahu code dimulai dari address berapa
                ; Karena Atari diwajibkan memulai ROM pada $F000 maka kita set code mulai dari $F000

Start:          ; Line ini merupakan label yaitu alias untuk memory $F000 (anggap aja variable yang menyimpan memory address Start = $F000)
    sei         ; Disable interrupt
    cld         ; Disable Binary Code Decimal Math Mode
    ldx #$FF    ; Load x register with #$FF
    txs         ; Transfer data x register ke Stack Pointer (karena sebelumnya register x di load dengan nilai FF, sekarang Stack pointer menunjuk alamat FF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero, Region ($00 sampai $FF)
; Membersihkan RAM dan TIA (TV Interface Adaptor) dari $00 sampai $FF dengan set tiap byte menjadi $00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #0      ; register a = 0
    ldx #$FF    ; register x = #$FF

MemLoop:
    sta $0,X    ; Store the value of register a inside memory address $0 + x register
    dex         ; sama aja dengan register x--
    bne MemLoop ; bne itu adalah branch not equal to zero jadi kalau x bukan 0 maka akan terus kembali menjalankan MemLoop

    sta $00     ; Jika register x = 0, bne akan langsung keluar jadi memory $00 tidak diset dengan angka 0 karena loop tidak lengkap


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
; Catridge atari wajib di isi full 4KB
; Maka ke lokasi memori paling ujung yaitu $FFFF tapi disisakan 4 bytes maka ke $FFFC
; Karena kita harus mengisi 4 bytes tersebut dengan setingan 
; 1. 2 bytes jika atari di reset
; 2. 2 bytes jika di interupt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC   ; Karena Atari diwajibkan mengakhiri ROM pada $FFFC
                ; maka kita set base address untuk code selanjutnya ke $FFFC
    .word Start     ; .word merupakan directive untuk menggunakan memory 2bytes,
                    ;pada line ini untuk set kalau console atari di reset maka akan dimulai dari mana
    .word Start     ; Interrupt (Ga bakal dipake tapi wajib di set untuk kaset / catridge(ROM)) vector at $FFFE dan $FFFF karena line sebelumnya menggunakan 2 bytes yaitu $FFFC dan $FFFD