using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Cofe_net
{
    public partial class NameInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected string getConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {//用executescalar方法从regist数据库的client_regist表中查询结果比较
            string Emailname = Request.Form["nameinfo"];
            string dataurl = getConnectionString();
            SqlConnection connection = new SqlConnection(dataurl);
            SqlCommand commad = new SqlCommand();
            SqlTransaction trans = null;
            try{
                connection.Open();
                if (connection.State == ConnectionState.Open)
                {
                    commad.Connection = connection;
                    trans = connection.BeginTransaction();
                    commad.Transaction = trans;
                    commad.CommandType = CommandType.Text;
                    commad.CommandText = "SELECT * FROM client_regist WHERE Email='"+Emailname+"'"; 
                    trans.Commit();                    

                    SqlDataReader reader = commad.ExecuteReader();                    
                    while (reader.Read()) {
                        Label[] labels = { this.Label1, this.Label2, this.Label3, this.Label4, this.Label5 };
                        for (int i = 1; i < 6; i++) {
                           labels[i].Text = reader[i-1].ToString(); 
                        }
                    }
                    connection.Close();  
                }
            }
            catch (SqlException ex) {
                trans.Rollback();
                string message = ex.Message;
                Response.Write("<script>alert(message);</script>");
            }
        }
        
    }
}