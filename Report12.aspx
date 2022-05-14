<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report12.aspx.cs" Inherits="RopeyDVDs.Report12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">Report 12</h2>
                               
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                           
                            <br />
                            <asp:Label ID="labeldate" runat="server" ForeColor="Red" visible="True" 
                                Text="Note: Members who have not borrowed any DVD in the last 31 days with the details of lastest borrowed DVD."></asp:Label>
                            <br />
                  
                     <asp:DropDownList ID="dateoutnew" runat="server" Visible="false"></asp:DropDownList>
                     <br />
                        <asp:Label ID="Label1" runat="server" Text="label" Visible="false"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="label" Visible="false"></asp:Label>
                          
                            
                      
                    </div>
                     <div class="gridview" style="padding:20px" > 
                    <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowDataBound="GVactors_RowDataBound" DataKeyNames="member_id">
                            <Columns>
                                <asp:TemplateField HeaderText="Member_Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_id"  runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_first_name"  runat="server" Text='<%# Eval("member_first_name") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Last Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_last_name"  runat="server" Text='<%# Eval("member_last_name") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Address" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                                       <ItemTemplate>
                                            <asp:Label ID="member_address"  runat="server" Text='<%# Eval("member_address") %>'></asp:Label>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                                                 
                                   <asp:TemplateField HeaderText="Dateout of Last Loan" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                                       <ItemTemplate>
                                           <asp:GridView ID="GVdateout" runat="server" BorderStyle="None"  GridLines="None"  AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                           <ItemTemplate>
                                                                <asp:Label ID="last_date_out"  runat="server" Text='<%# Eval("last_date_out") %>'></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>
                                                  </Columns>
                                           </asp:GridView>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. of days from Last Loan" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                                       <ItemTemplate>
                                           <asp:GridView ID="GVNoofDays" runat="server" BorderStyle="None"  GridLines="None"  AutoGenerateColumns="False"  >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                           <ItemTemplate>
                                                                <asp:Label ID="noofdayssinceLastLoan"  runat="server" Text='<%# Eval("noofdayssinceLastLoan") %>'></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>
                                                  </Columns>
                                           </asp:GridView>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="movie's Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                                       <ItemTemplate>
                                           <asp:GridView ID="GVMovieName" runat="server" BorderStyle="None"  GridLines="None"  AutoGenerateColumns="False"  >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                           <ItemTemplate>
                                                                <asp:Label ID="noofdayssinceLastLoan"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                    </asp:TemplateField>
                                                  </Columns>
                                           </asp:GridView>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                                                               
                            </Columns>

                </asp:GridView>

            </div>
    
 </div>

</asp:Content>