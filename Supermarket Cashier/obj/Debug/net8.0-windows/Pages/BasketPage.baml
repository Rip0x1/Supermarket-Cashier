   M S B A M L   `   `   `  ����N  JSupermarket Cashier, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:WpfApp1.ViewModelsWpfApp1.ViewModels  5      -clr-namespace:WpfApp1.PagesWpfApp1.Pages  5          WpfApp1.Pages.BasketPage   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=5.2.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      ,model clr-namespace:WpfApp1.ViewModels  5      'localclr-namespace:WpfApp1.Pages  5        N� Title$  Корзина��5      .��5      � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��0,0,0,20q�6.   .+�5      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Код товара��6   $	��200��6�    %  !MaterialDesignFloatingHintTextBox#��[  6�   ��6B   �� *ProductCode+ �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 5      $��Добавить��6   $��10,0,0,0q�6N     MaterialDesignRaisedButton#��[ 6`   ��6(   �� *AddProductCommand+6`   �� 5      $��Очистить��6   $��10,0,0,0q�6O   #��[ 6a   ��6(   �� *ClearBasketCommand+6a   5      &   System.Windows.Controls.DataGrid  5   
   $��1��6      AutoGenerateColumns$ False��6D      CanUserAddRows$ False��6`   ��6    �� *BasketItems+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Код��6%   	   
IsReadOnly$
	 True��6Z   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 62   �� *Product.ProductCode+6Z     5      $ Название��6%   $
	 True��6X   
 67   �� *Product.Name+6X     5      $ Ед. изм.��6%   $
	 True��6X   
 67   �� *Product.Unit+6X     5      $ Цена��6%   $
	 True��6f   
 63   �� *Product.Price+ �� StringFormat$ C2��6f     5      $ Количество��6%   
 69   �� *
Quantity+  5       $ Стоимость��6%   $
	 True��6h   
 68   �� *
TotalPrice+$ C2��6h      	CellStyle 5"      �� 5#       �� 
TargetType*  $System.Windows.Controls.DataGridCell"  6   .�5$      ��  �� Property � �� �� Value$ 5q�60    �� Triggers 5%      P� 5&       P� Property �@ 
IsSelected P� Value$
 True��68   . �5'      ��  � ��  MaterialDesignSelection# �  6;   5(      5*      5,      �� 5.   
   $��2��6   $��0,20,0,0q�6"   .+�5/      �� $��16(�6P   $
��Bold"�6^   ��6   �� *
TotalSum+$ Итого: {0:C2}��6^   �� 50      $��14(�6U   $��0,5,0,0q�6c   ��6   �� *Tax+$% В т.ч. налог 5%: {0:C2}��6c   51      52      53      