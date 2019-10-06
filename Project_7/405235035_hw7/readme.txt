這個程式將可以將input.txt文字檔中小寫的字元轉換成大寫字元
而非小寫的字元則維持原狀，輸出的檔案名稱為output.txt

我在data sectio中指定了input的檔名、output的檔名及要從input讀取字元所用的buffer
在text section中一開始先分配好各個SWI指令的參數，包含open、close、read、write和flen
之後使用SWI開啟input.txt和output.txt兩個檔案，前者參數使用read後者使用write
再使用SWI讀取input.txt中的字元數，來作為迴圈結束的判斷依據
進入迴圈後，先從input.txt讀取出一個字元，判斷是否為小寫字母(ASCII介於97-122之間)
如果是的話，則轉換成大寫再寫出至output.txt，如果不是，則直接寫出至output.txt
重複迴圈直到input.txt中的字元全部讀取一遍


使用程式前請先將arm-none-eabi-gcc的所在位置加入環境變數的絕對路徑PATH之中 (否則makefile需要修改成絕對路徑的寫法)
可使用export PATH=$PATH:xxx/arm-new/bin (xxx為路徑名，需自行修改)

之後執行make即可產生hw7.exe
執行make會間接執行 arm-none-eabi-gcc -g -O0 hw7.s –o hw7.exe 指令
-g為了能讓gdb能夠對hw7.exe進行debug，-O0為了不讓組譯器對hw7.s進行不必要的優化，導致程序執行錯誤

本程式的執行環境為ubuntu 18.04 ， 使用arm-none-eabi-insight來測試程式
輸入指令arm-none-eabi-insight開始運行，開始測試前必須先設定Target Settings，需設定成simulator
之後將hw7.exe載入到此程式中，利用單步執行或continue來運行程式
當程式執行完畢後，可於資料夾中察看ouput.txt，做為判斷程式執行是否正確的依據


405235035 資工三 王博輝 b121417393@gmail.com
