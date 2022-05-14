<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddActors.aspx.cs" Inherits="RopeyDVDs.AddActors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Add Actors
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
<link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server" >
<div class="body-content">
    <h2 style="color: #4CAF50;">Add Actors</h2>

    
    
<div class="table-center" style="
justify-content:center;
display:flex;">
    <table style="width:100%">
             
                   
                <tr>
                    <td>
                        <asp:Label ID="actor_id" runat="server" Visible="true" Text="Id" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBactor_id" runat="server" Visible="true" Style="border-radius: 0px 8px 0px 8px;" Width="332px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="actor_first_name" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBactor_fname" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="actor_last_name" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBactor_lname" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                    </td>
                </tr>
                <%--<tr>
                    <td>
                        <asp:Label ID="actor_gender" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLactor_gender" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px" >
                            <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                          
                    </td>
                </tr>--%>
                <tr>
                    <td colspan="2" >
                        <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px; " ID="BtnactorSave" runat="server" ForeColor="Green" OnClick="BtnactorSave_Click" Text="Save" />
                        <asp:Button  style="height: 30px;width:60px;margin-left: 30px;border-radius: 0px 8px 0px 8px; " ID="BtnactorUpdate" runat="server" ForeColor="Green" OnClick="BtnactorUpdate_Click" Text="Update" />
                        <asp:Button  style="height: 30px;width:60px; margin-left: 30px;border-radius: 0px 8px 0px 8px;" ID="btnactorDelete" runat="server" ForeColor="Red" OnClick="btnactorDelete_Click" Text="Delete" />
                        <asp:Button style="height: 30px;width:60px; margin-left: 30px;border-radius: 0px 8px 0px 8px;" ID="btnactorclear" runat="server" ForeColor="#ff7f73" OnClick="btnactorclear_Click" Text="Clear" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblSuccessMessageActors" runat="server" ForeColor="#776464" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblErrorMessageActors" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
           
            
        </table>
</div>
          
    
 
   

        <div class="gridview">  
        <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False" >
                      
                        <Columns >
                            <asp:BoundField DataField="actor_id" HeaderText="Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >

                            </asp:BoundField>
                            <asp:BoundField DataField="actor_first_name" HeaderText="First Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >

                            </asp:BoundField>
                            <asp:BoundField DataField="actor_last_name" HeaderText="Last Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50">

                            </asp:BoundField>
                          <%--  <asp:BoundField DataField="actor_gender" HeaderText="Gender" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                         

                            </asp:BoundField>--%>
                         
                        <asp:TemplateField HeaderText="View" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50">
                            <ItemTemplate >
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("actor_id") %>' OnClick="LinkButtonViewActor_Onclick" ForeColor="YellowGreen" >View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                
                        </Columns>
                     
               
            </asp:GridView>
    </div>
             
</div>
    

</asp:Content>
