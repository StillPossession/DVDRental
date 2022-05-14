<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report11.aspx.cs" Inherits="RopeyDVDs.Report11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content"> 
        <h2 style="color: #4CAF50  ;">Report 11</h2>
                    
                  
                    <div style="width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                      
                      <br />
                        <asp:Label ID="labelfullname" runat="server" Text="Showing Total no. of copies on loan for a particular day" Visible="true" ForeColor="red"></asp:Label>
                       <br /> 
                    </div>
             
              

               

             

               
                 <div class="gridview" style="padding:20px" > 
                <asp:GridView ID="GVactors" style="width:100%" CssClass="table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Date Out" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="date_out"  runat="server" Text='<%# Eval("date_out") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Copies" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                               <ItemTemplate>
                                    <asp:Label ID="TotalCopies"  runat="server" Text='<%# Eval("TotalCopies") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                           
                        <asp:TemplateField HeaderText="View Details" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                            <ItemTemplate>
                             <asp:HyperLink ID="HyperLink1" 
                               NavigateUrl='<%# String.Format("Report11B.aspx?selectedDateOut={0}", Eval("date_out")) %>'
                                    runat="server">View More</asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>
                        
                     


                        
                    </Columns>

                </asp:GridView>

                
            </div>
     
   
</div>
</asp:Content>