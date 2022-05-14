<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="RopeyDVDs.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">Add Member</h2>
     
       
          <table style="width:100%">
             
                       <tr>
                        <td>
                            <asp:Label ID="MemId" runat="server" Text="Id"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBMembersId" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Mem_First_Name" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBMemberFirstName" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Mem_last_Name" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBLastName" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    
                       <tr>
                        <td>
                            <asp:Label ID="Mem_add" runat="server" Text="Address"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBMemAddress" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                        </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Mem_Contact" runat="server" Text="Contact"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBMem_Contact" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="mem_Age" runat="server" Text="Age"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBmem_Age" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>

                       <tr >
                        <td >
                            <asp:Label ID="mems_category" runat="server" Text="Category"></asp:Label></td>
                        <td ><asp:DropDownList ID="DDlmemCategoryF"  runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList></td>
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

             
  
              
             
             
                    <div class="gridview">  
            <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False">
                      
                         <Columns >
                             <asp:BoundField DataField="member_id" HeaderText="Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                             <asp:BoundField DataField="member_first_name" HeaderText="First Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                              <asp:BoundField DataField="member_last_name" HeaderText="Last Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                             
                              </asp:BoundField>
                              <asp:BoundField DataField="member_address" HeaderText="Address" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >


                             </asp:BoundField>
                             <asp:BoundField DataField="member_contact" HeaderText="Contact" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                             <asp:BoundField DataField="member_age" HeaderText="Age" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                             <asp:BoundField DataField="membership_category" HeaderText="Category Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                             
                             

                           
                             
                            <asp:TemplateField HeaderText="View" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("member_id") %>' OnClick="LinkButtonViewActor_Onclick" ForeColor="YellowGreen">View</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                          
                
                         </Columns>
                     
               
             </asp:GridView>
        </div>
    </div>
 

</asp:Content>