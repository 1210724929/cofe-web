<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cofe_net.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录咖啡屋</title>
    <link rel="stylesheet" type="text/css" href="../css/Login_style.css"/> 
</head>
<body>
    <form id="form1" runat="server">
    
    
    <div class="login">
        <h2>欢迎来到咖啡屋</h2>
        <div class="login_form">
        
        <div>
            
            <asp:Label ID="Label1" runat="server" Text="用户：" ForeColor="#110806"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" onclick="this.value=''">Admin登录后台</asp:TextBox>
            
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="邮箱：" ForeColor="#110806"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" onclick="this.value=''">Admin密码123456789</asp:TextBox>
        </div>
        <div class="serbit">
            <div class="serbit1">
                <asp:Button ID="Button1" runat="server" Text="注册" 
                    Height="50px" Width="90px" PostBackUrl="~/Regist.aspx" /> 
            </div>
            <div class="serbit2">
                <asp:Button ID="Button2" runat="server" Text="登录" 
                    Height="50px" Width="90px" onclick="Button2_Click" /> 
            </div>
        </div>
        </div>

         <div class="left">
            <asp:Button ID="Button3" runat="server" CssClass="left_button" Height="41px" 
                 Width="48px" onclick="Button3_Click" BackColor="Transparent" 
                  />
        </div>
       
        
    </div>
    </form>
  
</body>
</html>
