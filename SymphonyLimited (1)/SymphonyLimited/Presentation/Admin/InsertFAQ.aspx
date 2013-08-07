<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="InsertFAQ.aspx.cs" Inherits="Presentation.Admin.InsertFAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-heading">
        <h1>
            FAQ Manager</h1>
    </div>
    <div class="Control">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="uupdate" 
            onclick="btnSave_Click"/>        
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="vrefresh"/>
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="uback"/>
    </div>

    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="lblQuestion" runat="server" Text="Question"></asp:Label>
                    :</td>
                <td>
                    <asp:TextBox ID="txtQuestion" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblAnswer" runat="server" Text="Answer :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
        </table>
    
    </div>

    <div class="Control"></div>
    
</asp:Content>
