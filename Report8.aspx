<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report8.aspx.cs" Inherits="RopeyDVDs.Report8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">Report 8</h2>
                               
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                           
                            <br />
                            <asp:Label ID="labeldate" runat="server" ForeColor="Red" visible="True" Text="Note: If Total loans is equal to max. loan available then it is highlighted with red color"></asp:Label>
                            <br />
                          
                            
                      
                    </div>
                     <div class="gridview" style="padding:20px" > 
                    <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowDataBound="GVactors_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Member_Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_id"  runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_name"  runat="server" Text='<%# Eval("member_name") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Category" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="mem_cat_title"  runat="server" Text='<%# Eval("mem_cat_title") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Total dvd on loans" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="total_loans"  runat="server" Text='<%# Eval("total_loans") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Maximum DVD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="max_dvd_loans"  runat="server" Text='<%# Eval("max_dvd_loans") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Review" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="Review"  runat="server" Text='<%# Eval("Review") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                                                               
                            </Columns>

                </asp:GridView>

            </div>
    
 </div>

</asp:Content>