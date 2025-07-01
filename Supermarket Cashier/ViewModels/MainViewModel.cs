using CommunityToolkit.Mvvm.Input;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using WpfApp1.Pages;

namespace WpfApp1.ViewModels
{
    public class MainViewModel : INotifyPropertyChanged
    {
        private Page _currentPage;
        public BasketViewModel BasketViewModel { get; }

        public Page CurrentPage
        {
            get => _currentPage;
            set
            {
                _currentPage = value;
                OnPropertyChanged(nameof(CurrentPage));
            }
        }

        public ICommand NavigateToBasketCommand { get; }
        public ICommand NavigateToProductsCommand { get; }
        public ICommand ExitApplication { get; }

        public MainViewModel()
        {
            BasketViewModel = new BasketViewModel();
            NavigateToBasketCommand = new RelayCommand(_ => CurrentPage = new BasketPage(BasketViewModel));
            NavigateToProductsCommand = new RelayCommand(_ => CurrentPage = new ProductsPage());
            ExitApplication = new RelayCommand(_ => Application.Current.Shutdown());
            CurrentPage = new BasketPage(BasketViewModel); 
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
