<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report13.aspx.cs" Inherits="RopeyDVDs.Report13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50">Report 13</h2>
                               
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                           
                            <br />
                            <asp:Label ID="labeldate" runat="server" ForeColor="Red" visible="True" 
                                Text="Note: displaying a list of all DVD titles in the shop where no copy of the title has been loaned in the last 31 days"></asp:Label>
                            <br />
                          
                            
                      
                    </div>
                     <div class="gridview" style="padding:20px" > 
                    <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="DVD Copy Number" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50">
                                       <ItemTemplate>
                                            <asp:Label ID="dvd_copy_no"  runat="server" Text='<%# Eval("dvd_copy_no") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Movie's Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50">
                                       <ItemTemplate>
                                            <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                  
                            </Columns>

                </asp:GridView>

            </div>
    
 </div>

</asp:Content>