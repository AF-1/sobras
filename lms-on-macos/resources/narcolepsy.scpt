FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 
sleepdelay 
SleepDelay  m     ����     	  l      
   
 j    �� �� P0 &sleepthresholdafterapplicationfinishes &sleepThresholdAfterApplicationFinishes  m    ����   m g how long to wait before sending the Mac to sleep (in mins) after an application stops preventing sleep     �   �   h o w   l o n g   t o   w a i t   b e f o r e   s e n d i n g   t h e   M a c   t o   s l e e p   ( i n   m i n s )   a f t e r   a n   a p p l i c a t i o n   s t o p s   p r e v e n t i n g   s l e e p 	     j    �� �� 0 debugoutput debugOutput  m    ��
�� boovfals      j   	 �� �� *0 debugoutput_verbose debugOutput_verbose  m   	 
��
�� boovfals      l          j    �� �� 0 serverip ServerIP  m       �    l o c a l h o s t    local IP of this machine     �   2   l o c a l   I P   o f   t h i s   m a c h i n e      j    ��  �� 0 lmsusername LMSusername   m     ! ! � " " 6 H e r e _ G o e s _ Y o u r _ L M S _ u s e r n a m e   # $ # j    �� %�� 0 	lmsuserpw 	LMSuserPW % m     & & � ' ' 6 H e r e _ G o e s _ Y o u r _ L M S _ P a s s w o r d $  ( ) ( l     ��������  ��  ��   )  * + * l     �� , -��   , � � if you don't use LMS with username and password then remove this part from the curl commands:   --user '" & LMSusername & ":" & LMSuserPW & "'    - � . .   i f   y o u   d o n ' t   u s e   L M S   w i t h   u s e r n a m e   a n d   p a s s w o r d   t h e n   r e m o v e   t h i s   p a r t   f r o m   t h e   c u r l   c o m m a n d s :       - - u s e r   ' "   &   L M S u s e r n a m e   &   " : "   &   L M S u s e r P W   &   " ' +  / 0 / l     ��������  ��  ��   0  1 2 1 l     �� 3 4��   3 � � this method checks if any application is currently running that is trusted to prevent the sleep (note that the HID interaction is not checked here, since it is valued differently)    4 � 5 5h   t h i s   m e t h o d   c h e c k s   i f   a n y   a p p l i c a t i o n   i s   c u r r e n t l y   r u n n i n g   t h a t   i s   t r u s t e d   t o   p r e v e n t   t h e   s l e e p   ( n o t e   t h a t   t h e   H I D   i n t e r a c t i o n   i s   n o t   c h e c k e d   h e r e ,   s i n c e   i t   i s   v a l u e d   d i f f e r e n t l y ) 2  6 7 6 i     8 9 8 I      �������� *0 checkifreadytosleep checkIfReadyToSleep��  ��   9 k    � : :  ; < ; r      = > = m     ��
�� boovtrue > o      ���� 0 readytosleep readyToSleep <  ? @ ? l   ��������  ��  ��   @  A B A Q   � C D E C k   � F F  G H G l   �� I J��   I 5 /-----------------------------------------------    J � K K ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - H  L M L l   �� N O��   N / )-- Check Number of Kernel Assertions ----    O � P P R - -   C h e c k   N u m b e r   o f   K e r n e l   A s s e r t i o n s   - - - - M  Q R Q l   �� S T��   S 5 /-----------------------------------------------    T � U U ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - R  V W V l   ��������  ��  ��   W  X Y X l   �� Z [��   Z � � stay awake if any application registered for one of the kernel assertions named PreventSystemSleep or PreventUserIdleSystemSleep or PreventUserIdleDisplaySleep (to monitor type in terminal: "pmset -g assertions")    [ � \ \�   s t a y   a w a k e   i f   a n y   a p p l i c a t i o n   r e g i s t e r e d   f o r   o n e   o f   t h e   k e r n e l   a s s e r t i o n s   n a m e d   P r e v e n t S y s t e m S l e e p   o r   P r e v e n t U s e r I d l e S y s t e m S l e e p   o r   P r e v e n t U s e r I d l e D i s p l a y S l e e p   ( t o   m o n i t o r   t y p e   i n   t e r m i n a l :   " p m s e t   - g   a s s e r t i o n s " ) Y  ] ^ ] Q   � _ ` a _ k   
� b b  c d c r   
  e f e c   
  g h g l  
  i���� i I  
 �� j��
�� .sysoexecTEXT���     TEXT j m   
  k k � l l � p m s e t   - g   a s s e r t i o n s   |   e g r e p   - c   ' ( P r e v e n t S y s t e m S l e e p [   ] + 1 | P r e v e n t U s e r I d l e S y s t e m S l e e p [   ] + 1 $ | P r e v e n t U s e r I d l e D i s p l a y S l e e p [   ] + 1 $ ) '��  ��  ��   h m    ��
�� 
long f o      ���� $0 kernelassertions kernelAssertions d  m n m l   ��������  ��  ��   n  o p o l   �� q r��   q G A correct no of KA Zahl because of applet / screensaver PW problem    r � s s �   c o r r e c t   n o   o f   K A   Z a h l   b e c a u s e   o f   a p p l e t   /   s c r e e n s a v e r   P W   p r o b l e m p  t u t l   ��������  ��  ��   u  v w v O    @ x y x Q    ? z { | z k    4 } }  ~  ~ r    , � � � 6   * � � � n    ! � � � 1    !��
�� 
idux � 4   �� �
�� 
prcs � m    ����  � E   " ) � � � 1   # %��
�� 
pnam � m   & ( � � � � �  N a r c o l e p s y � o      ���� 0 	narco_pid     ��� � r   - 4 � � � l  - 2 ����� � b   - 2 � � � b   - 0 � � � m   - . � � � � �   � o   . /���� 0 	narco_pid   � m   0 1 � � � � �  . * ( S l e e p | s l e e p )��  ��   � o      ���� 0 	grep_part  ��   { R      ������
�� .ascrerr ****      � ****��  ��   | r   < ? � � � m   < = � � � � � P a p p l e t . * ( S l e e p | s l e e p ) . * ( e x e c u t i n g   e v e n t ) � o      ���� 0 	grep_part   y m     � ��                                                                                  sevs  alis    N  MacOS                          BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c O S  -System/Library/CoreServices/System Events.app   / ��   w  � � � l  A A��������  ��  ��   �  � � � r   A H � � � l  A F ����� � b   A F � � � m   A B � � � � � > p m s e t   - g   a s s e r t i o n s   |   e g r e p   - c   � n   B E � � � 1   C E��
�� 
strq � o   B C���� 0 	grep_part  ��  ��   � o      ���� 0 
my_command   �  � � � l  I I��������  ��  ��   �  � � � Q   I ` � � � � r   L U � � � c   L S � � � l  L Q ����� � I  L Q�� ���
�� .sysoexecTEXT���     TEXT � o   L M���� 0 
my_command  ��  ��  ��   � m   Q R��
�� 
long � o      ���� 60 kernelassertioncountnarco kernelAssertionCountNarco � R      ������
�� .ascrerr ****      � ****��  ��   � r   ] ` � � � m   ] ^����   � o      ���� 60 kernelassertioncountnarco kernelAssertionCountNarco �  � � � l  a a��������  ��  ��   �  � � � Z   a p � ����� � =  a d � � � o   a b���� 60 kernelassertioncountnarco kernelAssertionCountNarco � m   b c����  � r   g l � � � l  g j ����� � \   g j � � � o   g h���� $0 kernelassertions kernelAssertions � m   h i���� ��  ��   � o      ���� $0 kernelassertions kernelAssertions��  ��   �  � � � l  q q��������  ��  ��   �  � � � Z   q � � ��� � � =  q x � � � o   q v���� *0 debugoutput_verbose debugOutput_verbose � m   v w��
�� boovtrue � r   { � � � � b   { � � � � b   { � � � � b   { � � � � b   { � � � � b   { � � � � b   { � � � � b   { � � � � m   { ~ � � � � � & k e r n e l A s s e r t i o n s   =   � o   ~ ���� $0 kernelassertions kernelAssertions � m   � � � � � � �    "   � m   � � � � � � �  g r e p _ p a r t   =   � o   � ����� 0 	grep_part   � m   � � � � � � � 
     "     � m   � � � � � � � 8 k e r n e l A s s e r t i o n C o u n t N a r c o   =   � o   � ����� 60 kernelassertioncountnarco kernelAssertionCountNarco � o      ���� 0 aggreginfos aggregInfos��   � r   � � � � � b   � � � � � m   � � � � � � � & k e r n e l A s s e r t i o n s   =   � o   � ����� $0 kernelassertions kernelAssertions � o      ���� 0 aggreginfos aggregInfos �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �   debug report    � � � �    d e b u g   r e p o r t �  � � � l  � ���������  ��  ��   �  ��� � Z   �� � ��� � � B  � � � � � o   � ����� $0 kernelassertions kernelAssertions � m   � �����   � k   � � �    l  � ���������  ��  ��    r   � � m   � ���
�� boovtrue o      ���� 0 readytosleep readyToSleep � Z   ��~�} =  � �	
	 o   � ��|�| 0 debugoutput debugOutput
 m   � ��{
�{ boovtrue k   �  r   � � c   � � l  � ��z�y I  � ��x�w
�x .sysoexecTEXT���     TEXT m   � � � F p m s e t   - g   a s s e r t i o n s   |   e g r e p   ' S l e e p '�w  �z  �y   m   � ��v
�v 
TEXT o      �u�u "0 whichassertions whichAssertions  r   � � I   � ��t�s�t 0 replace_chars    o   � ��r�r "0 whichassertions whichAssertions  o   � ��q
�q 
ret  �p 1   � ��o
�o 
lnfd�p  �s   o      �n�n "0 whichassertions whichAssertions  �m  Z   �!"�l#! =  � �$%$ o   � ��k�k *0 debugoutput_verbose debugOutput_verbose% m   � ��j
�j boovtrue" I   � ��i&�h�i 0 logthis logThis& '(' m   � �)) �** H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *( +,+ b   � �-.- b   � �/0/ b   � �121 b   � �343 b   � �565 m   � �77 �88 � K e r n e l   A s s e r t i o n s   n o t   g r e a t e r   t h a n   0 ;   j u s t   F Y I :   t h e s e   a r e   a l l   c u r r e n t   k e r n e l A s s e r t i o n s :6 1   � ��g
�g 
lnfd4 o   � ��f�f "0 whichassertions whichAssertions2 1   � ��e
�e 
lnfd0 m   � �99 �::       ". o   � ��d�d 0 aggreginfos aggregInfos, ;�c; o   � ��b�b 0 debugoutput debugOutput�c  �h  �l  # I   ��a<�`�a 0 logthis logThis< =>= m   ?? �@@ H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *> ABA m  CC �DD H K e r n e l   A s s e r t i o n s   n o t   g r e a t e r   t h a n   0B E�_E o  �^�^ 0 debugoutput debugOutput�_  �`  �m  �~  �}  �  ��   � k  �FF GHG r  IJI m  �]
�] boovfalsJ o      �\�\ 0 readytosleep readyToSleepH K�[K Z  �LM�Z�YL = !NON o  �X�X 0 debugoutput debugOutputO m   �W
�W boovtrueM k  $�PP QRQ r  $1STS c  $/UVU l $+W�V�UW I $+�TX�S
�T .sysoexecTEXT���     TEXTX m  $'YY �ZZ F p m s e t   - g   a s s e r t i o n s   |   e g r e p   ' S l e e p '�S  �V  �U  V m  +.�R
�R 
TEXTT o      �Q�Q "0 whichassertions whichAssertionsR [\[ r  2@]^] I  2>�P_�O�P 0 replace_chars  _ `a` o  34�N�N "0 whichassertions whichAssertionsa bcb o  47�M
�M 
ret c d�Ld 1  7:�K
�K 
lnfd�L  �O  ^ o      �J�J "0 whichassertions whichAssertions\ e�Ie Z  A�fg�Hhf = AHiji o  AF�G�G *0 debugoutput_verbose debugOutput_verbosej m  FG�F
�F boovtrueg I  Kk�Ek�D�E 0 logthis logThisk lml m  LOnn �oo H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *m pqp b  Obrsr b  O`tut b  O\vwv b  OXxyx b  OVz{z m  OR|| �}} ` P r e v e n t   s l e e p   b e c a u s e   o f   t h e s e   k e r n e l A s s e r t i o n s :{ 1  RU�C
�C 
lnfdy o  VW�B�B "0 whichassertions whichAssertionsw 1  X[�A
�A 
lnfdu m  \_~~ �       "s o  `a�@�@ 0 aggreginfos aggregInfosq ��?� o  bg�>�> 0 debugoutput debugOutput�?  �D  �H  h k  n��� ��� I  n��=��<�= 0 logthis logThis� ��� m  or�� ��� H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *� ��� b  r���� b  r���� b  r��� b  r{��� b  ry��� m  ru�� ��� ` P r e v e n t   s l e e p   b e c a u s e   o f   t h e s e   k e r n e l A s s e r t i o n s :� 1  ux�;
�; 
lnfd� o  yz�:�: "0 whichassertions whichAssertions� 1  {~�9
�9 
lnfd� m  ��� ���       "� o  ���8�8 0 aggreginfos aggregInfos� ��7� o  ���6�6 0 debugoutput debugOutput�7  �<  � ��5� l ���4�3�2�4  �3  �2  �5  �I  �Z  �Y  �[  ��   ` R      �1��
�1 .ascrerr ****      � ****� o      �0�0 0 errmsg errMsg� �/��.
�/ 
errn� o      �-�- 0 errornumber errorNumber�.   a I  ���,��+�, 0 logthis logThis� ��� m  ���� ��� F *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p   *� ��� b  ����� m  ���� ��� B E r r o r   i n   K e r n e l   A s s e r t i o n s   p a r t :  � n  ����� 1  ���*
�* 
strq� o  ���)�) 0 errmsg errMsg� ��(� o  ���'�' 0 debugoutput debugOutput�(  �+   ^ ��� l ���&�%�$�&  �%  �$  � ��� l ���#�"�!�#  �"  �!  � ��� l ��� ���   � 2 ,--------------------------------------------   � ��� X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l ������  � + %--   LOGITECH CONDITIONS START   ----   � ��� J - -       L O G I T E C H   C O N D I T I O N S   S T A R T       - - - -� ��� l ������  � 2 ,--------------------------------------------   � ��� X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l ������  �  �  � ��� l ������  � 6 0 stay awake if a Logitech Players are powered on   � ��� `   s t a y   a w a k e   i f   a   L o g i t e c h   P l a y e r s   a r e   p o w e r e d   o n� ��� l ������  � t n get no of registered players first, then get power status for each - if "powered on": get player name for log   � ��� �   g e t   n o   o f   r e g i s t e r e d   p l a y e r s   f i r s t ,   t h e n   g e t   p o w e r   s t a t u s   f o r   e a c h   -   i f   " p o w e r e d   o n " :   g e t   p l a y e r   n a m e   f o r   l o g� ��� l ������  �  �  � ��� Q  ������ k  ���� ��� r  ����� I �����
� .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� , c u r l   - v   - H   - X   - - u s e r   '� o  ���� 0 lmsusername LMSusername� m  ���� ���  :� o  ���� 0 	lmsuserpw 	LMSuserPW� m  ���� ��� � '   P O S T   - d   ' { " i d " : 1 , " m e t h o d " : " s l i m . r e q u e s t " , " p a r a m s " : [ " " , [ " p l a y e r " , " c o u n t " , " ? " ] ] } '   h t t p : / /� o  ���� 0 serverip ServerIP� m  ���� ���   : 9 0 0 0 / j s o n r p c . j s�  � o      �� 0 playercountquery  � ��� r  ����� I �����
� .sysoexecTEXT���     TEXT� b  ����� b  ����� m  ���� ��� 
 e c h o  � n  ����� 1  ���
� 
strq� o  ���� 0 playercountquery  � m  ���� ��� .   |   s e d   - e   ' s / [ \ { " } ] / / g '�  � o      �� 0 playercountquery  � ��� r  ���� I ���
�	�
�
 .sysooffslong    ��� null�	  � � 
� 
psof  m  �� �  r e s u l t : _ c o u n t : ��
� 
psin o  ���� 0 playercountquery  �  � o      �� 0 
countstart  �  r   c  	
	 n  4  �
� 
cha  l �� [   o  � �  0 
countstart   m  
���� �  �   o  ���� 0 playercountquery  
 m  ��
�� 
long o      ���� 0 playercount    r   \   o  ���� 0 playercount   m  ����  o      ���� 0 playercount    l ��������  ��  ��   �� Y  ����� k  !�  l !!��������  ��  ��    !  l !!��"#��  " "  get player ID (MAC address)   # �$$ 8   g e t   p l a y e r   I D   ( M A C   a d d r e s s )! %&% l !!��������  ��  ��  & '(' r  !J)*) b  !H+,+ b  !D-.- b  !>/0/ b  !:121 b  !8343 b  !4565 b  !.787 b  !*9:9 m  !$;; �<< , c u r l   - v   - H   - X   - - u s e r   ': o  $)���� 0 lmsusername LMSusername8 m  *-== �>>  :6 o  .3���� 0 	lmsuserpw 	LMSuserPW4 m  47?? �@@ � '   P O S T   - d   ' { " i d " : 1 , " m e t h o d " : " s l i m . r e q u e s t " , " p a r a m s " : [ " " , [ " p l a y e r " , " i d " , "2 o  89���� 0 this_playerindex  0 m  :=AA �BB " " , " ? " ] ] } '   h t t p : / /. o  >C���� 0 serverip ServerIP, m  DGCC �DD   : 9 0 0 0 / j s o n r p c . j s* o      ���� 0 	idcommand  ( EFE r  KRGHG I KP��I��
�� .sysoexecTEXT���     TEXTI o  KL���� 0 	idcommand  ��  H o      ���� 0 this_playerid  F JKJ r  SdLML I Sb��N��
�� .sysoexecTEXT���     TEXTN b  S^OPO b  SZQRQ m  SVSS �TT 
 e c h o  R n  VYUVU 1  WY��
�� 
strqV o  VW���� 0 this_playerid  P m  Z]WW �XX .   |   s e d   - e   ' s / [ \ { " } ] / / g '��  M o      ���� 0 this_playerid  K YZY r  ez[\[ I ev����]
�� .sysooffslong    ��� null��  ] ��^_
�� 
psof^ m  il`` �aa  r e s u l t : _ i d :_ ��b��
�� 
psinb o  op���� 0 this_playerid  ��  \ o      ���� 0 playeridstart  Z cdc r  {�efe c  {�ghg l {�i����i n  {�jkj 7 |���lm
�� 
cha l l ��n����n [  ��opo o  ������ 0 playeridstart  p m  ������ ��  ��  m l ��q����q [  ��rsr o  ������ 0 playeridstart  s m  ������ ��  ��  k o  {|���� 0 this_playerid  ��  ��  h m  ����
�� 
ctxtf o      ���� 0 this_playerid  d tut l ����������  ��  ��  u vwv l ����xy��  x   get player power status   y �zz 0   g e t   p l a y e r   p o w e r   s t a t u sw {|{ l ����������  ��  ��  | }~} r  ��� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� , c u r l   - v   - H   - X   - - u s e r   '� o  ������ 0 lmsusername LMSusername� m  ���� ���  :� o  ������ 0 	lmsuserpw 	LMSuserPW� m  ���� ��� l '   P O S T   - d   ' { " i d " : 1 , " m e t h o d " : " s l i m . r e q u e s t " , " p a r a m s " : [ "� o  ������ 0 this_playerid  � m  ���� ��� 4 " , [ " p o w e r " , " ? " ] ] } '   h t t p : / /� o  ������ 0 serverip ServerIP� m  ���� ���   : 9 0 0 0 / j s o n r p c . j s� o      ���� 0 powercommand  ~ ��� r  ����� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 powercommand  ��  � o      ���� 0 powerstatus  � ��� r  ����� I �������
�� .sysoexecTEXT���     TEXT� b  ����� b  ����� m  ���� ��� 
 e c h o  � n  ����� 1  ����
�� 
strq� o  ������ 0 powerstatus  � m  ���� ��� .   |   s e d   - e   ' s / [ \ { " } ] / / g '��  � o      ���� 0 powerstatus  � ���� Z  ��������� E  ����� o  ������ 0 powerstatus  � m  ���� ���  p o w e r : 1� k  ���� ��� r  ����� m  ����
�� boovfals� o      ���� 0 readytosleep readyToSleep� ��� l ����������  ��  ��  � ��� l ��������  �   get player name   � ���     g e t   p l a y e r   n a m e� ��� l ����������  ��  ��  � ��� r  �"��� b  ���� b  ���� b  ���� b  ���� b  ���� b  �
��� b  ���� b  � ��� m  ���� ��� , c u r l   - v   - H   - X   - - u s e r   '� o  ������ 0 lmsusername LMSusername� m   �� ���  :� o  	���� 0 	lmsuserpw 	LMSuserPW� m  
�� ��� � '   P O S T   - d   ' { " i d " : 1 , " m e t h o d " : " s l i m . r e q u e s t " , " p a r a m s " : [ " " , [ " p l a y e r " , " n a m e " , "� o  ���� 0 this_playerindex  � m  �� ��� " " , " ? " ] ] } '   h t t p : / /� o  ���� 0 serverip ServerIP� m  �� ���   : 9 0 0 0 / j s o n r p c . j s� o      ���� 0 namecommand  � ��� r  #.��� I #*�����
�� .sysoexecTEXT���     TEXT� o  #&���� 0 namecommand  ��  � o      ���� 0 this_playername  � ��� r  /D��� I /@�����
�� .sysoexecTEXT���     TEXT� b  /<��� b  /8��� m  /2�� ��� 
 e c h o  � n  27��� 1  57��
�� 
strq� o  25���� 0 this_playername  � m  8;�� ��� .   |   s e d   - e   ' s / [ \ { " } ] / / g '��  � o      ���� 0 this_playername  � ��� r  EZ��� I EV�����
�� .sysoexecTEXT���     TEXT� b  ER��� b  EN��� m  EH�� �   
 e c h o  � n  HM 1  KM��
�� 
strq o  HK���� 0 this_playername  � m  NQ � b   |   s e d   - E   ' s / ^ . * r e s u l t : _ n a m e : ( [ ^ , ] + ) ( , . * $ | $ ) / \ 1 / '��  � o      ���� 0 this_playername  �  l [[��������  ��  ��   �� Z  [�	���� = [b

 o  [`���� 0 debugoutput debugOutput m  `a��
�� boovtrue	 I  e}������ 0 logthis logThis  m  fi � H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *  b  it b  ip m  il � L P r e v e n t   s l e e p   b e c a u s e   o f   L M S :   P l a y e r   ' o  lo���� 0 this_playername   m  ps �  '   p o w e r e d   o n �� o  ty���� 0 debugoutput debugOutput��  ��  ��  ��  ��  ��  ��  ��  �� 0 this_playerindex   m  ����   o  ���� 0 playercount  ��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 errmsg errMsg ����
�� 
errn o      ���� 0 errornumber errorNumber��  � I  ����~� 0 logthis logThis  !  m  ��"" �## F *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p   *! $%$ b  ��&'& m  ��(( �)) J E r r o r   i n   L M S   P l a y e r   p o w e r e d   o n   p a r t :  ' n  ��*+* 1  ���}
�} 
strq+ o  ���|�| 0 errmsg errMsg% ,�{, o  ���z�z 0 debugoutput debugOutput�{  �~  � -.- l ���y�x�w�y  �x  �w  . /0/ l ���v�u�t�v  �u  �t  0 121 l ���s34�s  3 6 0 stay awake if LMS is still scanning the library   4 �55 `   s t a y   a w a k e   i f   L M S   i s   s t i l l   s c a n n i n g   t h e   l i b r a r y2 676 l ���r�q�p�r  �q  �p  7 898 Q  �6:;<: k  �== >?> r  ��@A@ I ���oB�n
�o .sysoexecTEXT���     TEXTB b  ��CDC b  ��EFE b  ��GHG b  ��IJI b  ��KLK b  ��MNM m  ��OO �PP , c u r l   - v   - H   - X   - - u s e r   'N o  ���m�m 0 lmsusername LMSusernameL m  ��QQ �RR  :J o  ���l�l 0 	lmsuserpw 	LMSuserPWH m  ��SS �TT � '   P O S T   - d   ' { " i d " : 1 , " m e t h o d " : " s l i m . r e q u e s t " , " p a r a m s " : [ " " , [ " r e s c a n p r o g r e s s " , " r e s c a n " ] ] } '   h t t p : / /F o  ���k�k 0 serverip ServerIPD m  ��UU �VV   : 9 0 0 0 / j s o n r p c . j s�n  A o      �j�j 0 rescanstatus rescanStatus? WXW r  ��YZY I ���i[�h
�i .sysoexecTEXT���     TEXT[ b  ��\]\ b  ��^_^ m  ��`` �aa 
 e c h o  _ n  ��bcb 1  ���g
�g 
strqc o  ���f�f 0 rescanstatus rescanStatus] m  ��dd �ee .   |   s e d   - e   ' s / [ \ { " } ] / / g '�h  Z o      �e�e 0 rescanstatus rescanStatusX f�df Z  �gh�c�bg E  ��iji o  ���a�a 0 rescanstatus rescanStatusj m  ��kk �ll  r e s c a n : 1h k  �mm non r  ��pqp m  ���`
�` boovfalsq o      �_�_ 0 readytosleep readyToSleepo r�^r Z  �st�]�\s = ��uvu o  ���[�[ 0 debugoutput debugOutputv m  ���Z
�Z boovtruet I  �Yw�X�Y 0 logthis logThisw xyx m  zz �{{ H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *y |}| m  	~~ � X P r e v e n t   s l e e p   b e c a u s e   o f   L M S :   s t i l l   s c a n n i n g} ��W� o  	�V�V 0 debugoutput debugOutput�W  �X  �]  �\  �^  �c  �b  �d  ; R      �U��
�U .ascrerr ****      � ****� o      �T�T 0 errmsg errMsg� �S��R
�S 
errn� o      �Q�Q 0 errornumber errorNumber�R  < I  "6�P��O�P 0 logthis logThis� ��� m  #&�� ��� F *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p   *� ��� b  &-��� m  &)�� ��� 8 E r r o r   i n   L M S   S c a n n i n g   p a r t :  � n  ),��� 1  *,�N
�N 
strq� o  )*�M�M 0 errmsg errMsg� ��L� o  -2�K�K 0 debugoutput debugOutput�L  �O  9 ��� l 77�J�I�H�J  �I  �H  � ��� l 77�G�F�E�G  �F  �E  � ��� l 77�D���D  � / )-----------------------------------------   � ��� R - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l 77�C���C  � ( "--   LOGITECH CONDITIONS END   ---   � ��� D - -       L O G I T E C H   C O N D I T I O N S   E N D       - - -� ��� l 77�B���B  � / )-----------------------------------------   � ��� R - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l 77�A�@�?�A  �@  �?  � ��� l 77�>�=�<�>  �=  �<  � ��� l 77�;�:�9�;  �:  �9  � ��� l 77�8���8  � 2 , stay awake if TIMEMACHINE BACKUP is running   � ��� X   s t a y   a w a k e   i f   T I M E M A C H I N E   B A C K U P   i s   r u n n i n g� ��� l 77�7�6�5�7  �6  �5  � ��� Q  7����� k  :v�� ��� r  :E��� l :A��4�3� I :A�2��1
�2 .sysoexecTEXT���     TEXT� m  :=�� ���  t m u t i l   s t a t u s�1  �4  �3  � o      �0�0 0 tmstatus  � ��/� Z  Fv���.�-� E  FM��� o  FI�,�, 0 tmstatus  � m  IL�� ���  R u n n i n g   =   1� k  Pr�� ��� r  PS��� m  PQ�+
�+ boovfals� o      �*�* 0 readytosleep readyToSleep� ��)� Z  Tr���(�'� = T[��� o  TY�&�& 0 debugoutput debugOutput� m  YZ�%
�% boovtrue� I  ^n�$��#�$ 0 logthis logThis� ��� m  _b�� ��� H *   - S u b r o u t i n e   c h e c k I f R e a d y T o S l e e p -   *� ��� m  be�� ��� h P r e v e n t   s l e e p   b e c a u s e   T i m e M a c h i n e   b a c k u p   i n   p r o g r e s s� ��"� o  ej�!�! 0 debugoutput debugOutput�"  �#  �(  �'  �)  �.  �-  �/  � R      � ��
�  .ascrerr ****      � ****� o      �� 0 errmsg errMsg� ���
� 
errn� o      �� 0 errornumber errorNumber�  � I  ~����� 0 logthis logThis� ��� m  ��� ��� F *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p   *� ��� b  ����� m  ���� ��� 6 E r r o r   i n   T i m e M a c h i n e   p a r t :  � n  ����� 1  ���
� 
strq� o  ���� 0 errmsg errMsg� ��� o  ���� 0 debugoutput debugOutput�  �  � ��� l ������  �  �  � ��� l ������  �  �  � ��� l ������  �  �  �   D R      ���
� .ascrerr ****      � ****� o      �
�
 0 errmsg errMsg� �	��
�	 
errn� o      �� 0 errornumber errorNumber�   E I  ������ 0 logthis logThis� ��� m  ���� ��� H *   S u b r o u t i n e   - c h e c k I f R e a d y T o S l e e p -   *� ��� b  ����� m  ���� ���  G e n e r a l   E r r o r :  � n  ��� � 1  ���
� 
strq  o  ���� 0 errmsg errMsg� � o  ���� 0 debugoutput debugOutput�  �   B  l ��� �����   ��  ��   �� L  �� o  ������ 0 readytosleep readyToSleep��   7  l     ��������  ��  ��   	 l     ��
��  
 ) #-----------------------------------    � F - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	  l     ����   ) #-----------------------------------    � F - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   � � method to determine if the Mac was asleep directly before (returns -1 if we were not asleep directly before; returns minutes since wakeup if we were sleeping)    �>   m e t h o d   t o   d e t e r m i n e   i f   t h e   M a c   w a s   a s l e e p   d i r e c t l y   b e f o r e   ( r e t u r n s   - 1   i f   w e   w e r e   n o t   a s l e e p   d i r e c t l y   b e f o r e ;   r e t u r n s   m i n u t e s   s i n c e   w a k e u p   i f   w e   w e r e   s l e e p i n g )  l     ��������  ��  ��    i      I      �������� ,0 detectifwewereasleep detectIfWeWereAsleep��  ��    Q     Q!"#! k    6$$ %&% r    '(' c    
)*) l   +����+ I   ��,��
�� .sysoexecTEXT���     TEXT, m    -- �..  d a t e   + % s��  ��  ��  * m    	��
�� 
long( o      ���� 0 currenttime currentTime& /0/ r    121 c    343 l   5����5 I   ��6��
�� .sysoexecTEXT���     TEXT6 m    77 �88 r s y s c t l   - a   |   g r e p   ' w a k e t i m e '   |   e g r e p   - o   ' [ 0 - 9 ] { 1 0 } [ 0 - 9 ] * , '��  ��  ��  4 m    ��
�� 
long2 o      ���� 0 waketime wakeTime0 9:9 r    ;<; l   =����= \    >?> o    ���� 0 currenttime currentTime? o    ���� 0 waketime wakeTime��  ��  < o      ���� (0 secondssincewakeup secondsSinceWakeup: @A@ r    &BCB ]    $DED o    "���� 0 
sleepdelay 
SleepDelayE m   " #���� <C o      ���� 00 oursleepdelayinseconds ourSleepDelayInSecondsA FGF l  ' '��������  ��  ��  G HIH l  ' '��JK��  J   2do: sanity check   K �LL $   2 d o :   s a n i t y   c h e c kI MNM l  ' '��������  ��  ��  N O��O Z   ' 6PQ��RP A  ' *STS o   ' (���� (0 secondssincewakeup secondsSinceWakeupT o   ( )���� 00 oursleepdelayinseconds ourSleepDelayInSecondsQ k   - 1UU VWV l  - -��XY��  X   return in minutes   Y �ZZ $   r e t u r n   i n   m i n u t e sW [��[ L   - 1\\ l  - 0]����] ^   - 0^_^ o   - .���� (0 secondssincewakeup secondsSinceWakeup_ m   . /���� <��  ��  ��  ��  R L   4 6`` m   4 5��������  " R      ��ab
�� .ascrerr ****      � ****a o      ���� 0 errmsg errMsgb ��c��
�� 
errnc o      ���� 0 errornumber errorNumber��  # k   > Qdd efe I   > N��g���� 0 logthis logThisg hih m   ? @jj �kk J *   S u b r o u t i n e   - d e t e c t I f W e W e r e A s l e e p -   *i lml b   @ Enon m   @ App �qq  E r r o r :  o n   A Drsr 1   B D��
�� 
strqs o   A B���� 0 errmsg errMsgm t��t o   E J���� 0 debugoutput debugOutput��  ��  f u��u L   O Qvv m   O P��������   wxw l     ��������  ��  ��  x yzy l     ��������  ��  ��  z {|{ l     ��}~��  } X R----------------------------------------------------------------------------------   ~ � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -| ��� l     ������  � U O--------------------------- MAIN PART -----------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - -   M A I N   P A R T   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � X R----------------------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l    ������ I     ������� 0 logthis logThis� ��� m    �� ���  * *   S t a r t   * *� ��� m    �� ���  S c r i p t   s t a r t e d� ���� o    ���� 0 debugoutput debugOutput��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i     ��� I     ������
�� .miscidlenmbr    ��� null��  ��  � Q    A���� k   '�� ��� r    ��� m    ����  � o      ���� $0 delaytonextcheck delayToNextCheck� ��� r    ��� I    �������� ,0 detectifwewereasleep detectIfWeWereAsleep��  ��  � o      ���� .0 theminutessincewakeup theMinutesSinceWakeup� ��� r    ��� c    ��� o    ���� 0 
sleepdelay 
SleepDelay� m    ��
�� 
long� o      ���� 0 oursleepdelay ourSleepDelay� ��� r    ��� m    ��
�� 
msng� o      ���� &0 wearereadytosleep weAreReadyToSleep� ��� l   ��������  ��  ��  � ��� Z    9������� =   $��� o    "���� 0 debugoutput debugOutput� m   " #��
�� boovtrue� I   ' 5������� 0 logthis logThis� ��� m   ( )�� ���  * *   M a i n   P a r t   * *� ��� b   ) ,��� m   ) *�� ��� . M i n u t e s   S i n c e   W a k e u p   =  � o   * +���� .0 theminutessincewakeup theMinutesSinceWakeup� ���� o   , 1���� 0 debugoutput debugOutput��  ��  ��  ��  � ��� l  : :��������  ��  ��  � ��� Z   :������ ?  : =��� o   : ;���� .0 theminutessincewakeup theMinutesSinceWakeup� m   ; <������� k   @ t�� ��� l  @ @������  � t n when we woke up but there is no user interaction (e.g. Wake On LAN) then we have to wait the full sleep delay   � ��� �   w h e n   w e   w o k e   u p   b u t   t h e r e   i s   n o   u s e r   i n t e r a c t i o n   ( e . g .   W a k e   O n   L A N )   t h e n   w e   h a v e   t o   w a i t   t h e   f u l l   s l e e p   d e l a y� ��� r   @ G��� [   @ E��� l  @ C����� \   @ C��� o   @ A�~�~ 0 oursleepdelay ourSleepDelay� o   A B�}�} .0 theminutessincewakeup theMinutesSinceWakeup��  �  � m   C D�� ?�������� o      �|�| $0 delaytonextcheck delayToNextCheck� ��� l  H H�{�z�y�{  �z  �y  � ��� Z   H r���x�w� =  H O��� o   H M�v�v 0 debugoutput debugOutput� m   M N�u
�u boovtrue� I   R n�t��s�t 0 logthis logThis� ��� m   S T�� ���  * *   M a i n   P a r t   * *� ��� b   T e��� b   T c��� b   T a��� b   T _��� b   T ]��� b   T [��� b   T Y��� b   T W� � m   T U � Z P r e v e n t   s l e e p   b e c a u s e   M i n u t e s   S i n c e   W a k e u p   =    o   U V�r�r .0 theminutessincewakeup theMinutesSinceWakeup� m   W X � B     "     D e l a y   N e x t   C h e c k   f o r   x   M i n :  � o   Y Z�q�q $0 delaytonextcheck delayToNextCheck� 1   [ \�p
�p 
lnfd� 1   ] ^�o
�o 
lnfd� m   _ ` �  - - - - - -� 1   a b�n
�n 
lnfd� 1   c d�m
�m 
lnfd� �l o   e j�k�k 0 debugoutput debugOutput�l  �s  �x  �w  � �j l  s s�i�h�g�i  �h  �g  �j  ��  � k   w		 

 l  w w�f�e�d�f  �e  �d    l  w w�c�c   < 6 let's check if any application wants to prevent sleep    � l   l e t ' s   c h e c k   i f   a n y   a p p l i c a t i o n   w a n t s   t o   p r e v e n t   s l e e p  l  w w�b�a�`�b  �a  �`    r   w ~ I   w |�_�^�]�_ *0 checkifreadytosleep checkIfReadyToSleep�^  �]   o      �\�\ &0 wearereadytosleep weAreReadyToSleep  l   �[�Z�Y�[  �Z  �Y   �X Z   �W =   � o    ��V�V &0 wearereadytosleep weAreReadyToSleep m   � ��U
�U boovfals k   � �  !  l  � ��T"#�T  " H B some application wants to keep the Mac awake - let's respect that   # �$$ �   s o m e   a p p l i c a t i o n   w a n t s   t o   k e e p   t h e   M a c   a w a k e   -   l e t ' s   r e s p e c t   t h a t! %&% r   � �'(' o   � ��S�S P0 &sleepthresholdafterapplicationfinishes &sleepThresholdAfterApplicationFinishes( o      �R�R $0 delaytonextcheck delayToNextCheck& )*) l  � ��Q�P�O�Q  �P  �O  * +,+ Z   � �-.�N�M- =  � �/0/ o   � ��L�L 0 debugoutput debugOutput0 m   � ��K
�K boovtrue. k   � �11 232 r   � �454 c   � �676 o   � ��J�J &0 wearereadytosleep weAreReadyToSleep7 m   � ��I
�I 
TEXT5 o      �H�H <0 debugstringwearereadytosleep debugStringWeAreReadyToSleep3 8�G8 I   � ��F9�E�F 0 logthis logThis9 :;: m   � �<< �== 2 * *   D e l a y i n g   n e x t   c h e c k   * *; >?> b   � �@A@ b   � �BCB b   � �DED b   � �FGF b   � �HIH b   � �JKJ b   � �LML b   � �NON b   � �PQP b   � �RSR m   � �TT �UU " D e l a y   f o r   x   M i n :  S o   � ��D�D $0 delaytonextcheck delayToNextCheckQ m   � �VV �WW .     "     M i n   s i n c e   w a k e u p :  O o   � ��C�C .0 theminutessincewakeup theMinutesSinceWakeupM m   � �XX �YY D     "     A p p l i c a t i o n s   r e a d y   t o   s l e e p :  K o   � ��B�B <0 debugstringwearereadytosleep debugStringWeAreReadyToSleepI 1   � ��A
�A 
lnfdG 1   � ��@
�@ 
lnfdE m   � �ZZ �[[  - - - - - -C 1   � ��?
�? 
lnfdA 1   � ��>
�> 
lnfd? \�=\ o   � ��<�< 0 debugoutput debugOutput�=  �E  �G  �N  �M  , ]�;] l  � ��:�9�8�:  �9  �8  �;   ^_^ =  � �`a` o   � ��7�7 &0 wearereadytosleep weAreReadyToSleepa m   � ��6
�6 boovtrue_ b�5b k   �cc ded Z   � �fg�4�3f =  � �hih o   � ��2�2 0 debugoutput debugOutputi m   � ��1
�1 boovtrueg I   � ��0j�/�0 0 logthis logThisj klk m   � �mm �nn 6 * *   W e   a r e   g o i n g   t o   s l e e p   * *l opo b   � �qrq b   � �sts b   � �uvu b   � �wxw b   � �yzy m   � �{{ �|| V N e x t   c h e c k   i s   d e l a y e d   u n t i l   t h e   n e x t   w a k e u pz 1   � ��.
�. 
lnfdx 1   � ��-
�- 
lnfdv m   � �}} �~~  - - - - - -t 1   � ��,
�, 
lnfdr 1   � ��+
�+ 
lnfdp �* o   � ��)�) 0 debugoutput debugOutput�*  �/  �4  �3  e ��� l  � ��(�'�&�(  �'  �&  � ��� l  � ��%���%  � C = no application needs the Mac anymore - we are ready to sleep   � ��� z   n o   a p p l i c a t i o n   n e e d s   t h e   M a c   a n y m o r e   -   w e   a r e   r e a d y   t o   s l e e p� ��� l  � ��$�#�"�$  �#  �"  � ��� O  �	��� I �!�� 
�! .sysoexecTEXT���     TEXT� m  �� ���  p m s e t   s l e e p n o w�   �  f   � �� ��� l 

����  �  �  � ��� l 

����  � � | in case the sleep is delayed for some reason make sure the script is not calling the sleep command twice (delay in minutes)   � ��� �   i n   c a s e   t h e   s l e e p   i s   d e l a y e d   f o r   s o m e   r e a s o n   m a k e   s u r e   t h e   s c r i p t   i s   n o t   c a l l i n g   t h e   s l e e p   c o m m a n d   t w i c e   ( d e l a y   i n   m i n u t e s )� ��� r  
��� m  
�� � o      �� $0 delaytonextcheck delayToNextCheck�  �5  �W  �X  � ��� l ����  �  �  � ��� Z  %����� ? ��� o  �� $0 delaytonextcheck delayToNextCheck� m  ��  � k  �� ��� l ����  � L F wait the calculated amount of minutes and restart the "on idle" block   � ��� �   w a i t   t h e   c a l c u l a t e d   a m o u n t   o f   m i n u t e s   a n d   r e s t a r t   t h e   " o n   i d l e "   b l o c k� ��� L  �� ]  ��� o  �� $0 delaytonextcheck delayToNextCheck� m  �� <�  �  � k  !%�� ��� l !!����  � k e otherwise continue in 5 seconds ("return 0" would set the return time to Apple's default 30 seconds)   � ��� �   o t h e r w i s e   c o n t i n u e   i n   5   s e c o n d s   ( " r e t u r n   0 "   w o u l d   s e t   t h e   r e t u r n   t i m e   t o   A p p l e ' s   d e f a u l t   3 0   s e c o n d s )� ��� L  !%�� m  !$�� �  � ��� l &&�
�	��
  �	  �  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 errmsg errMsg� ���
� 
errn� o      �� 0 errornumber errorNumber�  � I  /A���� 0 logthis logThis� ��� m  03�� ���   *   o n   i d l e   l o o p   *� ��� b  38��� m  36�� ���  U n k n o w n   e r r o r :  � o  67� �  0 errmsg errMsg� ���� o  8=���� 0 debugoutput debugOutput��  �  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � Y S HELPER METHODS -------------------------------------------------------------------   � ��� �   H E L P E R   M E T H O D S   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� i   ! $��� I      ������� 0 logthis logThis� ��� o      ���� 0 thevar theVar� ��� o      ���� 0 theval theVal� ���� o      ���� 0 logit logIt��  ��  � Z     +������� o     ���� 0 logit logIt� k    '�� ��� r    ��� b    ��� b    ��� b    ��� b    ��� l   ������ I   ����
�� .sysoexecTEXT���     TEXT� m    �� ��� 4 d a t e     + ' % Y - % m - % d   % H : % M : % S '� �����
�� 
rtyp� m    ��
�� 
TEXT��  ��  ��  � m    �� ���   � n    ��� 1    ��
�� 
strq� l   ������ b    ��� b    ��� m    �� ���  (� o    ���� 0 thevar theVar� m    �� ���  )��  ��  � m    �� ���   � n       1    ��
�� 
strq o    ���� 0 theval theVal� o      ���� 0 theline theLine� �� I   '����
�� .sysoexecTEXT���     TEXT b    # b    ! m     �		 
 e c h o   o     ���� 0 theline theLine m   ! "

 � 8   > >   ~ / D e s k t o p / N a r c o l e p s y . l o g��  ��  ��  ��  �  l     ��������  ��  ��   �� i   % ( I      ������ 0 replace_chars    o      ���� 0 	this_text    o      ���� 0 search_string   �� o      ���� 0 replacement_string  ��  ��   k        r      l    ���� o     ���� 0 search_string  ��  ��   n      1    ��
�� 
txdl 1    ��
�� 
ascr   r    !"! n    	#$# 2    	��
�� 
citm$ o    ���� 0 	this_text  " l     %����% o      ���� 0 	item_list  ��  ��    &'& r    ()( l   *����* o    ���� 0 replacement_string  ��  ��  ) n     +,+ 1    ��
�� 
txdl, 1    ��
�� 
ascr' -.- r    /0/ c    121 l   3����3 o    ���� 0 	item_list  ��  ��  2 m    ��
�� 
TEXT0 o      ���� 0 	this_text  . 454 r    676 m    88 �99  7 n     :;: 1    ��
�� 
txdl; 1    ��
�� 
ascr5 <��< L     == o    ���� 0 	this_text  ��  ��       ��>��������  ! &?@ABCD��  > ���������������������������� 0 
sleepdelay 
SleepDelay�� P0 &sleepthresholdafterapplicationfinishes &sleepThresholdAfterApplicationFinishes�� 0 debugoutput debugOutput�� *0 debugoutput_verbose debugOutput_verbose�� 0 serverip ServerIP�� 0 lmsusername LMSusername�� 0 	lmsuserpw 	LMSuserPW�� *0 checkifreadytosleep checkIfReadyToSleep�� ,0 detectifwewereasleep detectIfWeWereAsleep
�� .miscidlenmbr    ��� null�� 0 logthis logThis�� 0 replace_chars  
�� .aevtoappnull  �   � ****�� �� 
�� boovfals
�� boovfals? �� 9����EF���� *0 checkifreadytosleep checkIfReadyToSleep��  ��  E ������������������������������������������������ 0 readytosleep readyToSleep�� $0 kernelassertions kernelAssertions�� 0 	narco_pid  �� 0 	grep_part  �� 0 
my_command  �� 60 kernelassertioncountnarco kernelAssertionCountNarco�� 0 aggreginfos aggregInfos�� "0 whichassertions whichAssertions�� 0 errmsg errMsg�� 0 errornumber errorNumber�� 0 playercountquery  �� 0 
countstart  �� 0 playercount  �� 0 this_playerindex  �� 0 	idcommand  �� 0 this_playerid  �� 0 playeridstart  �� 0 powercommand  �� 0 powerstatus  �� 0 namecommand  �� 0 this_playername  �� 0 rescanstatus rescanStatus�� 0 tmstatus  F m k���� �����G�� � � ����� � ��� � � � � � ���~�}�|)79�{?CYn|~����zH���������y�x�w�v�u�t;=?ACSW`�s�r�q����������������"(OQSU`dkz~����������
�� .sysoexecTEXT���     TEXT
�� 
long
�� 
prcs
�� 
iduxG  
�� 
pnam��  ��  
�� 
strq
� 
TEXT
�~ 
ret 
�} 
lnfd�| 0 replace_chars  �{ 0 logthis logThis�z 0 errmsg errMsgH �p�o�n
�p 
errn�o 0 errornumber errorNumber�n  
�y 
psof
�x 
psin�w 
�v .sysooffslong    ��� null
�u 
cha �t �s �r 
�q 
ctxt���eE�O���j �&E�O� ) *�k/�,�[�,\Z�@1E�O�%�%E�W 
X  �E�UO��,%E�O �j �&E�W 
X  jE�O�k  
�kE�Y hOb  e   a �%a %a %�%a %a %�%E�Y 	a �%E�O�j qeE�Ob  e  _a j a &E�O*�_ _ m+ E�Ob  e  %*a a _ %�%_ %a %�%b  m+ Y *a a  b  m+ Y hY �fE�Ob  e  qa !j a &E�O*�_ _ m+ E�Ob  e  %*a "a #_ %�%_ %a $%�%b  m+ Y $*a %a &_ %�%_ %a '%�%b  m+ OPY hW X ( )*a *a +��,%b  m+ O�a ,b  %a -%b  %a .%b  %a /%j E�Oa 0��,%a 1%j E�O*a 2a 3a 4�a 5 6E�O�a 7�a 8/�&E�O�kE�Orj�kh a 9b  %a :%b  %a ;%�%a <%b  %a =%E�O�j E�Oa >��,%a ?%j E�O*a 2a @a 4�a 5 6E^ O�[a 7\[Z] a A\Z] a B2a C&E�Oa Db  %a E%b  %a F%�%a G%b  %a H%E^ O] j E^ Oa I] �,%a J%j E^ O] a K �fE�Oa Lb  %a M%b  %a N%�%a O%b  %a P%E^ O] j E^ Oa Q] �,%a R%j E^ Oa S] �,%a T%j E^ Ob  e  *a Ua V] %a W%b  m+ Y hY h[OY��W X ( )*a Xa Y��,%b  m+ O ua Zb  %a [%b  %a \%b  %a ]%j E^ Oa ^] �,%a _%j E^ O] a ` 'fE�Ob  e  *a aa bb  m+ Y hY hW X ( )*a ca d��,%b  m+ O Aa ej E^ O] a f 'fE�Ob  e  *a ga hb  m+ Y hY hW X ( )*a ia j��,%b  m+ OPW X ( )*a ka l��,%b  m+ O�@ �m �l�kIJ�j�m ,0 detectifwewereasleep detectIfWeWereAsleep�l  �k  I �i�h�g�f�e�d�i 0 currenttime currentTime�h 0 waketime wakeTime�g (0 secondssincewakeup secondsSinceWakeup�f 00 oursleepdelayinseconds ourSleepDelayInSeconds�e 0 errmsg errMsg�d 0 errornumber errorNumberJ -�c�b7�a�`Kjp�_�^
�c .sysoexecTEXT���     TEXT
�b 
long�a <�` 0 errmsg errMsgK �]�\�[
�] 
errn�\ 0 errornumber errorNumber�[  
�_ 
strq�^ 0 logthis logThis�j R 8�j �&E�O�j �&E�O��E�Ob   � E�O�� 	��!Y iW X  *���,%b  m+ 
OiA �Z��Y�XLM�W
�Z .miscidlenmbr    ��� null�Y  �X  L �V�U�T�S�R�Q�P�V $0 delaytonextcheck delayToNextCheck�U .0 theminutessincewakeup theMinutesSinceWakeup�T 0 oursleepdelay ourSleepDelay�S &0 wearereadytosleep weAreReadyToSleep�R <0 debugstringwearereadytosleep debugStringWeAreReadyToSleep�Q 0 errmsg errMsg�P 0 errornumber errorNumberM �O�N�M���L���K�J�I<TVXZm{}��H�G�F�EN���O ,0 detectifwewereasleep detectIfWeWereAsleep
�N 
long
�M 
msng�L 0 logthis logThis
�K 
lnfd�J *0 checkifreadytosleep checkIfReadyToSleep
�I 
TEXT
�H .sysoexecTEXT���     TEXT�G <�F �E 0 errmsg errMsgN �D�C�B
�D 
errn�C 0 errornumber errorNumber�B  �WB)jE�O*j+  E�Ob   �&E�O�E�Ob  e  *��%b  m+ Y hO�i 9���E�Ob  e  !*��%�%�%�%�%�%�%�%b  m+ Y hOPY �*j+ E�O�f  Ib  E�Ob  e  1��&E�O*��%a %�%a %�%�%�%a %�%�%b  m+ Y hOPY G�e  @b  e  !*a a �%�%a %�%�%b  m+ Y hO) 	a j UOkE�Y hO�j �a  Y a OPW X  *a a �%b  m+ B �A��@�?OP�>�A 0 logthis logThis�@ �=Q�= Q  �<�;�:�< 0 thevar theVar�; 0 theval theVal�: 0 logit logIt�?  O �9�8�7�6�9 0 thevar theVar�8 0 theval theVal�7 0 logit logIt�6 0 theline theLineP ��5�4�3����2�

�5 
rtyp
�4 
TEXT
�3 .sysoexecTEXT���     TEXT
�2 
strq�> ,� (���l �%�%�%�,%�%��,%E�O�%�%j Y hC �1�0�/RS�.�1 0 replace_chars  �0 �-T�- T  �,�+�*�, 0 	this_text  �+ 0 search_string  �* 0 replacement_string  �/  R �)�(�'�&�) 0 	this_text  �( 0 search_string  �' 0 replacement_string  �& 0 	item_list  S �%�$�#�"8
�% 
ascr
�$ 
txdl
�# 
citm
�" 
TEXT�. !���,FO��-E�O���,FO��&E�O���,FO�D �!U� �VW�
�! .aevtoappnull  �   � ****U k     XX ���  �   �  V  W ���� 0 logthis logThis� *��b  m+  ascr  ��ޭ