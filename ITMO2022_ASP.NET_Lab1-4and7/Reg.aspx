<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="ITMO2022_ASP.NET_Lab1_Ex1_2.Reg" MasterPageFile="~/Site.master" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div> 
            <h1>Приглашаем на семинар</h1> 
            <p></p> 
        </div>
        <div> 
            <label>Ваше имя:</label><asp:TextBox ID="name" runat="server"></asp:TextBox> 
        </div> 
        <div> 
            <label>Ваш email:</label><asp:TextBox ID="email" runat="server"></asp:TextBox> 
        </div> 
        <div> 
            <label>Ваш телефон:</label><asp:TextBox ID="phone" runat="server"></asp:TextBox> 
        </div> 
        <div> 
            <label>Вы будете делать доклад?</label> <asp:CheckBox ID="CheckBoxYN" runat="server" /> 
        </div>
        <div>
            <button type="submit">Отправить ответ на приглашение RSVP</button>
        </div>
</asp:Content>
