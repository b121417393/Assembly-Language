這個程式可以計算變數a和b的最大公因數，輸出的結果GCD(a,b)會放在r0暫存器中

我將變數a的值放在r0中，設定為40
我將變數a的值放在r1中，設定為24
利用老師在上課時教的演算法來撰寫整個程式的架構
int find_gcf(int a, int b)
{
	while (a!=b) {
		if (a > b)
			a = a – b;
		else
			b = b – a;
	}
	return a;
}
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
