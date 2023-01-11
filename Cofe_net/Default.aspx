<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cofe_net.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>咖啡屋</title>
    <link rel="stylesheet" type="text/css" href="../css/Default_style.css"/> 
    <style type="text/css">
        *{margin:0px;padding:0px;}
        .clear{display: block;overflow: hidden;}
        ul{list-style: none;}
        
         .button{font-size:15px;outline:none;}
        .button:hover{cursor: pointer;border-style:outset;color:#f5ea01;}
        .menu_section .button_nameinfo{text-decoration:underline;color: #99930d;outline:none;}
        .menu_section .button_nameinfo:hover{cursor: pointer;border-style:outset;color:#f5ea01}
        
        .body{width:1000px;margin:0 auto;background:url(img/default6.jpg);}
        .top{height:200px;background:;}
        #templatemo_menu_panel{width: 1000px;margin: 0 auto;}
        .menu_left{height: 200px;width: 200px; overflow: hidden;float: left;transition: all 4s ease-in-out;border-radius: 50%;border: 2px solid #A7A7A7;}
        .menu_left img{width: 200px;height: 200px;transition: all 4s;border-radius: 50%;}
        .menu_left img:hover{transform:scale(1.2,1.2);}
        .menu_left:hover{transform:rotate(25deg); cursor: pointer;  }

        #templatemo_menu_panel .menu_section{height:200px;width: 726px;float: left;padding: 25px 0 0 30px;background: url();}
        .menu_section ul li{height:45px;width: 200px;margin: 30px 22px 10px 10px;background: url() no-repeat;border-bottom-right-radius:50px; border-top-right-radius:50px;
	        float: left;display: none;} 
        .menu_section ul li a{display: block;height:45px;width: 200px;font-size: 14px; text-align: center;line-height: 45px;color: #99930d;}
        .menu_section ul  a:hover, .menu_section ul .current{color:#f5ea01; }
        
        #templatemo_menu_panel:hover .display_hid{opacity:0.6;display:none;}
        #templatemo_menu_panel:hover  ul li{display: block;}
        
        .nav{height:80px;background:;}
        .nav ul li{width:100px;height:50px;float:right;margin-top:50px;}
        .nav ul li:hover{cursor: pointer;}
       
        .showlist{margin:0 0 0 5px;}
        .showlist .title{height: 40px;background: url() bottom left no-repeat;
				line-height: 40px;margin:0 29px 0 20px;}
		.showlist .title h2{float: left;font-size: 16px;font-family: 微软雅黑;color:#0c0000;}
		.showlist .title a{display: block;float: right;color:  #1f120a;font-size: 14px;}
		.showlist .title a:hover{text-decoration: underline;color:#e3daf5;}
        
        .showlist{width:1000px;}
        .showlist ul{float:left;}
        .showlist ul li img{display: block;height: 210px;width: 210px;margin: 10px auto;border: none;}
		.showlist ul li{width: 246px;height: 302px;float: left;border: 1px solid #E1E1E1;}
		.showlist ul li a:hover{text-decoration: underline;cursor: pointer;color:#e7d6f4;}
        .showlist ul li p{color: #000000;width: 210px;height: 23px;margin: 0 auto;}
        
        .fotter{height:48px;background:;}
        .fotter{color: #3f3b48;text-align: center;}
		.fotter a{color: #686572;font-size: 12px;}
		.fotter a:hover{text-decoration: underline;}
    </style> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
        <div class="top clear">
            <div id="templatemo_menu_panel" class="clear">
		        <div class="menu_left">
			        <img src="img/head_left.jpg" alt=""/>
		        </div>
	        <div class="menu_section clear">
                <div class="display_hid">
                    <p>&nbsp;&nbsp;两个人的咖啡座，我是一个人坐，两个人的世界，我是一个人在独舞。牵挂，思恋，在深深的怀想中冉冉显现，此时，此情，此景，我也无处收回。
                    </p>
                    <p>&nbsp;&nbsp;咖啡缭绕的香雾，缱绻了多少情人的心扉，氤氲了多少爱恋缠绵。甚至连空气，恣意张扬挥洒尘埃里的浪漫气息。
                    </p>
                    <p>&nbsp;&nbsp;一滴馨香入口，却是世间百态。淡淡回味却不及黄莲还未有蜜糖甘。各中滋味却是蕴藏无穷。
                    </p>
                    <p>&nbsp;&nbsp;静溢的空间，一杯香醇的咖啡，当时间一点点的过去，杯中的咖啡即将喝完，最初的苦涩味已经悄然消失了，只留下了那弥漫在小屋子里的咖啡醇香味……
                    </p>
                </div>              
	            <ul class="clear">               
	                <li><a href="#"  class="current">首页</a></li>
	                <li><a href="#">
                        <asp:Button ID="Button5" runat="server" Text="个人中心" onclick="Button5_Click"
                             BorderStyle="None" BackColor="Transparent" 
                            CssClass="button_nameinfo" Height="50px" Width="100px" /></a></li>
	                <li><a href="#"><asp:Button ID="Button2" runat="server" Text="后台管理" onclick="Button2_Click"
                             BorderStyle="None" BackColor="Transparent" 
                            CssClass="button_nameinfo" Height="50px" Width="100px"/></a></li>            
	                <li><a href="#"><asp:Button ID="Button4" runat="server" Text="登录咖啡屋" onclick="Button4_Click" 
                             BorderStyle="None" BackColor="Transparent" 
                            CssClass="button_nameinfo" Height="50px" Width="100px"/></a></li>  
	                <li><a href="#"><asp:Button ID="Button3" runat="server" Text="注册咖啡人儿" onclick="Button3_Click" 
                             BorderStyle="None" BackColor="Transparent" 
                            CssClass="button_nameinfo" Height="50px" Width="100px"/></a></li> 
	                <li><a href="#" class="last"><asp:Button ID="Button1" runat="server" Text="数据更新" onclick="Button1_Click" 
                             BorderStyle="None" BackColor="Transparent" 
                            CssClass="button_nameinfo" Height="50px" Width="100px"/></a></li>                     
	            </ul> 
	        </div>
	        </div>
        </div>
        <div class="nav clear">
           
            <ul class="clear">
                <li><asp:Button ID="Button9" runat="server" Text="更多应用>>"  
                        BackColor="Transparent" BorderStyle="None" Height="48px" Width="95px" 
                        CssClass="button"/></li>
                <li><asp:Button ID="Button8" runat="server" Text="咖啡论坛"  
                        BackColor="Transparent" BorderStyle="None" Height="48px" Width="97px" 
                        CssClass="button"/></li>
                <li><asp:Button ID="Button7" runat="server" Text="新品上架" 
                        BackColor="Transparent" BorderStyle="None" Height="47px" Width="98px" 
                        CssClass="button" /></li>
                <li><asp:Button ID="Button6" runat="server" Text="精品推荐" 
                        BackColor="Transparent" BorderStyle="None" CssClass="button" Height="48px" 
                        Width="99px" /></li>         
            </ul>
        </div>
        <div class="showlist clear">
            <div class="title clear ">
					<h2>精品推荐</h2>
					<a href="">更多&gt;&gt;</a>
				</div>
          <ul class="clear">
			<li>
				<a href="Showdetail/Showdetail1.aspx">
                    <asp:Image ID="Image1" runat="server" />
                </a>
				<p><a href="Showdetail/Showdetail1.aspx">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label17" runat="server"></asp:Label></a>     
                </p>
                <p>
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href="Showdetail/Showdetail2.aspx">
                <asp:Image ID="Image2" runat="server" />
                </a>
				<p><a href="Showdetail/Showdetail2.aspx">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label18" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label10" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href="Showdetail/Showdetail3.aspx"><asp:Image ID="Image3" runat="server" /></a>
				<p><a href="Showdetail/Showdetail3.aspx">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label19" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href="Showdetail/Showdetail4.aspx"><asp:Image ID="Image4" runat="server" /></a>
				<p><a href="Showdetail/Showdetail4.aspx">
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label20" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label12" runat="server"></asp:Label>
                </p>
			</li>
		</ul>
        </div>
         <div class="showlist clear">
            <div class="title clear ">
				<h2>新品上架</h2>
				<a href="">更多&gt;&gt;</a>
			</div>
          <ul class="clear">
			<li>
				<a href="Showdetail/Showdetail4.aspx">
                <asp:Image ID="Image5" runat="server" />
                </a>
				<p><a href="Showdetail/Showdetail4.aspx">
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label21" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label13" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href="">
                <asp:Image ID="Image6" runat="server" />
                </a>
				<p><a>
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label22" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label14" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href=""><asp:Image ID="Image7" runat="server" /></a>
				<p><a>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label23" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label15" runat="server"></asp:Label>
                </p>
			</li>
		</ul>

         <ul class="clear">
			<li>
				<a href=""><asp:Image ID="Image8" runat="server" /></a>
				<p><a>
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                    </a></p>
                <p>
                    <a href="#"><asp:Label ID="Label24" runat="server"></asp:Label></a>     
                </p>
				<p>
                    <asp:Label ID="Label16" runat="server"></asp:Label>
                </p>
			</li>
		</ul>
        </div>

        <div class="fotter">
            <p>售后服务 1210724929</p>
			<p>Design by <a href="#">sichuanligong.com</a></p>
        </div>
    </div>
     
            
    </form>
</body>
</html>
