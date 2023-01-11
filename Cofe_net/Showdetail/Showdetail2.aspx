<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showdetail2.aspx.cs" Inherits="Cofe_net.Showdetail2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商品介绍</title>
   <link rel="stylesheet" type="text/css" href="../css/Showdetail_style.css"/> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="clear">
        <div class="center clear">	
	
	    <div class="center_head">		   
            
			  <h1><asp:Label ID="Label2" runat="server"></asp:Label></h1>	  
	    </div>
	    <div class="center_left">
           	<asp:Image ID="Image1" runat="server" BorderStyle="None" Width="400px" />	   
            <p>
            <asp:Label ID="Label3" runat="server"></asp:Label>
            </p>
             
	    </div>
            
	    <div class="center_right">
		    <p>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </p>
	    </div>
        <div class="center_foot">
            <asp:Button ID="Button1" runat="server" BackColor="Transparent" 
                BorderStyle="None" Height="41px" Width="48px" 
                CssClass="center_foot_button" onclick="Button1_Click" />
        </div>
</div>
    </div>
    </form>
</body>
</html>
