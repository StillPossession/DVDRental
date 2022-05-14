<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanHistory.aspx.cs" Inherits="RopeyDVDs.LoanHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">Loan History</h2>
                    
                  
                    <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                      
                        <br />
                        <br />
                        <asp:TextBox ID="SearchBox" runat="server" OnTextChanged="SearchBox_TextChanged"  ></asp:TextBox>
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" Visible="true"  />
                        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" Visible="false"  />
                        <br />
                        <br />
                        <asp:Label ID="labelfullname" runat="server" Text="Search by member's lastname" Visible="true" ForeColor="red"></asp:Label>
                       
                    </div>
             
              

               

             

               
                 <div class="gridview" > 
                <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                         <asp:TemplateField HeaderText="Loan Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="loan_id"  runat="server" Text='<%# Eval("loan_id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Loan Type" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="loan_type"  runat="server" Text='<%# Eval("loan_type") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Movie" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Member" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="member_full_name"  runat="server" Text='<%# Eval("member_full_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Copy No." HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="copy_num"  runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Date Out" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="date_out"  runat="server" Text='<%# Eval("date_out") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Duration" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="duration"  runat="server" Text='<%# Eval("duration") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Due" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="date_due"  runat="server" Text='<%# Eval("date_due") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Date Returned" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="date_returned"  runat="server" Text='<%# Eval("date_returned") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Total Charge" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="total_charge"  runat="server" Text='<%# Eval("total_charge") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                     


                        
                    </Columns>

                </asp:GridView>

                
            </div>
     
   
</div>
</asp:Content>