�o�ӵ{���i�H�p���ܼ�a�Mb���̤j���]�ơA��X�����GGCD(a,b)�|��br0�Ȧs����

�ڱN�ܼ�a���ȩ�br0���A�]�w��40
�ڱN�ܼ�a���ȩ�br1���A�]�w��24
�Q�ΦѮv�b�W�ҮɱЪ��t��k�Ӽ��g��ӵ{�����[�c
int find_gcf(int a, int b)
{
	while (a!=b) {
		if (a > b)
			a = a �V b;
		else
			b = b �V a;
	}
	return a;
}
�b�{�������nop�ɡAr0�Ȧs���̪��ȴN�OGCD(a,b)


�ϥε{���e�Х��Narm-none-eabi-gcc���Ҧb��m�[�J�����ܼƪ�������|PATH���� (�_�hmakefile�ݭn�ק令������|���g�k)
�i�ϥ�export PATH=$PATH:xxx/arm-new/bin (xxx�����|�W�A�ݦۦ�ק�)

�������make�Y�i����hw4.exe
����make�|��������arm-none-eabi-gcc -g -O0 hw4.s �Vo hw4.exe ���O
-g���F����gdb�����hw4.exe�i��debug�C-O0���F������Ķ����hw4.s�i�椣���n���u�ơA�ɭP�{�ǰ�����~
���{�����������Ҭ�ubuntu 18.04 �A �ϥ�arm-none-eabi-insight�Ӵ��յ{��
��J���Oarm-none-eabi-insight�}�l�B��A�}�l���իe�������]�wTarget Settings�A�]�w��simulator
����Nhw4.exe���J�즹�{�����A�p���@�ӴN��ݨ�ݨ�{����B���檺���G�A�]��ݨ��U�Ȧs���M�O���餤���ȡC


405235035 ��u�T ���ս� b121417393@gmail.com
