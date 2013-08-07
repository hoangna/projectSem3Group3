using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Data;
namespace Presentation.Admin
{
    public partial class StudentManagement : System.Web.UI.Page
    {
        SqlConnection connect1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindData();

            }
        }
        public void bindData()
        {
            connect1 = new Connection().getConnection();
            connect1.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Student]", connect1);
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
            SqlCommand cmd = new SqlCommand("insertStudent", connect1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("ID", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("Roll_Student", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("Full_Name", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("Email ", TextBox4.Text));
            cmd.Parameters.Add(new SqlParameter("Address", TextBox5.Text));
            cmd.Parameters.Add(new SqlParameter("Phone_Number", TextBox6.Text));
            cmd.Parameters.Add(new SqlParameter("Birthday", Calendar1.SelectedDate.ToShortDateString()));
            cmd.Parameters.Add(new SqlParameter("Class_ID", TextBox8.Text));
            cmd.Parameters.Add(new SqlParameter("Practice_ID", DropDownList1.SelectedValue));
            cmd.ExecuteNonQuery();
            bindData();
          
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            connect1 = new Connection().getConnection();
          connect1.Open();
          SqlCommand cmd = new SqlCommand("editStudent",connect1);
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add(new SqlParameter("ID", TextBox1.Text));
          cmd.Parameters.Add(new SqlParameter("Roll_Student", TextBox2.Text));
          cmd.Parameters.Add(new SqlParameter("Full_Name", TextBox3.Text));
          cmd.Parameters.Add(new SqlParameter("Email ", TextBox4.Text));
          cmd.Parameters.Add(new SqlParameter("Address", TextBox5.Text));
          cmd.Parameters.Add(new SqlParameter("Phone_Number", TextBox6.Text));
          cmd.Parameters.Add(new SqlParameter("Birthday", Calendar1.SelectedDate.ToShortDateString()));
          cmd.Parameters.Add(new SqlParameter("Class_ID", TextBox8.Text));
          cmd.Parameters.Add(new SqlParameter("Practice_ID", DropDownList1.SelectedValue));
          cmd.ExecuteNonQuery();
          bindData();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            connect1 = new Connection().getConnection();
            connect1.Open();
            SqlCommand cmd = new SqlCommand("deleteStudent", connect1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("ID", TextBox1.Text));
            cmd.ExecuteNonQuery();
            bindData();
        }
    }
}