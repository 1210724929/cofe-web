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
    public partial class Default : System.Web.UI.Page
    {
        protected void Button2_Click(object sender, EventArgs e)
        {            
            //Response.Redirect("Admin.aspx");
            //跳转登录页面输入Adim和123456798跳转后台
            Response.Redirect("Login.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Regist.aspx");
        }

        //得到数据库连接字符串
        protected string getConnectionString() {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        //展示图片
        private void showImage(string index, string ex)
        {   
            Image[] images = { this.Image1, this.Image2, this.Image3, this.Image4, this.Image5, this.Image6, this.Image7, this.Image8 };
            for (int i = 1; i <= int.Parse(index); i++){images[i-1].ImageUrl = @"~/img/" + i + ex; }
        }
        //展示图片基本信息
        private void showImageInfo(string name,string index,string time) {
            char[] deletchar = { '.','j','p','g'};
            name = name.Trim(deletchar);
            string[] nameInfo = name.Split(' ');
            string[] timeInfo = time.Split('.');            
            Label[]labelsname={this.Label1,this.Label2,this.Label3,this.Label4,this.Label5,this.Label6,this.Label7,this.Label8};
            Label[]labelsdate={this.Label9,this.Label10,this.Label11,this.Label12,this.Label13,this.Label14,this.Label15,this.Label16};
            for(int i=0;i<int.Parse(index);i++){labelsname[i].Text="品名："+nameInfo[i];labelsdate[i].Text=timeInfo[i];}
        }
        //显示商品价格
        private void showIagmePrice(string index,string price) {
            string[]Price=price.Split('$');
            Label[] labelprice = { this.Label17, this.Label18, this.Label19, this.Label20, this.Label21, this.Label22, this.Label23, this.Label24 };
            for (int i = 0; i < int.Parse(index); i++) { labelprice[i].Text = "售价：￥" + Price[i]; }
        }
        private void imagesPrice(){
             using (SqlConnection objConn = new SqlConnection(getConnectionString()))
            {
                objConn.Open();
                string sql = "select imgId,price from PriceInfo";
                SqlCommand cmd = new SqlCommand(sql, objConn);
                SqlDataReader dr = cmd.ExecuteReader();

                string index = "";
                string price = "";
                while (dr.Read())
                {
                    index=dr[0].ToString();
                    price+=dr[1].ToString().Trim();
                    price+="$";
                    showIagmePrice(index,price);
                }
             }
        }
  
        //显示图片+描述
        private void updateimages() {
            using (SqlConnection objConn = new SqlConnection(getConnectionString()))
            {
                objConn.Open();
                string sql = "select * from Images";
                SqlCommand cmd = new SqlCommand(sql, objConn);
                SqlDataReader dr = cmd.ExecuteReader();

                string name = "";
                string time = "";
                while (dr.Read())
                {
                    byte[] bytes = (byte[])dr[3];
                    string index = dr[0].ToString();
                    string ex = dr[2].ToString();//.TrimStart('.')去掉.
                   /* FileStream fs = new FileStream(Server.MapPath(@"./img/" + index + ex), FileMode.Create, FileAccess.Write);
                    fs.Write(bytes, 0, (int)bytes.Length);
                    fs.Flush();
                    fs.Close();*/

                    name += dr[1].ToString();
                    char[] deletchar = { '.', 'j', 'p', 'g' };
                    name = name.Trim(deletchar);
                    name += " ";
                    time += dr[4].ToString(); time += ".";
                    showImageInfo(name, index, time);
                    showImage(index, ex);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            updateimages();
            imagesPrice();
        }
       


        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {      
                //当没有数据库图片时候
                Image[] images = { this.Image1, this.Image2, this.Image3, this.Image4, this.Image5, this.Image6, this.Image7, this.Image8 };
                for (int i = 0; i <8; i++){images[i].ImageUrl = "~/img/showlist.jpg";}
                
                //数据有图片的时候
                imagesPrice();
                updateimages();
         
            }
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            string nameinfo=Request.Form["Email"];
            Response.Redirect("NameInfo.aspx?nameinfo="+nameinfo);
        } 
             
    }     
}