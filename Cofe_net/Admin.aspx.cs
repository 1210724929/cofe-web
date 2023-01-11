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
using System.Configuration;


namespace Cofe_net
{
    public partial class Admin : System.Web.UI.Page
    {      
        //获得数据库连接地址
        protected string getConnectionString() {
            return WebConfigurationManager.ConnectionStrings["registConnectionString"].ConnectionString;
        }
        //私有函数
        private void ExcuteNonQueryCommand(string excuteString,string connectionString) {
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                SqlCommand command = new SqlCommand(excuteString,connection);
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }
        }
        

        //显示商品信息函数__在服务器创建文件夹
        private void CreatImg()
        {
            using (SqlConnection objConn = new SqlConnection(getConnectionString()))
            {
                objConn.Open();
                string sql = "select * from Images";
                SqlCommand cmd = new SqlCommand(sql, objConn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    byte[] bytes = (byte[])dr[3];
                    string index = dr[0].ToString();
                    string ex = dr[2].ToString();//.TrimStart('.')去掉.
                    FileStream fs = new FileStream(Server.MapPath(@"./img/" + index + ex), FileMode.Create, FileAccess.Write);
                    fs.Write(bytes, 0, (int)bytes.Length);
                    fs.Flush();
                    fs.Close();
                }
            }
        }
        //图片，序号
        private void showImage(string index, string ex)
        {
            Image[] images = { this.Image1, this.Image2, this.Image3, this.Image4, this.Image5, this.Image6, this.Image7, this.Image8 };
            Label[] labelsid = { this.Label1, this.Label2, this.Label3, this.Label4, this.Label5, this.Label6, this.Label7, this.Label8 };
            for (int i = 1; i <= int.Parse(index); i++)
            {
                images[i - 1].ImageUrl = @"~/img/" + i + ex;
                labelsid[i - 1].Text = i.ToString();
            }
        }
        //展示图片和序号
      private void showImgDeatilPrice() {
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.Text;
                com.CommandText = "select * from Images";
                con.Open();
                SqlDataReader ds = com.ExecuteReader();
                
                string index = "";
                string ex = "";               
                while (ds.Read())
                {
                    index = ds[0].ToString();
                    ex = ds[2].ToString();//.TrimStart('.')去掉.
                    showImage(index, ex);
                }
                con.Close();               
            }
        }
        //价格、介绍
      private void priceInfo(string index,string price,string info) {
          string[] Price = price.Split('$');
          string[] Info = info.Split('?');
          int Index = int.Parse(index);
          TextBox[] textPrice = { this.TextBox3, this.TextBox4, this.TextBox5, this.TextBox6, this.TextBox7, this.TextBox8, this.TextBox9, this.TextBox10 };
          TextBox[] textInfo = { this.TextBox11, this.TextBox12, this.TextBox13, this.TextBox14, this.TextBox15, this.TextBox16, this.TextBox17, this.TextBox18 };

          for (int i = 0; i < Index;i++ ) {
              textPrice[i].Text = Price[i];
              textInfo[i].Text = Info[i];
          }
      }
        //展示图片名字、时间，和价格、介绍
        private void showInfo() {           
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.Text;
                com.CommandText = "select * from Images";
                con.Open();
                SqlDataReader ds = com.ExecuteReader();
                string srt = "";                
                ListBox1.Items.Clear();
                while (ds.Read())
                {
                    srt = string.Format("导入图片{0}：" + " " + "{1}" + " " + "{2}", ds[0], ds[1], ds[4]);
                    ListBox1.Items.Add(srt);                                     
               }
                con.Close();
            }
           
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.Text;
                com.CommandText = "select * from PriceInfo";
                con.Open();
                SqlDataReader ds = com.ExecuteReader();

                string index = "";
                string price = "";
                string info = "";
                while (ds.Read())
                {
                    index = ds[0].ToString();
                    price += ds[1].ToString(); price += "$";
                    info += ds[2].ToString(); info +="?";
                    priceInfo(index,price,info);
                }
                con.Close();
            }
        }
       /* //datalist展示商品
        private void showInfo()
        {
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.Text;
                com.CommandText = "select * from Images";
                con.Open();
                SqlDataReader ds = com.ExecuteReader();
                string srt = "";
                ListBox1.Items.Clear();
                while (ds.Read())
                {
                    srt = string.Format("导入图片{0}：" + " " + "{1}" + " " + "{2}", ds[0], ds[1], ds[4]);
                    ListBox1.Items.Add(srt);
                }
            }
        }*/
         
        //图片保存到数据库
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" && !FileUpload1.HasFile)
            {               
                Response.Write("<script>alert('请先选择文件和写入编号');</script>");
                return;
            }
            else {
                HttpPostedFile file = FileUpload1.PostedFile;
                string filenname = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string extension = Path.GetExtension(filenname);
                //用数组保存文件
                byte[] imagetype = new byte[file.ContentLength];
                file.InputStream.Read(imagetype,0,file.ContentLength);
                if((extension==".jpg")||(extension==".png")||(extension==".gif")||extension==".bmp"){
                    using (SqlConnection connection = new SqlConnection(getConnectionString())) {
                        connection.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = connection;
                        string commandText = "INSERT INTO Images values(@Rollno,@name,@img,@image,getdate())";
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = commandText;
                        cmd.Parameters.Add("@image", SqlDbType.VarBinary);
                        cmd.Parameters["@image"].Value = imagetype;
                        cmd.Parameters.Add("@Rollno",SqlDbType.VarChar).Value = TextBox1.Text;
                        cmd.Parameters.Add("@img", SqlDbType.VarChar).Value = extension;
                        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = filenname;
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        connection.Close();                      
                        Response.Write("<script>alert('导入成功');</script>");

                        CreatImg();
                        showInfo();
                        showImgDeatilPrice();
                        
                    }
                }
                else{
                        Response.Write("<script>alert('导入失败');</script>");       
                    }
            }
        }
        //跳转主页
        protected void Button2_Click(object sender, EventArgs e)
        {
          Response.Redirect("Default.aspx?");
        }
        //清空img数据、及其数据库
        //删除文件夹图片
        private void DeleteDiskFile(string ImageUrl)
        {
            try
            {
                string FilePath = Server.MapPath(ImageUrl);//转换物理路径        
                File.Delete(FilePath);//执行IO文件删除,需引入命名空间System.IO;            
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }
        //清空功能
        protected void Button3_Click(object sender, EventArgs e)
        {
            int count = ListBox1.Items.Count;
            int index = 0;
            for (index = 0; index <= count; index++) { DeleteDiskFile(@"./img/" + index +".jpg"); }
            if (index >= count) { 
                ListBox1.Items.Clear();
                string excuteString = "DELETE FROM Images";
                ExcuteNonQueryCommand(excuteString, getConnectionString());
                string excuteString2 = "DELETE FROM PriceInfo";
                ExcuteNonQueryCommand(excuteString2, getConnectionString());
            
                showInfo();
                showImgDeatilPrice();     
            }      
        }

        //删除指定图片信息
        protected void Button4_Click(object sender, EventArgs e)
        {
            int index = ListBox1.SelectedIndex + 1;
            if (index > 0) { TextBox2.Text = index.ToString(); }
            if (TextBox2.Text != "")
            {
                string excuteString = "DELETE FROM Images WHERE Roll_no='" + TextBox2.Text+"'";
                string priceInfo = "DELETE FROM PriceInfo WHERE imgId='" + TextBox2.Text + "'";
                DeleteDiskFile(@"./img/" + index + ".jpg");
                ExcuteNonQueryCommand(excuteString,getConnectionString());
                ExcuteNonQueryCommand(priceInfo,getConnectionString());
                Response.Write("<script>alert('删除成功');</script>");

                CreatImg();
                showInfo();
                showImgDeatilPrice();
            }
            else {
                Response.Write("<script>alert('输入要删除的行数');</script>");
            }
        }


        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            if (TreeView1.SelectedValue == "用户注册表信息") {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
            }
            else if (TreeView1.SelectedValue == "商品展示页面图片信息")
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                Panel3.Visible = false;
            }
            else {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Response.Write("<script>alert('你将是管理人员进行管理数据');</script>");
                 showInfo(); 
                 showImgDeatilPrice();

                 Panel1.Visible = false;
                 Panel2.Visible = true;
                 Panel3.Visible = false;
            }
            
        }

        //对所有商品录入价格和详细信息
        private void inertimgPrice(string commding,string mode) { 
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {                                
               
                    con.Open();
                    try
                    {
                        SqlCommand com = new SqlCommand(commding, con);
                        int i = com.ExecuteNonQuery();

                        if (mode == "insert")
                        {
                            if (i > 0) { Response.Write("<script>alert('咖啡信息录入成功！');</script>"); }
                            else { Response.Write("<script>alert('咖啡信息录入失败！');</script>"); }
                        }
                        else
                        {
                            if (i > 0) { Response.Write("<script>alert('咖啡信息修改成功！');</script>"); }
                            else { Response.Write("<script>alert('咖啡信息修改失败！');</script>"); }
                        }
                    }

                    catch (Exception ex)
                    {
                        string str = "违法操作！" + ex.Message;
                        Response.Write("<script>alert(str);</script>");
                    }
                
            }      
        }
       
        //每一组的确认 修改
        protected void Button5_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label1.Text + "','" + TextBox3.Text + "','" + TextBox11.Text + "')";
            inertimgPrice(str,"insert");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox3.Text + "',info='" + TextBox11.Text + "'WHERE imgId='"+Label1.Text+"'";
            inertimgPrice(str, "update");
        }
        //2
        protected void Button7_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label2.Text + "','" + TextBox4.Text + "','" + TextBox12.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox4.Text + "',info='" + TextBox12.Text + "'WHERE imgId='" + Label2.Text + "'";
            inertimgPrice(str, "update");
        }
        //3
        protected void Button9_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label3.Text + "','" + TextBox5.Text + "','" + TextBox13.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox5.Text + "',info='" + TextBox13.Text + "'WHERE imgId='" + Label3.Text + "'";
            inertimgPrice(str, "update");
        }
        //4
        protected void Button11_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label4.Text + "','" + TextBox6.Text + "','" + TextBox14.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox6.Text + "',info='" + TextBox14.Text + "'WHERE imgId='" + Label4.Text + "'";
            inertimgPrice(str, "update");
        }
        //5
        protected void Button13_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label5.Text + "','" + TextBox7.Text + "','" + TextBox15.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox7.Text + "',info='" + TextBox15.Text + "'WHERE imgId='" + Label5.Text + "'";
            inertimgPrice(str, "update");
        }
        //6
        protected void Button15_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label6.Text + "','" + TextBox8.Text + "','" + TextBox16.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox8.Text + "',info='" + TextBox16.Text + "'WHERE imgId='" + Label6.Text + "'";
            inertimgPrice(str, "update");
        }
        //7
        protected void Button17_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label7.Text + "','" + TextBox9.Text + "','" + TextBox17.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox9.Text + "',info='" + TextBox17.Text + "'WHERE imgId='" + Label7.Text + "'";
            inertimgPrice(str, "update");
        }
        //8
        protected void Button19_Click(object sender, EventArgs e)
        {
            string str = "INSERT INTO PriceInfo(imgID,price,info) VALUES('" + Label8.Text + "','" + TextBox10.Text + "','" + TextBox18.Text + "')";
            inertimgPrice(str, "insert");
        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            string str = "UPDATE PriceInfo SET price='" + TextBox10.Text + "',info='" + TextBox18.Text + "'WHERE imgId='" + Label8.Text + "'";
            inertimgPrice(str, "update");
        }
    }
}