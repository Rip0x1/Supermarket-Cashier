using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfApp1.Data;
using WpfApp1.Models;

namespace WpfApp1.ViewModels
{
    public class ProductsViewModel
    {
        private readonly DatabaseContext _dbContext = new DatabaseContext();
        public ObservableCollection<Product> Products { get; }

        public ProductsViewModel()
        {
            Products = new ObservableCollection<Product>(_dbContext.Products.ToList());
        }
    }
}
