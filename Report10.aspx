<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report10.aspx.cs" Inherits="RopeyDVDs.Report10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">Report 10</h2>
                               
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                           
                            <br />
                            <asp:Label ID="labeldate" runat="server" ForeColor="Red" visible="True" 
                                Text="Note: list of all DVD Copies which are more than a year old and which are not currently on loan"></asp:Label>
                            <br />
                            <asp:Label ID="dvdstockId" runat="server" Text="" Visible="false"></asp:Label>
                          
                            
                      
                    </div>
                     <div class="gridview" style="padding:20px" > 
                    <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="DVD Stock Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="dvd_stock_id"  runat="server" Text='<%# Eval("dvd_stock_id") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DVD Copy No." HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="dvd_copy_no"  runat="server" Text='<%# Eval("dvd_copy_no") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                       <asp:TemplateField HeaderText="Delete Copy" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <ItemTemplate>
                             <asp:HyperLink ID="HyperLink1" 
                               NavigateUrl='<%# String.Format("Report10.aspx?selectedDvdStockId={0}", Eval("dvd_stock_id")) %>'
                                    runat="server">Delete</asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>
                                           
                            </Columns>

                </asp:GridView>

            </div>
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                       <asp:Button  style="height: 30px;width:100px; margin-left: 30px;border-radius: 0px 8px 0px 8px;" ID="btnAllStockDelete" runat="server" ForeColor="Red"  Text="Delete All" OnClick="btnAllStockDelete_Click" />
                </div>
    
 </div>

</asp:Content>