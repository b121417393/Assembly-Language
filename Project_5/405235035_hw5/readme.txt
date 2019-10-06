這個程式將作業四的gcd另外寫成一個函數，以便其他程式來呼叫計算變數a和b的最大公因數
其函數的回傳值會放在r0暫存器中
此程式的開始和結束為了符合APCS規範，所以多了幾行程式碼，其餘跟作業似無太大差別
傳入GCD函數的參數放在r0及r1暫存器中
在程式執行到nop時，r0暫存器裡的值就是GCD(a,b)

使用程式前請先將arm-none-eabi-gcc的所在位置加入環境變數的絕對路徑PATH之中 (否則makefile需要修改成絕對路徑的寫法)
可使用export PATH=$PATH:xxx/arm-new/bin (xxx為路徑名，需自行修改)

之後執行make即可產生hw4.exe
執行make會間接執行arm-none-eabi-gcc -g -O0 hw4.s –o hw4.exe 指令
-g為了能讓gdb能夠對hw4.exe進行debug。-O0為了不讓組譯器對hw4.s進行不必要的優化，導致程序執行錯誤
本程式的執行環境為ubuntu 18.04 ， 使用arm-none-eabi-insight來測試程式
輸入指令arm-none-eabi-insight開始運行，開始測試前必須先設定Target Settings，設定成simulator
之後將hw4.exe載入到此程式中，如此一來就能看到看到程式單步執行的結果，也能看到當下暫存器和記憶體中的值。


405235035 資工三 王博輝 b121417393@gmail.com
