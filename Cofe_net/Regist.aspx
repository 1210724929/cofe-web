<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regist.aspx.cs" Inherits="Cofe_net.Regist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>欢迎入住咖啡屋</title>
   <link rel="stylesheet" type="text/css" href="../css/Regist_style.css"/> 
</head>
<body>
    <form id="form1" runat="server"> 
    <div id="body">
       <div class="right">
           <asp:Button ID="Button3" runat="server" 
                CssClass="right_top" Height="41px" Width="41px" BackColor="Transparent" 
               onclick="Button3_Click" />
        </div>
        <div class="regist">
            
            <div>
                <p>你的姓名：<asp:TextBox ID="TextBox1" runat="server" onclick="this.value=''">10个字符以内</asp:TextBox></p>
                
            </div>
            <div>
                <p>你的性别：<asp:TextBox ID="TextBox2" runat="server" onclick="this.value=''">一个字符</asp:TextBox></p>
                
            </div>
            <div>
                <p>你的年龄：<asp:TextBox ID="TextBox3" runat="server" onclick="this.value=''">请输入一个整数</asp:TextBox></p>
                
            </div>
            <div>
                 <p>你的昵称：<asp:TextBox ID="TextBox4" runat="server" onclick="this.value=''">10个字符以内</asp:TextBox></p>
                
            </div>
            <div>
                 <p>你的邮箱：<asp:TextBox ID="TextBox5" runat="server" onclick="this.value=''">如：12345678911@qq.con</asp:TextBox></p>            
            </div>                 
            <div class="regist_submit">
                <asp:Button ID="Button1" runat="server" Text="注册" Font-Bold="True" 
                    Font-Size="Medium" Height="40px" Width="100px" BorderStyle="None" 
                    onclick="Button1_Click" />              
                
            </div>
            <div class="regist_submit">
                <asp:Button ID="Button2" runat="server"
                    Font-Bold="True"     Text="重置" Font-Size="Medium" Height="40px" 
                    Width="100px" BorderStyle="None" onclick="Button2_Click" />
             </div>
            
            
        </div>
    </div>
    </form>
</body>
</html>
