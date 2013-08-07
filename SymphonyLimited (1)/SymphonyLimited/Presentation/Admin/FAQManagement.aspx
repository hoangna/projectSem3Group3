<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true"
    CodeBehind="FAQManagement.aspx.cs" Inherits="Presentation.Admin.AdminManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-heading">
        <h1>
            FAQ Manager</h1>
    </div>
    <div class="Control">
        <asp:Button ID="btnAdd" runat="server" Text="Add New" CssClass="vadd" 
            onclick="btnAdd_Click"/>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="vdelete" />
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="vrefresh"/>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </div>
    <div class="Control"></div>
    
</asp:Content>
