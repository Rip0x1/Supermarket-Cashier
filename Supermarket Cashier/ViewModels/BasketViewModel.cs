using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WpfApp1.Data;
using WpfApp1.Models;

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

        public BasketViewModel()
        {
            AddProductCommand = new RelayCommand(AddProduct);
            ClearBasketCommand = new RelayCommand(ClearBasket);
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
    }
}
