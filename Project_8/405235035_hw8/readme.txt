�ϥε{���e�ݥ��ϥΫ��Omake�ͦ� hw8�Bhw8simd�Brandom

�sĶ��Х���J./random �Ӱ���random�o�ӵ{��
random�o�ӵ{���i�H����200x200�`�@40000�ӯB�I�ƪ����(�]�i�ϥέ쥻����data.txt)
�C�ӯB�I�ƪ��j�p����0.00~10.00����

�����J./hw8�B./hw8simd�Y�i�o��output.txt�Msimd_output.txt����ɮסA���O�s��o��{������X���G
��hw8�Mhw8simd�o��ӵ{���i�H�Ndata.txt��r�ɤ�����ƮھڦѮv�ҭn�D����k�p��X�Ȫ��`�M
hw8���ϥέ��N����k�Ahw8simd���ϥ�simd���O����k

hw8simd���ϥΤF���ؤ��P��SIMD���O�A���O�O
(SSE) __m128 _mm_add_ps (__m128 a, __m128 b)
(SSE) __m128 _mm_sub_ps (__m128 a, __m128 b)
(SSE) __m128 _mm_mul_ps (__m128 a, __m128 b)
(SSE2) __m128i _mm_srli_si128 (__m128i a, int imm8)
(SSE) float _mm_cvtss_f32 (__m128 a)			

�b�{�����ڦ��ۤv��@atof�o�Ө禡�A�W��my_atof
�]���쥻��atof�^�ǭȬ�double�A�Y�ϥ�simd�����O�A�h�ݭn�ϥ�float����ƫ��A
�]����@�p��q�@��r�ꤤ�A�N200�ӯB�I�ƨ��X����ơA�W��get_number

�t�~�b�{�����ڦ��ϥ�gettimeofday�����O�A�Ψӭp��{�������ƪ��ɶ�
hw8��������46ms�Ahw8simd��������20ms�A�p��ɶ��j���֤F�@��

����make�|�������� gcc hw8.c -g -msse4 -o hw8 �B gcc hw8simd.c -g -msse4 -o hw8sim �B gcc random.c -g -o random �A�o�T�D���O
�[�W-g���F����gdb�����{���i��debug�A�[�J-msse4�O���F����ϥ�simd�����O

���{�����������Ҭ�ubuntu 18.04�ACPU������Intel Core i5-8400

��{�����槹����A�i���Ƨ������ouput.txt�Bsimd_output.txt�A�����P�_�{������O�_���T���̾�
�p�G�bwindows�W�[��2�A�i��|�]���Plinux����Ÿ����P�����Y�ɭP�榡�X���D�A�кɶq�blinux�t�ΤW�[��

405235035 ��u�T ���ս� b121417393@gmail.com
