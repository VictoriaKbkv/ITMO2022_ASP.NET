<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewGrades.aspx.cs" Inherits="ITMO2022_ASP.NET_FinalProject.ViewGrades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="background-color: lightblue"><h2>Select Period</h2></td>
        </tr>
        <tr>
            <td >Start Date&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtStartDate" runat="server" Width="70px" BackColor="#E4E4E4"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Select start date" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td >End Date&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEndDate" runat="server" Width="70px" BackColor="#E4E4E4"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Select end date" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td Width="15%">
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
            <td>
                <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDownload" runat="server" Text="Download Grades" OnClick="btnDownload_Click" />
            </td>
            <td>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="background-color: lightblue" colspan="2">
                <h2>Grades</h2></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewResults" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
