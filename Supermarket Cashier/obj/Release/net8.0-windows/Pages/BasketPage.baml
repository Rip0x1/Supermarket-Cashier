   M S B A M L   `   `   `  ���� N  JSupermarket Cashier, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:WpfApp1.ViewModelsWpfApp1.ViewModels  -clr-namespace:WpfApp1.PagesWpfApp1.Pages      WpfApp1.Pages.BasketPage   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     _ [MaterialDesignThemes.Wpf, Version=5.2.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  ,model clr-namespace:WpfApp1.ViewModels  'localclr-namespace:WpfApp1.Pages    N� Title$  Корзина��.��� $��20q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+���  �� Orientation$ 
Horizontal=�$��0,0,0,20q�.+��� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Код товара��$	��200�� %  !MaterialDesignFloatingHintTextBox#��[  ���� *ProductCode+ �� UpdateSourceTrigger$ PropertyChanged=��� $��Добавить��$��10,0,0,0q�  MaterialDesignRaisedButton#��[ ���� *AddProductCommand+�� $��Очистить��$��10,0,0,0q�#��[ ���� *ClearBasketCommand+&   System.Windows.Controls.DataGrid  $��1��   AutoGenerateColumns$ False��   CanUserAddRows$ False������ *BasketItems+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Код��	   
IsReadOnly$
	 True��1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 �� *Product.ProductCode+  $ Название��$
	 True��
 �� *Product.Name+  $ Ед. изм.��$
	 True��
 �� *Product.Unit+  $ Цена��$
	 True��
 �� *Product.Price+ �� StringFormat$ C2��  $ Количество��
 �� *
Quantity+  $ Стоимость��$
	 True��
 �� *
TotalPrice+$ C2��   	CellStyle ��  �� 
TargetType*  $System.Windows.Controls.DataGridCell"  .���  �� Property � �� �� Value$ 5q� �� Triggers P�  P� Property �@ 
IsSelected P� Value$
 True��. ���  � ��  MaterialDesignSelection# �  �� $��2��$��0,20,0,0q�.+��� $��16(�$
��Bold"����� *
TotalSum+$ Итого: {0:C2}���� $��14(�$��0,5,0,0q����� *Tax+$% В т.ч. налог 5%: {0:C2}��