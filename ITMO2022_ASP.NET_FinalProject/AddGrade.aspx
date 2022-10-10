<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGrade.aspx.cs" UnobtrusiveValidationMode="None" Inherits="ITMO2022_ASP.NET_FinalProject.AddGrade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
    <tr>
        <td style="width: 222px; background-color: lightblue" ><h2>Select Date</h2></td>
        <td style="width: 327px; background-color: lightblue" ><h2>Select Student</h2></td>
        <td colspan="2" style="background-color: lightblue"><h2>Add Grade</h2></td>
    </tr>
    <tr>
        <td style="width: 15%">
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        </td>
        <td style="width: 25%">
            <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewStudents_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
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
        <td style="width: 20%">Last Name<br />
            <asp:TextBox ID="txtLastName" runat="server" BackColor="#E4E4E4" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="FieldValidatorName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Select student" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            First Name<br />
            <asp:TextBox ID="txtFirstName" runat="server" BackColor="#E4E4E4" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            Date<br />
            <asp:TextBox ID="txtDate" runat="server" BackColor="#E4E4E4" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Select date" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>Grade<br />
            <asp:TextBox ID="txtGrade" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="FieldValidatorGrade" runat="server" ControlToValidate="txtGrade" ErrorMessage="Input grade" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RangeValidator ID="RangeValidator1" 
                ControlToValidate="txtGrade"
                MinimumValue="1"
                MaximumValue="100"
                Type="Integer"
                ErrorMessage="Grade must be from 1 to 100"
                ForeColor="Red"
                runat="server" ></asp:RangeValidator>
            <br />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Grade" OnClick="btnUpload_Click" />
            <br />
            <asp:Label ID="LabelUpload" runat="server"></asp:Label>
            <br />
            <br />
        </td>
    </tr>
</table>
</asp:Content>
