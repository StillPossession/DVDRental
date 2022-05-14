<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDVDStock.aspx.cs" Inherits="RopeyDVDs.AddDVDStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/page.css" rel="stylesheet" />
<link href="Styles/main.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<div class="body-content">
    <h2 style="color: #4CAF50">Add DVD Stock</h2>
        
        <table style="width:95%">
                    
                    <tr >
                    <td >
                        <asp:Label ID="dvd_movie_id" runat="server" Text="Id"  Width="332px"></asp:Label></td>
                    <td ><asp:TextBox ID="tBDVDStockId" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox></td>
                    </tr>
                    
                    <tr >
                    <td >
                        <asp:Label ID="dvd_movie_name" runat="server" Text="Movie Name"  Width="332px"></asp:Label></td>
                    <td ><asp:DropDownList ID="DDldvd_movie_name" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList></td>
                    </tr>
                   
                <tr>
                    <td>
                        <asp:Label ID="DVDcopyNumber" runat="server" Text="Copy No"  Width="332px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBDVDcopyNumber" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                    </td>
                </tr>

                    
                   

                    

                <tr>
                    <td>
                        <asp:Label ID="dvd_price" runat="server" Text="Price"  Width="332px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBdvd_price" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                    </td>
                </tr>
                    
                   
                    <tr>
                    <td>
                        <asp:Label ID="date_Added" runat="server" Text="Date Added" Visible="false" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tBdate_Added" Visible="false" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px" ForeColor="#999999"></asp:TextBox>
                        
                            
                    </td>
                    </tr>

                        
                    <tr>
                        <td>
                                <asp:Label  ID="dvd_is_loaned" runat="server" style="position:center" Text="is Loaned" Visible="false"></asp:Label>
                                <asp:CheckBox ID="cBdvd_is_loaned"  Style="margin-left: 30px;position:center" runat="server" visible="false"/>
                        </td>
                           
                    </tr>

                    

                    
                <tr>
                    <td colspan="2" >
                        <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px;" ID="BtnactorSave" runat="server" ForeColor="Green" OnClick="BtnactorSave_Click" Text="Save" />
                        
                        <asp:Button style="height: 30px;width:60px; margin-left: 30px;border-radius: 0px 8px 0px 8px;" ID="btnactorclear" runat="server" ForeColor="#ff7f73" OnClick="btnactorclear_Click" Text="Clear" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblSuccessMessageActors" runat="server" ForeColor="#776464" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblErrorMessageActors" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
                            
             
                <div class="gridview">  
                        
                   
                     
                         
        <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False">
                      
                        <Columns >
                            <asp:BoundField DataField="dvd_stock_id" HeaderText="DVD Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                         

                         
                            </asp:BoundField>
                            <asp:BoundField DataField="movie_name" HeaderText="Movie" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                    
                            </asp:BoundField>
                            <asp:BoundField DataField="is_age_restricted" HeaderText="Is_Age_Restricted" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                      
                            </asp:BoundField>
                            <asp:BoundField DataField="dvd_copy_no" HeaderText="Copy No" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                            
                            </asp:BoundField>
                            <asp:BoundField DataField="is_loaned" HeaderText="is loaned" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                         
                            </asp:BoundField>
                            <asp:BoundField DataField="dvd_price" HeaderText="Price(Rs)" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                        
                            </asp:BoundField>
                            <asp:BoundField DataField="date_added" HeaderText="Date Added" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >
                    
                            </asp:BoundField>
                            <asp:BoundField DataField="movie_id" HeaderText="Movie Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50" >

                      
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Issue DVD" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  ">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" 
                            NavigateUrl='<%# String.Format("Loans.aspx?movieid={0}&copyno={1}&isAgeRestricted={2}", Eval("movie_id"), Eval("dvd_copy_no"), Eval("is_age_restricted")) %>'
                                runat="server" Visible='<%# Eval("is_loaned").ToString() == "False" ? true : false %>'>Issue DVD</asp:HyperLink>
                            <%-- <asp:LinkButton ID="IssueSelectBtn" runat="server" CssClass="issue_btn" CommandName="select" Visible='<%# Eval("is_loaned").ToString() == "False" ? true : false %>'>Issue DVD</asp:LinkButton>    --%>
                            <asp:Label ID="NoDVDLbl" runat="server" Text="Rented" Visible='<%# Eval("is_loaned").ToString() == "True" ? true : false %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             
                          
                
                        </Columns>
                     
               
            </asp:GridView>
    </div>

         
    
 
   

         
</div>

</asp:Content>