using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Runtime.Remoting.Messaging;

namespace Prac_16
{
    internal static class Sub
    {
        public static SqlConnection sql = new SqlConnection(@"Data Source=DESKTOP-JBSVKHP\SQLEXPRESS1;Initial Catalog=Prac_16;Integrated Security=True");

        public static int Count()
        {
            sql.Open();
            SqlCommand com = new SqlCommand("select count(*) from Books", sql);
            int ans = (int)com.ExecuteScalar();
            sql.Close();
            return ans;
        }

        public static List<List<string>> GetBooks()
        {
            List<List<string>> lists = new List<List<string>>();

            sql.Open();
            SqlCommand com = new SqlCommand("select id, name, img from Books", sql);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lists.Add(new List<string>()
                {
                    dr.GetString(0),
                    dr.GetString(1),
                    dr.GetString(2)
                });
            }
            sql.Close();
            dr.Close();
            return lists;
        }

        public static List<string> GetAboutBooks(string id)
        {
            List<string> lists = new List<string>();

            sql.Open();
            SqlCommand com = new SqlCommand($"select name, img, description, price from Books where id = '{id}'", sql);
            SqlDataReader dr = com.ExecuteReader();
            while(dr.Read())
            {
                List<string> list = new List<string>
                {
                    dr.GetString(0),
                    dr.GetString(1),
                    dr.GetString(2),
                    dr.GetString(3)
                };
                lists = list;
            }
            sql.Close();
            dr.Close();
            return lists;
        }


        /*
         string  savePath = System.IO.Path.GetFullPath(@"..\..\..\Фотки");
            OpenFileDialog OPF = new OpenFileDialog();
            OPF.Filter = "Изображения|*.png|*.jpeg|*.jpg";
            if (OPF.ShowDialog() == true)
            {
                string fileName = System.IO.Path.GetFileName(OPF.FileName);
                savePath = savePath + "\\" + fileName;
                wayphoto = fileName;
                BitmapImage bitmap = new BitmapImage();
                bitmap.BeginInit();
                bitmap.UriSource = new Uri(savePath);
                bitmap.EndInit();
                Image.Source = bitmap;
            }
            else
            {
                MessageBox.Show("Изображение не выбрано");
            }



                        ////MouseButtonEventArgs args = new MouseButtonEventArgs(Mouse.PrimaryDevice, 0, MouseButton.Left);
                ////args.RoutedEvent = MouseLeftButtonDownEvent;

                ////img.RaiseEvent(args);
         */
    }
}
