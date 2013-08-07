<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="adminManagement.aspx.cs" Inherits="Presentation.Admin.adminManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" Width="408px">
    </asp:GridView>
    <br />
    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
    <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit" />
    <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" 
        Text="Delete" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="User" runat="server" Text="User"></asp:Label>
    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Password" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassw" runat="server"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
</asp:Content>
