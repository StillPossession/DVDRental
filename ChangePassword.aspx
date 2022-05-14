<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="RopeyDVDs.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server" >
    <div class="body-content">
       <h2 style="color: rgb(10,110,178);">Change Passsword</h2>

    
    
    <div class="table-center" style="
    justify-content:center;
    display:flex;">
        <table style="width:100%">
             
                   
                    <tr>
                        <td>
                            <asp:Label ID="passwordLabel" runat="server" Text="Old Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox  ID="tBPassword" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="newPWLabel" runat="server" Text="New Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox  ID="tBNewPW" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="RePWLabel" runat="server" Text="Re-Write New Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox  ID="tBreNewPW" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" >
                            <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px; " ID="btnUpdatePw" runat="server" ForeColor="Green"  Text="Update" OnClick="btnUpdatePw_Click" />
                           
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
 </div>   

</asp:Content>
