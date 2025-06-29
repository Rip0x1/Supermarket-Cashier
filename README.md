# 🛒 Касса Супермаркета (Supermarket Cashier)

## 📖 Описание проекта

**Касса Супермаркета** — это настольное WPF-приложение на языке C#, предназначенное для помощи кассиру в супермаркете. Приложение позволяет сканировать товары по коду, отображать их в корзине с учетом количества, рассчитывать стоимость и налог (5%). Поддерживается удобный интерфейс с навигацией между корзиной и списком товаров.

---

## 🔑 Основные функции

### 🛍 Для кассира:
- Ввод кода товара для добавления в корзину
- Отображение списка товаров в корзине с:
  - Кодом
  - Названием
  - Единицей измерения
  - Ценой
  - Количеством
  - Стоимостью
- Автоматический расчет:
  - Итоговой суммы
  - Налога (5%)
- Очистка корзины
- Просмотр полного списка товаров из базы данных

### 🗄 Управление данными:
- Хранение информации о товарах в базе данных SQL Server
- Поддержка русских символов для названий и единиц измерения

---

## 🛠 Используемые технологии

- Язык программирования: C#
- Графическая оболочка: WPF (.NET 8.0)
- Стилизация интерфейса: MaterialDesignInXAML
- База данных: Microsoft SQL Server
- ORM: Entity Framework Core
- Паттерн: MVVM
- Команды: CommunityToolkit.Mvvm

---

## 🗂 Структура проекта

Содержит основные файлы и папки приложения:

- `MainWindow.xaml` — главное окно с меню навигации
- `Pages/BasketPage.xaml` — страница корзины для работы с покупками
- `Pages/ProductsPage.xaml` — страница со списком всех товаров
- `ViewModels/` — ViewModel для управления логикой (MainViewModel, BasketViewModel, ProductsViewModel)
- `Models/` — модели данных (Product, BasketItem)
- `Data/DatabaseContext.cs` — контекст Entity Framework для работы с базой данных
- `RelayCommand.cs` — реализация команд для MVVM

---

## ▶️ Использование

1. Настройте базу данных:
   - Создайте базу `SupermarketCashier` в SQL Server с таблицей `Products`.
   - Обновите строку подключения в `DatabaseContext.cs`, если требуется.
2. Установите зависимости через NuGet:
   - `Microsoft.EntityFrameworkCore.SqlServer`
   - `MaterialDesignThemes`
   - `CommunityToolkit.Mvvm`
3. Запустите приложение.
4. Используйте:
   - Введите код товара (например, `1001`) на странице «Корзина» для добавления.
   - Переключайтесь на страницу «Товары» для просмотра всех товаров.
   - Очистите корзину при необходимости.

---

## 📷 Скриншоты

![image](https://github.com/user-attachments/assets/50694f54-2bc7-4204-b28b-cc020fef1dd1)
![image](https://github.com/user-attachments/assets/1607309d-7c85-4918-b037-a8a4ba96233b)
![image](https://github.com/user-attachments/assets/d8966ddf-2674-4ebc-83d6-7d790c123c23)


