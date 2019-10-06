這個程式將作業五的hw5_test.s檔從原本用組合語言寫改成用C語言來撰寫
搭配上原本作業五的gcd.s的函數，來組合完成這次的作業
在程式中呼叫gcd(a,b)後，因為我們在gcd.s中實作了gcd的function，所以它會將最後的結果放在r0後回傳給the_gcd
在hw6_test.c的最後，我利用printf來印出其回傳值(the_gcd)，測試這次程式的執行是否正確

使用程式前請先將arm-none-eabi-gcc的所在位置加入環境變數的絕對路徑PATH之中 (否則makefile需要修改成絕對路徑的寫法)
可使用export PATH=$PATH:xxx/arm-new/bin (xxx為路徑名，需自行修改)

之後執行make即可產生hw6.exe
執行make會間接執行arm-none-eabi-gcc -g -O0 hw6_test.c gcd.s –o hw6.exe 指令
-g為了能讓gdb能夠對hw6.exe進行debug。-O0為了不讓組譯器對hw6.s進行不必要的優化，導致程序執行錯誤
本程式的執行環境為ubuntu 18.04 ， 使用arm-none-eabi-insight來測試程式
輸入指令arm-none-eabi-insight開始運行，開始測試前必須先設定Target Settings，設定成simulator
之後將hw6.exe載入到此程式中，利用單步執行來運行程式
再用view中的condole介面來觀看printf所印出的值是否正確
另外也能看到當下暫存器和記憶體中的值，可以發現執行完gcd(a,b)後，r0的值會是gcd(a,b)的回傳值


405235035 資工三 王博輝 b121417393@gmail.com
