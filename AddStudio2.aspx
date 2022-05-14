<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStudio2.aspx.cs" Inherits="RopeyDVDs.AddStudio2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">

   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server" >
    <div class="body-content">
       <h2 style="color: #4CAF50  ;">View Studio</h2>
      

                
          
           <div class="gridview">  
            <asp:GridView ID="GVactors" runat="server" CssClass="table" AutoGenerateColumns="False" >
                      
                         <Columns >
                             <asp:BoundField DataField="studio_id" HeaderText="Id" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >

                             </asp:BoundField>
                             <asp:BoundField DataField="studio" HeaderText="Studio" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#4CAF50  " >
                             

                             </asp:BoundField>                             
                            
                         </Columns>
                     
               
             </asp:GridView>
        </div>
              
                
         
        
        
 </div>
    

</asp:Content>