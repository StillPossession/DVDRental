<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMovies.aspx.cs" Inherits="RopeyDVDs.AddMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">

   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    <link href="DatePicker_css/pikaday.css" rel="stylesheet" />
 
    <link href="DatePicker_css/theme.css" rel="stylesheet" />
    <link href="DatePicker_css/triangle.css" rel="stylesheet" />
    <script src="pikaday.js" type="text/javascript"></script>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server" >
    <div class="body-content">
       <h2 style="color: #4CAF50  ;">Add Movies</h2>
    
           <asp:HiddenField ID="hfmovieid_CastMembers" runat="server" />
        
               
        <asp:Label ID="cmemberlabel" runat="server" ></asp:Label>
          <table style="width:100%;">
                    
                      <tr>
                        <td>
                            <asp:Label ID="movie_id" runat="server" Text="Id" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBmovie_id" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="movie_name" runat="server" Text="Movie Name" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBmovie_name" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:TextBox>
                        </td>
                    </tr>

                        <tr>
                            <td><asp:Label ID="cast_member" runat="server" Text="Cast Members"></asp:Label></td>
                            <td>
                                <asp:ListBox ID="LBCastMemb" runat="server" SelectionMode="Multiple" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:ListBox>
                            </td>
                        </tr>

                      <tr >
                        <td >
                            <asp:Label ID="labelproducer" runat="server" Text="Producer"></asp:Label></td>
                        <td ><asp:DropDownList ID="dDLProducer" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList></td>
                     </tr>

                      <tr >
                        <td >
                            <asp:Label ID="labelstudio" runat="server" Text="Studio"></asp:Label></td>
                        <td ><asp:DropDownList ID="dDlstudio" runat="server"  Style="border-radius: 0px 8px 0px 8px;" Width="332px" ></asp:DropDownList></td>
                      </tr>

                       <tr>
                        <td>
                            <asp:Label ID="LabelreleaseDate" runat="server" Text="Release Date" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tBreleaseDate"  runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px" ForeColor="#999999"></asp:TextBox>
                            <script type="text/javascript">
                                var picker = new Pikaday(
                                {
                                    field: document.getElementById('<%=tBreleaseDate.ClientID%>'),
                                        firstDay: 1,
                                        format: ('yyyy/mm/dd'),
                                    minDate: new Date('2000-01-01'),
                                    maxDate: new Date('2024-12-31'),
                                    yearRange: [2000, 2020],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                            </script>
                            <asp:Label ID="Labeldatefrompicker" runat="server" Visible="false" Text="Label"></asp:Label>
                          
                            
                        </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label  ID="labelAgeRestricted" runat="server" style="position:center" Text="Age Restricted"></asp:Label>
                                  <asp:CheckBox ID="cBis_agerestricted"  Style="margin-left: 30px;position:center" runat="server" />
                            </td>
                           
                        </tr>
                           
                       
                    
                    <tr>
                        <td colspan="2" >
                             <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px; " ID="BtnactorSave" runat="server" ForeColor="Green" OnClick="BtnactorSave_Click" Text="Save" />
                             
                           
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
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                        </td>
                    </tr>
           


         
            
            </table>
    
 
             
 </div>
    

</asp:Content>
