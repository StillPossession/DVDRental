<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report7.aspx.cs" Inherits="RopeyDVDs.Report7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">Return DVD</h2>
        
                    
                  
                    <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                         
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Copy No. of Movies" style="font-weight: bold;"></asp:Label>
                        <asp:TextBox ID="SearchBox" runat="server" OnTextChanged="SearchBox_TextChanged"  ></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" Visible="true"  />
                        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" Visible="false"  />
                        <br />
                        <asp:Label ID="labelfullname" runat="server" Text="DVD's on Loan" Visible="true" ForeColor="red" style="text-decoration:underline"></asp:Label>
                     
                    </div>
             
               
                 <div class="gridview" > 
                <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False"  >
                    <Columns>
                        <asp:TemplateField HeaderText="Copy Number" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                            
                            <ItemTemplate>
                                    <asp:Label ID="copy_num"  runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>

                                        
                        <asp:TemplateField HeaderText="Movie Name" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                 <asp:label id="movie_name"  runat="server" text='<%# Eval("movie_name") %>'></asp:label>
                                </ItemTemplate>
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Date Due" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                 <asp:label id="date_due"  runat="server" text='<%# Eval("date_due") %>'></asp:label>
                                </ItemTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Return" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                           
                            <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink1" 
                                    NavigateUrl='<%# String.Format("Report7.aspx?movieName={0}&copyNum={1}&dateDue={2}", Eval("movie_name"), Eval("copy_num"), Eval("date_due")) %>'
                                    runat="server">Ok</asp:HyperLink>
                                    
                                </ItemTemplate>
                        </asp:TemplateField>

                         
                           
                                                                         
                    </Columns>

                </asp:GridView>
                      <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                        <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="LabelTotalPenalty" runat="server" Text="" Visible="false"></asp:Label>
                         <br />
                          <br />
                           <asp:Label ID="Labeltotalnooflatedays" runat="server" Text="" Visible="false"></asp:Label>
                       
                       
                        <asp:Label ID="noOfDays" runat="server" Text="" Visible="false"></asp:Label>
                      
                        <asp:Label ID="labelCurrentdate" runat="server" Text="" Visible="false"></asp:Label>
                        
                          </div>

                
            </div>
     
   
</div>
</asp:Content>
