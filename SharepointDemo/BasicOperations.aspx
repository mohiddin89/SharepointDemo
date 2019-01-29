<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicOperations.aspx.cs" Inherits="SharepointDemo.BasicOperations" %>

<!DOCTYPE html>
<style>
    div.exe1{
        width:100px;
        margin:auto;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="exe1">
    <table>
        <tr>
            <td><asp:Button ID="btnCreate" Text="Create" runat="server" /></td>
             <td><asp:Button ID="btnUpdate" Text="Update" runat="server" /></td>
        </tr>
         <tr>
            <td><asp:Button ID="btnDelete" Text="Delete" runat="server" /></td>
              <td><asp:Button ID="btnSite" Text="SIte Created" runat="server" /></td>
        </tr>
         <tr>
           <td><asp:Button ID="Button4" Text="Create" runat="server" /></td>
              <td><asp:Button ID="Button5" Text="Create" runat="server" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
