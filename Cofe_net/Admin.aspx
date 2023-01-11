<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Cofe_net.Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="../css/Admin_style.css"/> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">              
        <div class="left">
            <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows" 
                onselectednodechanged="TreeView1_SelectedNodeChanged">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <Nodes>
                <asp:TreeNode Text="Admin管理" Value="Admin">
                    <asp:TreeNode Target="_parent" Text="用户注册表信息" Value="用户注册表信息"></asp:TreeNode>
                    <asp:TreeNode Text="商品展示页面图片信息" Value="商品展示页面图片信息"></asp:TreeNode>
                    <asp:TreeNode Text="商品描述信息" Value="商品描述信息"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="登录页面管理" Value="登录页面管理"></asp:TreeNode>
                <asp:TreeNode Text="注册页面管理" Value="注册页面管理"></asp:TreeNode>
            </Nodes>
            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
        </div>         
        <div class="right">
        <asp:Panel ID="Panel1" runat="server">
            <div class="right_1">
            <h1>用户注册信息表</h1>

            <asp:DataList ID="DataList2" runat="server" BorderColor="Black" CellPadding="4" 
                    CellSpacing="1" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                    GridLines="Horizontal" Height="112px" Width="659px">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderTemplate>
                         <table>                           
                            <tr>
                                <td style="width:130px;">姓名</td>
                                <td style="width:150px;">性别</td>
                                <td style="width:150px;">年龄</td>
                                <td style="width:150px;">昵称</td>
                                <td style="width:150px;">邮箱</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate> 
                          <table>
                            <tr>
                                <td style="width:150px;">
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name", "{0}") %>' />
                                </td>
                                <td style="width:150px;">
                                    <asp:Label ID="SexLabel" runat="server" Text='<%# Eval("Sex", "{0}") %>' />
                                </td>
                                <td style="width:150px;">
                                    <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age", "{0:N}") %>' />
                                </td>
                                <td style="width:150px;">
                                    <asp:Label ID="NickNameLabel" runat="server" Text='<%# Eval("NickName", "{0}") %>' />
                                </td>
                                <td style="width:150px;">
                                     <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email", "{0}") %>' />
                                </td>
                            </tr>
                        </table>                                         
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:registConnectionString %>" 
                SelectCommand="SELECT * FROM [client_regist]"></asp:SqlDataSource>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server">               
            <div class="right_2">
                <h2>导入图片到数据库</h2>
                文件序号<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>                
                选择文件<asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="导入" />
                
                <br />
                
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="清空图片" />
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="删除(行)" />
                <asp:TextBox ID="TextBox2" runat="server" Width="33px" Height="26px"></asp:TextBox>
                <br />
                <asp:ListBox ID="ListBox1" runat="server" Height="155px" Width="580px" 
                    AutoPostBack="True">
                </asp:ListBox>
                
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">          
            <table class="style1">
                <tr>
                    <td class="style3">
                        商品编号</td>
                    <td class="style3">
                        商品图片</td>
                    <td class="style3">
                        商品价格</td>
                    <td class="style4">
                        商品描述</td>
                    <td class="style3">
                        信息核对
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox11" runat="server" 
                            TextMode="MultiLine" CssClass="textinfo"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button5" runat="server" Text="确定" onclick="Button5_Click" />                    
                        <asp:Button ID="Button6" runat="server" Text="修改" onclick="Button6_Click" />
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image2" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button7" runat="server" Text="确定" onclick="Button7_Click" />
                        <asp:Button ID="Button8" runat="server" Text="修改" onclick="Button8_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image3" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox13" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button9" runat="server" Text="确定" onclick="Button9_Click" />
                        <asp:Button ID="Button10" runat="server" Text="修改" onclick="Button10_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image4" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox14" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button11" runat="server" Text="确定" onclick="Button11_Click" />
                        <asp:Button ID="Button12" runat="server" Text="修改" onclick="Button12_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image5" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox15" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button13" runat="server" Text="确定" onclick="Button13_Click" />
                        <asp:Button ID="Button14" runat="server" Text="修改" onclick="Button14_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image6" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox16" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button15" runat="server" Text="确定" onclick="Button15_Click" />
                        <asp:Button ID="Button16" runat="server" Text="修改" onclick="Button16_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image7" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox17" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button17" runat="server" Text="确定" onclick="Button17_Click" />
                        <asp:Button ID="Button18" runat="server" Text="修改" onclick="Button18_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="Image8" runat="server" CssClass="imgSize" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server" Width="90px"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox18" runat="server" CssClass="textinfo" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button19" runat="server" Text="确定" onclick="Button19_Click" />
                        <asp:Button ID="Button20" runat="server" Text="修改" onclick="Button20_Click" />
                    </td>
                </tr>
            </table>
         </asp:Panel>

            <div class="right_3">
                <asp:Button ID="Button2" runat="server"  Text="导入成功，跳转主页" 
                    onclick="Button2_Click" />
                <br />
               
                
               
                <br />
                
            </div>
        </div>
        
    
     </div>
    </form>
</body>
</html>
