using CommunityToolkit.Mvvm.Input;
using OfficeOpenXml;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using WpfApp1.Data;
using WpfApp1.Models;
using Xceed.Words.NET;

namespace WpfApp1.ViewModels
{
    public class BasketViewModel : INotifyPropertyChanged
    {
        private readonly DatabaseContext _dbContext = new DatabaseContext();
        private string _productCode;
        private ObservableCollection<BasketItem> _basketItems = new ObservableCollection<BasketItem>();

        public string ProductCode
        {
            get => _productCode;
            set
            {
                _productCode = value;
                OnPropertyChanged(nameof(ProductCode));
            }
        }

        public ObservableCollection<BasketItem> BasketItems
        {
            get => _basketItems;
            set
            {
                _basketItems = value;
                OnPropertyChanged(nameof(BasketItems));
                OnPropertyChanged(nameof(TotalSum));
                OnPropertyChanged(nameof(Tax));
            }
        }

        public decimal TotalSum => BasketItems.Sum(item => item.TotalPrice);
        public decimal Tax => TotalSum * 0.05m;

        public ICommand AddProductCommand { get; }
        public ICommand ClearBasketCommand { get; }
        public ICommand ExportToWordCommand { get; }
        public ICommand ExportToExcelCommand { get; }

        public BasketViewModel()
        {
            AddProductCommand = new RelayCommand(AddProduct);
            ClearBasketCommand = new RelayCommand(ClearBasket);
            ExportToWordCommand = new RelayCommand(_ => ExportToWord("Checkout.docx"));
            ExportToExcelCommand = new RelayCommand(_ => ExportToExcel("Checkout.xlsx"));
            BasketItems.CollectionChanged += (s, e) =>
            {
                OnPropertyChanged(nameof(BasketItems));
                OnPropertyChanged(nameof(TotalSum));
                OnPropertyChanged(nameof(Tax));
            };
        }

        private void AddProduct(object parameter)
        {
            if (string.IsNullOrEmpty(ProductCode)) return;
            var product = _dbContext.Products.FirstOrDefault(p => p.ProductCode == ProductCode);
            if (product != null)
            {
                var existingItem = BasketItems.FirstOrDefault(item => item.Product.ProductCode == ProductCode);
                if (existingItem != null)
                    existingItem.Quantity++;
                else
                    BasketItems.Add(new BasketItem { Product = product, Quantity = 1 });
                ProductCode = string.Empty;
            }
        }

        private void ClearBasket(object parameter)
        {
            BasketItems.Clear();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public void ExportToWord(string filePath)
        {
            if (File.Exists(filePath))
                File.Delete(filePath);

            using (var document = DocX.Create(filePath))
            {
                document.InsertParagraph("Чек супермаркета")
                       .FontSize(20)
                       .Bold()
                       .Alignment = Xceed.Document.NET.Alignment.center;

                var table = document.AddTable(BasketItems.Count + 1, 4);
                table.Rows[0].Cells[0].Paragraphs.First().Append("Название").Bold();
                table.Rows[0].Cells[1].Paragraphs.First().Append("Код").Bold();
                table.Rows[0].Cells[2].Paragraphs.First().Append("Количество").Bold();
                table.Rows[0].Cells[3].Paragraphs.First().Append("Цена").Bold();

                int rowIndex = 1;
                foreach (var item in BasketItems)
                {
                    table.Rows[rowIndex].Cells[0].Paragraphs.First().Append(item.Product.Name);
                    table.Rows[rowIndex].Cells[1].Paragraphs.First().Append(item.Product.ProductCode);
                    table.Rows[rowIndex].Cells[2].Paragraphs.First().Append(item.Quantity.ToString());
                    table.Rows[rowIndex].Cells[3].Paragraphs.First().Append(item.TotalPrice.ToString("C"));
                    rowIndex++;
                }

                document.InsertTable(table);

                document.InsertParagraph($"Итог: {TotalSum:C}")
                       .FontSize(14);
                document.InsertParagraph($"Налог (5%): {Tax:C}")
                       .FontSize(14);

                document.Save();

                MessageBox.Show($"Файл {filePath} сохранён.", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        public void ExportToExcel(string filePath)
        {
            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
            if (File.Exists(filePath))
                File.Delete(filePath);

            using (var package = new ExcelPackage(new FileInfo(filePath)))
            {
                var worksheet = package.Workbook.Worksheets["Чек"];
                if (worksheet != null)
                    package.Workbook.Worksheets.Delete(worksheet);

                worksheet = package.Workbook.Worksheets.Add("Чек");

                worksheet.Cells[1, 1].Value = "Название";
                worksheet.Cells[1, 2].Value = "Код";
                worksheet.Cells[1, 3].Value = "Количество";
                worksheet.Cells[1, 4].Value = "Цена";

                int row = 2;
                foreach (var item in BasketItems)
                {
                    worksheet.Cells[row, 1].Value = item.Product.Name;
                    worksheet.Cells[row, 2].Value = int.Parse(item.Product.ProductCode);
                    worksheet.Cells[row, 3].Value = item.Quantity;
                    worksheet.Cells[row, 4].Value = item.TotalPrice;
                    row++;
                }

                worksheet.Cells[row, 3].Value = "Итог:";
                worksheet.Cells[row, 4].Value = TotalSum;
                worksheet.Cells[row + 1, 3].Value = "Налог (5%):";
                worksheet.Cells[row + 1, 4].Value = Tax;

                worksheet.Cells[1, 1, 1, 4].Style.Font.Bold = true;
                worksheet.Cells[1, 1, row + 1, 4].AutoFitColumns();

                package.Save();

                MessageBox.Show($"Файл {filePath} сохранён.", "Сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}