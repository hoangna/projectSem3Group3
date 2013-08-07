using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
namespace Data
{
    public class Connection
    {
        public string connectionString = "";
        public SqlConnection connect { set; get; }
        public SqlConnection getConnection() {
            connectionString = "Data Source=localhost;Initial Catalog=Symphony_Limited1;Persist Security Info=True;User ID=sa;Password=fat123456@";
            connect = new SqlConnection(connectionString);
            return connect;
        } 
    }
}
