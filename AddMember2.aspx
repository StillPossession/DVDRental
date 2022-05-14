<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember2.aspx.cs" Inherits="RopeyDVDs.AddMember2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">View Member</h2>
     
       
          
             
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
                             
                         </Columns>
                     
               
             </asp:GridView>
        </div>
    </div>
 

</asp:Content>