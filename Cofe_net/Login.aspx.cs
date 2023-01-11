using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Cofe_net
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //私有函数 得到数据库地址字符
        protected string getConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {//登录 用executescalar方法从regist数据库的client_regist表中查询结果比较
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
                    commad.CommandText = "SELECT Email,Name FROM client_regist WHERE Email='"+TextBox2.Text+"'"; 
                    trans.Commit();                    

                    SqlDataReader reader = commad.ExecuteReader();
                    string Emailestr="";
                    string Namestr = "";
                    while (reader.Read()) {
                        Emailestr += string.Format("{0}", reader[0]);
                        Emailestr = Emailestr.Trim();
                        Namestr += string.Format("{0}", reader[1]);
                        Namestr = Namestr.Trim();
                        if (TextBox2.Text == "123456789" && TextBox1.Text == "Admin") {                            
                            Response.Redirect("Admin.aspx");
                        }
                        else if (TextBox2.Text == Emailestr && TextBox1.Text == Namestr)
                        {
                            //如果正确就跳转网页 携带Email参数用于Default查询 
                            Response.Redirect("Default.aspx?Email="+TextBox2.Text);
                        }
                        else {
                            Response.Write("<script>alert('邮箱或者用户名错误，请重新输入！');</script>");     
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}