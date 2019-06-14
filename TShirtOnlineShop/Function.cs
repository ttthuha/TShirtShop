using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TShirtOnlineShop
{
    public class Function
    {
        public bool SignInSuccess(string CustomerEmail, string CustomerPassword)
        {
            bool login = false;
            string con = ConfigurationManager.ConnectionStrings["AccountModel"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(con))
            {
                connection.Open();
                string SQL = string.Format("select count(*) from CUSTOMER where CustomerEmail = '{0}' and CustomerPassword = '{1}'", CustomerEmail, CustomerPassword);
                SqlCommand cmd = new SqlCommand(SQL, connection);
                login = Convert.ToBoolean(cmd.ExecuteScalar());
                connection.Close();
                return login;
            }
        }

        //Check exit customer

        public bool IsUserExist(string CustomerEmail)
        {
            bool flag = false;

            string con = ConfigurationManager.ConnectionStrings["AccountModel"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(con))
            {
                connection.Open();
                string SQL = string.Format("select count(*) from CUSTOMER where CustomerEmail = '{0}'", CustomerEmail);
                SqlCommand cmd = new SqlCommand(SQL, connection);
                flag = Convert.ToBoolean(cmd.ExecuteScalar());
                connection.Close();
                return flag;
            }
        }
        //Get customer name
        public string GetCustomerFullName(string CustomerEmail)
        {
            string CustomerFullName;
            string con = ConfigurationManager.ConnectionStrings["AccountModel"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(con))
            {
                connection.Open();
                string SQL = string.Format("select CustomerFullName from CUSTOMER where CustomerEmail = '{0}'", CustomerEmail);
                SqlCommand cmd = new SqlCommand(SQL, connection);
                SqlDataReader rd = cmd.ExecuteReader();
                rd.Read();
                CustomerFullName = rd["CustomerFullName"].ToString();
                connection.Close();
                return CustomerFullName;
            }
        }

    }
}