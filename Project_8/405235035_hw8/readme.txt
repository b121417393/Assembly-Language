使用程式前需先使用指令make生成 hw8、hw8simd、random

編譯後請先輸入./random 來執行random這個程式
random這個程式可以產生200x200總共40000個浮點數的資料(也可使用原本附的data.txt)
每個浮點數的大小介於0.00~10.00之間

之後輸入./hw8、./hw8simd即可得到output.txt和simd_output.txt兩個檔案，分別存放這兩程式的輸出結果
而hw8和hw8simd這兩個程式可以將data.txt文字檔中的資料根據老師所要求的方法計算出值的總和
hw8為使用迭代的算法，hw8simd為使用simd指令的算法

hw8simd中使用了五種不同的SIMD指令，分別是
(SSE) __m128 _mm_add_ps (__m128 a, __m128 b)
(SSE) __m128 _mm_sub_ps (__m128 a, __m128 b)
(SSE) __m128 _mm_mul_ps (__m128 a, __m128 b)
(SSE2) __m128i _mm_srli_si128 (__m128i a, int imm8)
(SSE) float _mm_cvtss_f32 (__m128 a)			

在程式中我有自己實作atof這個函式，名為my_atof
因為原本的atof回傳值為double，若使用simd的指令，則需要使用float的資料型態
也有實作如何從一行字串中，將200個浮點數取出的函數，名為get_number

另外在程式中我有使用gettimeofday的指令，用來計算程式執行算數的時間
hw8平均執行46ms，hw8simd平均執行20ms，計算時間大概快了一倍

執行make會間接執行 gcc hw8.c -g -msse4 -o hw8 、 gcc hw8simd.c -g -msse4 -o hw8sim 、 gcc random.c -g -o random ，這三道指令
加上-g為了能讓gdb能夠對程式進行debug，加入-msse4是為了能夠使用simd的指令

本程式的執行環境為ubuntu 18.04，CPU型號為Intel Core i5-8400

當程式執行完畢後，可於資料夾中察看ouput.txt、simd_output.txt，做為判斷程式執行是否正確的依據
如果在windows上觀看2，可能會因為與linux換行符號不同的關係導致格式出問題，請盡量在linux系統上觀看

405235035 資工三 王博輝 b121417393@gmail.com
