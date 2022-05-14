<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDVDStock2.aspx.cs" Inherits="RopeyDVDs.AddDVDStock2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
<link href="Styles/main.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<div class="body-content">
    <h2 style="color: #4CAF50">View DVD Stock</h2>

           <div class="gridview">  
                        
        <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False">
                      
                        <Columns >
                            <asp:BoundField DataField="dvd_stock_id" HeaderText="DVD Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                         

                         
                            </asp:BoundField>
                            <asp:BoundField DataField="movie_name" HeaderText="Movie" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                    
                            </asp:BoundField>
                            <asp:BoundField DataField="is_age_restricted" HeaderText="Is_Age_Restricted" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                      
                            </asp:BoundField>
                            <asp:BoundField DataField="dvd_copy_no" HeaderText="Copy No" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                            
                            </asp:BoundField>
                            <asp:BoundField DataField="is_loaned" HeaderText="is loaned" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                         
                            </asp:BoundField>
                            <asp:BoundField DataField="dvd_price" HeaderText="Price(Rs)" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                        
                            </asp:BoundField>
                            <asp:BoundField DataField="date_added" HeaderText="Date Added" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                    
                            </asp:BoundField>
                            <asp:BoundField DataField="movie_id" HeaderText="Movie Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >

                      
                            </asp:BoundField>

                         
                        </Columns>
                     
               
            </asp:GridView>
    </div>

         
</div>

</asp:Content>