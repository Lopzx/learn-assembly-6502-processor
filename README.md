# learn-assembly-6502-processor

# ROM Atari
![Screenshot 2023-01-27 114640](https://user-images.githubusercontent.com/83326741/215012608-3d20083b-1eee-4f08-bcb3-30a322e90acd.png)
- Pada ROM Assembly diwajibkan untuk untuk mengisi semua 4KB oleh karena itu pada akhir code assembly terdapat code dibawah:

```
- Fill the ROM size to exactly 4KB 
- Catridge atari wajib di isi full 4KB 
- Maka ke lokasi memori paling ujung yaitu $FFFF tapi disisakan 4 bytes maka ke $FFFC 
- Karena kita harus mengisi 4 bytes tersebut dengan set
          1. 2 bytes memory address mana yang dijalankan jika atari di reset
          2. 2 bytes memory address mana yang dijalankan jika di interupt

    - org $FFFC   ;set base address untuk code selanjutnya ke $FFFC
    - .word Start     ; .word merupakan directive untuk menggunakan memory 2bytes,
    -                 ;pada line ini untuk set kalau console atari di reset maka akan dimulai dari mana
    - .word Start     ; Interrupt (Ga bakal dipake tapi wajib di set untuk kaset / catridge(ROM)) vector at $FFFE dan $FFFF karena line sebelumnya menggunakan 2 bytes yaitu $FFFC dan $FFFD```
