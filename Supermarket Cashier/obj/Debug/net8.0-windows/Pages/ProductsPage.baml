   M S B A M L   `   `   `  ����N  JSupermarket Cashier, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WpfApp1.PagesWpfApp1.Pages  5      7 clr-namespace:WpfApp1.ViewModelsWpfApp1.ViewModels  5           WpfApp1.Pages.ProductsPage   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:WpfApp1.Pages     5      2model clr-namespace:WpfApp1.ViewModels     5        N� Title$  Товары��5
       � DataContext 5      *   $WpfApp1.ViewModels.ProductsViewModel  5   
   .��5      � $��20q�6   .+�5   
   &   System.Windows.Controls.DataGrid     AutoGenerateColumns$ False��64      CanUserAddRows$ False��6P   ��6   �� *
Products+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Код��6%      
IsReadOnly$
 True��6R   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *ProductCode+6R     5      $ Название��6%   $
 True��6P    67   �� *Name+6P     5      $ Ед. изм.��6%   $
 True��6P    67   �� *Unit+6P     5      $ Цена��6%   $
 True��6^    63   �� *Price+ �� StringFormat$ C2��6^   	   	CellStyle	 5      �� 5      
 �� 
TargetType*  $System.Windows.Controls.DataGridCell"
  6   .�5      ��  �� Property � �� �� Value$ 5q�60    �� Triggers 5      P� 5       P� Property �@ 
IsSelected P� Value$
 True��68   . �5      ��  � ��   MaterialDesignSelection# �   6;   5      5      5       5!      5"      