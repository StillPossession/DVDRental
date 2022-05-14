<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report5.aspx.cs" Inherits="RopeyDVDs.Report5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">Loan Details of Copy</h2>
        
                    
                  
                    <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                         <asp:Label ID="labelfullname" runat="server" Text="Search Movie's details by its Copy Number" Visible="true" ForeColor="red"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Copy No. of Movies" style="font-weight: bold;"></asp:Label>
                        <asp:TextBox ID="SearchBox" runat="server" OnTextChanged="SearchBox_TextChanged"  ></asp:TextBox>
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" Visible="true"  />
                        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" Visible="false"  />
                        <br />
                        <br />
                     
                    </div>
             
               
                 <div class="gridview" > 
                <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False"  >
                    <Columns>
                        <asp:TemplateField HeaderText="Member Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            
                            <ItemTemplate>
                                    <asp:Label ID="Movie_name"  runat="server" Text='<%# Eval("member_full_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                                        
                        <asp:TemplateField HeaderText="Movie Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                 <asp:label id="movie_name"  runat="server" text='<%# Eval("movie_name") %>'></asp:label>
                                </ItemTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                    <asp:Label ID="status"  runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Duration" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                    <asp:Label ID="duration"  runat="server" Text='<%# Eval("duration") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date Out" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                    <asp:Label ID="date_out"  runat="server" Text='<%# Eval("date_out") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date returned" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                    <asp:Label ID="date_returned"  runat="server" Text='<%# Eval("date_returned") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                      <asp:TemplateField HeaderText="Due date" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            
                            <ItemTemplate>
                                    <asp:Label ID="date_due"  runat="server" Text='<%# Eval("date_due") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                      
                        
                    </Columns>

                </asp:GridView>
                      <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                        <asp:Label ID="LabelMessage" runat="server" Text="Please Type Copy Number First" Visible="false"></asp:Label>
                        
                          </div>

                
            </div>
     
   
</div>
</asp:Content>