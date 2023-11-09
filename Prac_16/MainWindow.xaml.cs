using Microsoft.Win32;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static System.Net.Mime.MediaTypeNames;

using Microsoft.Office.Interop.Word;
using Application = Microsoft.Office.Interop.Word.Application;
using DocumentFormat.OpenXml.Packaging;

namespace Prac_16
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            List<List<string>> lists = Sub.GetBooks();
            for (int i = 0; i < Sub.Count(); i++)
            {
                //Создаем элементы
                WrapPanel wp = new WrapPanel();
                System.Windows.Controls.Image img = new System.Windows.Controls.Image();
                Label l = new Label();

                //Настройка панели
                wp.Height = 300;
                wp.Width = 200;

                //Настройка Лейбла
                l.Content = lists[i][1];
                
                //Настройка Имаге
                    //Путь
                    string savePath = System.IO.Path.GetFullPath(@"..\..\..\Photos");
                    savePath = savePath + "\\" + lists[i][2];
                    BitmapImage bitmap = new BitmapImage();
                    bitmap.BeginInit();
                    bitmap.UriSource = new Uri(savePath);
                    bitmap.EndInit();
                    img.Source = bitmap;

                //Ивент на нажатие
                img.MouseDown += new MouseButtonEventHandler(MyImage_MouseDown);

                img.Height= 250;
                img.Width = 200;
                img.SetValue(FrameworkElement.NameProperty, lists[i][0]);

                //Дочерние в родительские
                wp.Children.Add(img);
                wp.Children.Add(l);
                List.Items.Add(wp);
            }
        }

        //Событие клика на фото
        private void MyImage_MouseDown(object sender, MouseButtonEventArgs e)
        {
            //System.Windows.Controls.Image img = new System.Windows.Controls.Image();

            // Получаем текущую позицию курсора
            System.Windows.Point mousePosition = Mouse.GetPosition(this);
            // Получаем элемент, на который указывает курсор
            IInputElement element = InputHitTest(mousePosition);
            // Получаем имя элемента
            string elementName = (element as FrameworkElement)?.Name;

            List<string> list = Sub.GetAboutBooks(elementName);

            string savePath = System.IO.Path.GetFullPath(@"..\..\..\Photos");
            savePath = savePath + "\\" + list[1];
            BitmapImage bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.UriSource = new Uri(savePath);
            bitmap.EndInit();
            Imag.Source = bitmap;

            description.Text = list[2];
            price.Content = list[3];
            title.Content = list[0];
        }

        private void amount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void minus_Click(object sender, RoutedEventArgs e)
        {
            if (amount.Text.Length != 0 && Convert.ToInt32(amount.Text) > 0)
                amount.Text = (Convert.ToInt32(amount.Text) - 1).ToString();
        }

        private void plus_Click(object sender, RoutedEventArgs e)
        {
            if(amount.Text.Length != 0)
            {
                amount.Text = (Convert.ToInt32(amount.Text) + 1).ToString();
            }
            else amount.Text = "1";
        }

        private void Confirm_Click(object sender, RoutedEventArgs e)
        {
            if (amount.Text != "0")
            {
                var fileName = $"{"Чек"}_{DateTime.Now.ToString("yyyyMMdd_HHmmss")}.docx";

                var savePath = @"C:\Users\maxim\Desktop\C#\Prac_16\Prac_16\Cheks\" + fileName;

                var wordApp = new Application();
                var document = wordApp.Documents.Add();
                document.Content.SetRange(0, 0);

                var companyName = "ООО Читатель";
                var welcomeText = "Добро пожаловать";
                var kkmNumber = "ККМ 00075411 #3969";
                var inn = "ИНН 1087746942040";
                var ekls = "ЭКЛЗ 3851495566";
                Random random = new Random();
                int num = random.Next(000000001, 999999999);
                var checkNumber = $"Чек №{num}";
                var dateTime = $"{DateTime.Now.ToString("yyyyMMdd_HHmmss")} СИС.";
                var line = "----------------------";

                string totalPrice = (Convert.ToInt32(amount.Text) * Convert.ToInt32(price.Content)).ToString();
                document.Content.Text = $"{companyName}\n{welcomeText}\n{kkmNumber}\n{inn}\n{ekls}\n{checkNumber}\n{dateTime}\n{line}" +
                    $"\nКнига: {title.Content}\nКоличество: {amount.Text}\nИтог: {totalPrice}\n{line}";

                //Сохраняем по указанному пути
                document.SaveAs2(savePath);
                document.Close();
                wordApp.Quit();
                MessageBox.Show("Чек сохранён!");
            }
            else MessageBox.Show("Какие 0 книг?");
            
        }
    }
}
