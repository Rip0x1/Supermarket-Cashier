   M S B A M L   `   `   `  ���� N  JSupermarket Cashier, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WpfApp1.PagesWpfApp1.Pages  7 clr-namespace:WpfApp1.ViewModelsWpfApp1.ViewModels       WpfApp1.Pages.ProductsPage   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -localclr-namespace:WpfApp1.Pages     2model clr-namespace:WpfApp1.ViewModels       N� Title$  Товары�� � DataContext *   $WpfApp1.ViewModels.ProductsViewModel  .��� $��20q�.+�&   System.Windows.Controls.DataGrid     AutoGenerateColumns$ False��   CanUserAddRows$ False������ *
Products+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Код��   
IsReadOnly$
 True��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductCode+  $ Название��$
 True�� �� *Name+  $ Ед. изм.��$
 True�� �� *Unit+  $ Цена��$
 True�� �� *Price+ �� StringFormat$ C2��	   	CellStyle	 �� 
 �� 
TargetType*  $System.Windows.Controls.DataGridCell"
  .���  �� Property � �� �� Value$ 5q� �� Triggers P�  P� Property �@ 
IsSelected P� Value$
 True��. ���  � ��   MaterialDesignSelection# �   