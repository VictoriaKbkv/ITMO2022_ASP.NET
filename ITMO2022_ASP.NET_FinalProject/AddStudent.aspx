<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="ITMO2022_ASP.NET_FinalProject.AddStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="background-color: lightblue"><h2>New Student</h2></td>
        </tr>
        <tr>
            <td style="width: 25%">Last Name&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtLastName" runat="server" OnTextChanged="txtLastName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName" ErrorMessage="Fill Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                First Name&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFirstName" runat="server" OnTextChanged="txtFirstName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Fill First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="btnUpload" runat="server" Text="Upload Data" OnClick="btnUpload_Click" />
                <asp:Label ID="LabeUpload" runat="server"></asp:Label>
            </td>
            <td>Enrolment Date&nbsp;&nbsp; <asp:TextBox ID="txtDate" runat="server" BackColor="#E4E4E4" Width="70px"></asp:TextBox>
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: lightblue"><h2>Current Student List</h2></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewStudents" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="EnrollmentDate" DataFormatString="{0:d}" HeaderText="Enrollment Date" />
                    </Columns>
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
