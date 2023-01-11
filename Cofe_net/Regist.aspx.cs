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
    public partial class Regist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        //私有函数 得到数据库地址字符
        protected string getConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {//注册数据库geist中client_regist表
            if(TextBox1.Text==""&&TextBox2.Text==""&&TextBox3.Text==""&&TextBox4.Text==""&&TextBox5.Text==""){
                Response.Write("<script>alert('请输入正确注册信息！');</script>");
            }
            string dataurl = getConnectionString();
            SqlConnection connection=new SqlConnection(dataurl);

            SqlCommand commad=new SqlCommand();
            SqlTransaction trans=null;
            try{
                connection.Open();
                 if(connection.State==ConnectionState.Open){
                     commad.Connection=connection;
                     trans = connection.BeginTransaction();
                     commad.Transaction=trans;
                     commad.CommandType=CommandType.Text;
                     commad.CommandText="Insert into client_regist(Name,Sex,Age,NickName,Email) VALUES(@name,@sex,@age,@nick,@email)";
                     commad.Parameters.Add("@name",SqlDbType.NChar).Value=TextBox1.Text;
                     commad.Parameters.Add("@sex",SqlDbType.NChar).Value=TextBox2.Text;
                      commad.Parameters.Add("@age",SqlDbType.Int).Value=Int32.Parse(TextBox3.Text);
                      commad.Parameters.Add("@nick",SqlDbType.NChar).Value=TextBox4.Text;
                      commad.Parameters.Add("@email",SqlDbType.NChar).Value=TextBox5.Text;

                     commad.ExecuteNonQuery();
                     trans.Commit();
                     Response.Write("<script>alert('注册成功');</script>");
                     connection.Close();
                     Response.Redirect("Login.aspx");
                 }              
            }catch(Exception ex){
                trans.Rollback();
                Response.Write(ex.Message);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {//重置
            foreach (Control c in this.Form.Controls)
            {
                if (c is TextBox)
                {
                    TextBox t = (TextBox)c;
                    t.Text = string.Empty;
                }
            }
        
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        
 
       

     }
}   

       