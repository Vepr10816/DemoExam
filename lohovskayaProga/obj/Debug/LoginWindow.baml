   M S B A M L   `   `   `  ����J  FlohovskayaProga, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:lohovskayaProgalohovskayaProga  5   	   !    lohovskayaProga.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:lohovskayaProga     5   	     � Title$  Login��5   	   $	��450��6   $	��800��6$    � WindowStyle$ 
ToolWindow=�60    � WindowStartupLocation$ CenterScreen=�6J   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6    � RowDefinitions 5   
   �� 5      $��2* �6   �� 5      $
��0.5* �6   �� 5      $
��0.2* �6   �� 5      $
��0.5* �6   �� 5      $
��0.5* �6   �� 5      $
��0.2* �6   .+�5   
   ��    
LabelStyle#��[  6   $��1��64   $��1��6A   $��Username��6Q   �� 5   
   #��[  6   $��3��64   $��1��6A   $��Password��6Q   �� 5   
   -   5        $��
ErrorLabel��5      #��[  6"   $��10(�6F   $��2��6T   $��2��6b   $��4��6r   
���  ��6�   �� 5   
   -   5        $��
UsernameTB��5        TextBoxStyle#��[ 6$   $��1��6J   $��4��6W   $��2��6k   $��10, 10, 10,10q�6{   G� 5    
   -   5        $��
PasswordTB��5       $��3��6)   $��4��66   $��2��6J   $��10, 10, 10,10q�6Z   $��20(�6q   �� 5!   
   -   5        $��LoginButton��5!        ButtonStyle#��[ 6$   $��4��6I   $��2��6V   $��2��6j   $��Login��6z   $��20, 10, 20,10q�6�   6�   �� 5"   
   -   5        $��
ExitButton��5"      #��[ 6#   $��4��6H   $��2��6U   $��4��6i   $
��Exit��6y   $��20, 10, 20,10q�6�   6�   �� 5#   
   $��Images/logo.png��6   $��2��6)   $��4��69   $��92��6M   5$      5%      