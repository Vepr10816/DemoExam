   M S B A M L   `   `   `  ����J  FlohovskayaProga, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:lohovskayaProgalohovskayaProga  5   	   "    lohovskayaProga.LogoutDetect   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:lohovskayaProga     5   	     � Title$  No logout detected��5   
   $	��450��6%   $	��800��62    � WindowStyle$ 
ToolWindow=�6>    � WindowStartupLocation$ CenterScreen=�6X   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $��0.15* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $��0.15* �6    � RowDefinitions 5   
   �� 5      $
��0.1* �6   �� 5      $
��0.2* �6   �� 5      $
��0.2* �6   �� 5      $��1* �6   �� 5      $��0.25* �6   �� 5      $
��0.2* �6   .+�5   
   �� -   5        $��lbError��5         
LabelStyle#��[  6   $	��Top=�6C   $��1��6[   $��1��6h   $��6��6x   $��15(�6�   $0��*No logout detected for your last login on ��6�   �� 5   
   #��[  6   $��2��64   $��Bottom=�6A   $��0��6\   $��2��6l   $��20,0,0,0q�6�   $��15(�6�   $��Reason :��6�   �� 5   
   -   5        $��rtbError��5      $��3��6'   $��6��66   $��1��6J   $��0,10,0,0q�6Z   $��15(�6l    �� 
IsReadOnly . 6z   �� 5    
   -   5        $��ConfirmButton��5         ButtonStyle#��[ 6&   $��4��6K   $��2��6X   $��5��6l   $��Confrim��6|   $��60, 10, 0,10q�6�   6�   	� 5!   
   -   5        $��
rbSoftware��5!        RadioButtonStyle#��[ 6(   $��Center=�6R   $��4��6m   $��2��6z   $��1��6�   .��6�   Software Crash6�   	� 5"   
   -   5        $��rbSystem��5"      #��[ 6&   $��Center=�6P   $��4��6k   $��2��6x   $��3��6�   .��6�   System Crash6�   5$      5%      