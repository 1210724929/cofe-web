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
    public partial class Showdetail2 : System.Web.UI.Page
    {
        //获得数据库连接地址
        protected string getConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection objConn = new SqlConnection(getConnectionString()))
                {
                    objConn.Open();
                    string sql = "select * from PriceInfo WHERE imgID='2'";
                    SqlCommand cmd = new SqlCommand(sql, objConn);
                    SqlDataReader dr = cmd.ExecuteReader();

                    string index = "";
                    string price = "";
                    string info = "";
                    while (dr.Read())
                    {
                        
                        index = dr[0].ToString();
                        price = dr[1].ToString();
                        info = dr[2].ToString();
                        if (int.Parse(index) > 0)
                        {
                            Image1.ImageUrl = "~/img/" + int.Parse(index) + ".jpg";
                            Label1.Text = info;
                            Label3.Text = "售价：￥" + price;
                        }
                        else {
                            Response.Redirect("../Default.aspx");
                        }
                       
                    }
                    objConn.Close();
                }


                using (SqlConnection objConn = new SqlConnection(getConnectionString()))
                {
                    objConn.Open();
                    string sql = "select Name_File from Images WHERE Roll_no='2'";
                    SqlCommand cmd = new SqlCommand(sql, objConn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    string head = "";
                    while (dr.Read())
                    {
                        head = dr[0].ToString().Trim('.', 'j', 'p', 'g');
                        Label2.Text = head;
                    }
                    objConn.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}