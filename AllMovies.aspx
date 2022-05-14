<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllMovies.aspx.cs" Inherits="RopeyDVDs.AllMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">All Movies</h2>
                    
                  
                    <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                        <asp:CheckBox ID="FilterToDvdShelves" runat="server" Visible="true" AutoPostBack="True" ForeColor="red"  Text="Sort by DVD on Shelves Only" />
                        <br />
                        <br />
                        <asp:TextBox ID="SearchBox" runat="server" OnTextChanged="SearchBox_TextChanged"  ></asp:TextBox>
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" Visible="true"  />
                        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" Visible="false"  />
                        <br />
                        <br />
                        <asp:Label ID="labellastname" runat="server" Text="Search by actor's last name" Visible="true" ForeColor="red"></asp:Label>
                       
                         <asp:CheckBox ID="ShowCopies" runat="server" Visible="false" AutoPostBack="True" ForeColor="red" OnCheckedChanged="ShowCopies_CheckedChanged"  Text="Show no. of copies" />
                         <br />
                         <br />
                         <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" ForeColor="blue"></asp:Label>
                        <br />
                    </div>
             
              

               

             

               
                 <div class="gridview"> 
                <asp:GridView ID="GVactors" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowEditing="GVactors_RowEditing" OnRowCancelingEdit="GVactors_RowCancelingEdit" OnRowDeleting="GVactors_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Movies Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <ItemTemplate>
                                    <asp:Label ID="Movie_id" runat="server" Text='<%# Eval("movie_id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Movie's Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("movie_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Movie_name"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cast" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("actors") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                 <asp:label id="actors"  runat="server" text='<%# Eval("actors") %>'></asp:label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Producer" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("producer_full_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Producers"  runat="server" Text='<%# Eval("producer_full_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Studio" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("studio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Studio"  runat="server" Text='<%# Eval("studio") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Date" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("release_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="release_date"  runat="server" Text='<%# Eval("release_date") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age Restricted" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("is_age_restricted") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="is_age_restricted"  runat="server" Text='<%# Eval("is_age_restricted") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No. of copies" Visible="false" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <ItemTemplate>
                                    <asp:Label ID="no_of_copies"  runat="server" Text='<%# Eval("no_of_copies") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>

                </asp:GridView>

                
            </div>
     
   
</div>
</asp:Content>
