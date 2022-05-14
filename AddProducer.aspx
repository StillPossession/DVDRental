<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProducer.aspx.cs" Inherits="RopeyDVDs.AddProducer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
   
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server" >
    <div class="body-content" >
       <h2 style="color: #4CAF50;">Add Producer</h2>
     
          <table style="width:100%;">
             
                   

                     <tr>
                        <td>
                            <asp:Label ID="producer_id" runat="server" Text="Id"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBproducer_id" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="producer_full_name" runat="server" Text="Full Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBproducer_fname" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" >
                            <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px;" ID="BtnactorSave" runat="server" ForeColor="Green" OnClick="BtnactorSave_Click" Text="Save" />
                            <asp:Button  style="height: 30px;width:60px;margin-left: 30px;border-radius: 0px 8px 0px 8px;" ID="BtnactorUpdate" runat="server" ForeColor="Green" OnClick="BtnactorUpdate_Click" Text="Update" />
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
      
             <div class="gridview"  >  
            <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False" >
                      
                         <Columns >
                             <asp:BoundField DataField="Producer_id" HeaderText="Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">

                             </asp:BoundField>
                             <asp:BoundField DataField="producer_full_name" HeaderText="Full Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                             

                             </asp:BoundField>
                             
                            <asp:TemplateField HeaderText="View" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("producer_id") %>' OnClick="LinkButtonViewActor_Onclick" ForeColor="YellowGreen">View</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                
                         </Columns>
                     
               
             </asp:GridView>
        </div>
        
 </div>
    

</asp:Content>