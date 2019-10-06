405235035 資工三 王博輝

Q1: 請描述自己安裝與執行ARM software development tool的過程

先使用指令tar -zxvf ./arm-cross-toolchain-linux-64.tar.gz將老師給的檔案解壓縮
將再將解壓縮完的檔案移到家目錄下，之後要執行ARM software development tool時
就輸入/home/elbert/arm-new/bin/執行檔名稱 "程式碼" 即可(編譯/組譯)程式碼
例如將hw1.s組譯成hw1.o的話，即輸入/home/elbert/arm-new/bin/arm-none-eabi-as hw1.s -o hw1.o

Q2: 請說明hw1.o與hw1.exe的差別?

hw1.o檔是經組譯過後的二位元物件檔，裡頭是object code
hw1.exe檔是將object code及其所需要的函數庫經過linker相互連結起來的執行檔

Q3: sample_O0.o與sample_O3.o檔案大小的差別?

sample_O3.o(844位元組)的檔案較sample_O0.o(860位元組)小一點，O3的優化效果比O0好