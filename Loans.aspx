<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loans.aspx.cs" Inherits="RopeyDVDs.Loans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="Styles/page.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="body-content">
        <h2 style="color: #4CAF50  ;">Issue Loan</h2>
     
       
      
                    <asp:HiddenField ID="hfDuration" runat="server" />
                    <asp:HiddenField ID="hfDateOut" runat="server" />

        <asp:Label ID="Label1Loan" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="Label2Loan" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="Label3Loan" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="LabelMemberID" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="LabelMemberAge" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="LabelMemberMaxDvd" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="Label_totaldvdofmembersOnLoan" runat="server" Visible="false" Text="Label"></asp:Label>
            
          <table style="width:100%">
             
                   
                      <tr>
                        <td>
                            <asp:Label ID="LabelLoanId" runat="server" Text="Id" ></asp:Label></td>
                        <td ><asp:textBox ID="tBLoanId" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:textBox></td>
                     </tr>     
                    
              
                     <tr>
                        <td>
                            <asp:Label ID="LabelMemberName" runat="server" Text="Member Name" ></asp:Label></td>
                        <td ><asp:DropDownList ID="DDLMemberName" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList></td>
                     </tr>
                      
                         <tr>
                        <td>
                            <asp:Label ID="LabelLoanType" runat="server" Text="Loan Type"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLLoanType" runat="server" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList>
                            
                        </td>
                    </tr>

                        </table>
                   
                 <div style="  width: 330px; margin-right: auto; margin-left: auto; text-align: center;">
                            <asp:Label ID="calculateTotalCharge" runat="server" Text=" "></asp:Label>
                            <br />
                            <br />
                            <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px;" ID="BtnactorSave" runat="server" ForeColor="Green" OnClick="BtnactorSave_Click" Text="Save" />
                            <asp:Button  style="height: 30px;width:60px;border-radius: 0px 8px 0px 8px;" ID="BtnactorCancel" runat="server" ForeColor="Green" visible="false" Text="Cancel" OnClick="BtnactorCancel_Click" />
                            <br />
                             <asp:Label ID="LblAgeRestrictedErrorMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                             <br />
                             <br />
                             <asp:Label ID="LblDVDMaxErrorMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="LblSuccessMessageActors" runat="server" ForeColor="#776464" Text=""></asp:Label>
                           
                            <br />
                            <asp:Label ID="labeldate" runat="server" ForeColor="Red" visible="false" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="labelCurrentdateLoan" runat="server" ForeColor="Red" Visible="false" Text=""></asp:Label>
                             <asp:DropDownList ID="DDLmemberAgeFetched" runat="server" Visible="false" Style="border-radius: 0px 8px 0px 8px;" Width="332px"></asp:DropDownList>
                                     
    
        
 </div>

</asp:Content>

