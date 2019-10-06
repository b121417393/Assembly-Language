這個程式將暫存器r0的值設定為r1+r2+r3+r4
我將r1設定為10、r2設定為20、r3設定為30、r4設定為40
所以當程式執行到nop時，r0的值為100

因為我將arm-new放在根目錄下，並將/arm-new/bin加入到了PATH變數中
PATH="$PATH":/arm-new/bin

所以我組譯hw2.s時打的指令是arm-none-eabi-gcc -g -O0 hw2.s –o hw2.exe
並使用指令arm-none-eabi-insight來執行程式，驗證其正確性

執行環境為ubuntu 18.04

405235035 資工三 王博輝 b121417393@gmail.com
