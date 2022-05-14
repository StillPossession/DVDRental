<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report3.aspx.cs" Inherits="RopeyDVDs.Report3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">Report 3</h2>
                    
                  
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
                         <asp:TemplateField HeaderText="Copy No." HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("copy_num") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Movie_name"  runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Movie Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("movie_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                 <asp:label id="actors"  runat="server" text='<%# Eval("movie_name") %>'></asp:label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>

                </asp:GridView>

                
            </div>
     
   
</div>
</asp:Content>
