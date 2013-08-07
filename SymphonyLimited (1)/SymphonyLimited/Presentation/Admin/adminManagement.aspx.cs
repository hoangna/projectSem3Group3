using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Data;
using System.Data;

namespace Presentation.Admin
{
    
    public partial class adminManagement : System.Web.UI.Page
    {
        SqlConnection connect1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
               bindData();
               
            }
        }
      public  void  bindData(){
            connect1 = new Connection().getConnection();
            connect1.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Admin]",connect1);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

      protected void btnAdd_Click(object sender, EventArgs e)
      {
          //add admin
          connect1 = new Connection().getConnection();
          connect1.Open();
          SqlCommand cmd = new SqlCommand("insertAdmin", connect1);
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add(new SqlParameter("ID",txtId.Text));
          cmd.Parameters.Add(new SqlParameter("UserName", txtUser.Text));
          cmd.Parameters.Add(new SqlParameter("Password", txtPassw.Text));
          cmd.ExecuteNonQuery();
          bindData();
      }

      protected void btnEdit_Click(object sender, EventArgs e)
      {
           connect1 = new Connection().getConnection();
          connect1.Open();
          SqlCommand cmd = new SqlCommand("editAdmin",connect1);
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add(new SqlParameter("ID",txtId.Text));
          cmd.Parameters.Add(new SqlParameter("UserName",txtUser.Text));
          cmd.Parameters.Add(new SqlParameter("Password",txtPassw.Text));
          cmd.ExecuteNonQuery();
          bindData();
      }

      protected void btnDelete_Click(object sender, EventArgs e)
      {
          connect1 = new Connection().getConnection();
          connect1.Open();
          SqlCommand cmd = new SqlCommand("deleteAdmin", connect1);
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add(new SqlParameter("ID", txtId.Text));
          cmd.ExecuteNonQuery();
          bindData();
      }

      

      
      
       
    }
}