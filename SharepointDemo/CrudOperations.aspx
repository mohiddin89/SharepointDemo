<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrudOperations.aspx.cs" Inherits="SharepointDemo.CrudOperations" %>

<!DOCTYPE html>
<style>
    div.exe1 {
        width: 100px;
        margin: auto;
    }

    .appear {
        color: white;
        background-color: dodgerblue;
    }

    .auto-style1 {
        width: 280px;
    }

    .margin {
        text-align: center;
    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<%--<%--<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
   <%-- <script src="Scripts/jquery-3.2.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.js"></script>--%>

     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <%-- <script src="Scripts/jquery-3.2.1.min.js"></script>--%>--%>--%>--%>
    <%--<script>

        $(function () {
            $('#txtDOB1').datepicker({
            });
        });



    </script>--%>
     <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox1").datepicker();//paste textbox id here
        });
        </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="appear">User Registration</h2>
            <table width="100%">
                <tr>
                    <td class="auto-style1">Passport Office</td>
                    <td>
                        <asp:DropDownList ID="drppassOfc" runat="server" Width="150px">
                            <asp:ListItem Text="--Select--" Value="--select--"></asp:ListItem>
                            <asp:ListItem Text="Ahmedabad" Value="Ahmedabad"></asp:ListItem>
                            <asp:ListItem Text="Coimbatore" Value="Coimbatore"></asp:ListItem>
                            <asp:ListItem Text="Ranchi" Value="Ranchi"></asp:ListItem>
                            <asp:ListItem Text="Dehradun" Value="Dehradun"></asp:ListItem>
                            <asp:ListItem Text="Shimla" Value="Shimla"></asp:ListItem>
                            <asp:ListItem Text="Andaman and Nicobar" Value="Andaman and Nicobar"></asp:ListItem>
                            <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
                            <asp:ListItem Text="Srinagar" Value="Srinagar"></asp:ListItem>
                            <asp:ListItem Text="Lucknow" Value="Lucknow"></asp:ListItem>
                            <asp:ListItem Text="Bengaluru" Value="Bengaluru"></asp:ListItem>
                            <asp:ListItem Text="Ghaziabad" Value="Ghaziabad"></asp:ListItem>
                            <asp:ListItem Text="Madurai" Value="Madurai"></asp:ListItem>
                            <asp:ListItem Text="Surat" Value="Surat"></asp:ListItem>
                            <asp:ListItem Text="Bareilly" Value="Bareilly"></asp:ListItem>
                            <asp:ListItem Text="Bhopal" Value="Bhopal"></asp:ListItem>
                            <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                            <asp:ListItem Text="Tiruchirappalli" Value="Tiruchirappalli"></asp:ListItem>
                            <asp:ListItem Text="Visakhapatnam" Value="Visakhapatnam"></asp:ListItem>
                            <asp:ListItem Text="Vijayawada" Value="Vijayawada"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Given Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sur Name</td>
                    <td>
                        <asp:TextBox ID="txtsurName" runat="server"></asp:TextBox></td>
                </tr>


                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email ID</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Do you want your Login Id to be same as E-mail Id?</td>
                    <td>
                        <asp:RadioButton ID="rdbyes" Text="Yes" GroupName="Email" runat="server" />
                        <asp:RadioButton ID="rdbNo" Text="No" GroupName="Email" runat="server" /></td>
                </tr>
                <tr>
                    <td>Login ID</td>
                    <td>
                        <asp:TextBox ID="txtlogin" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtCPwd" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Hint Question</td>
                    <td>
                        <asp:DropDownList ID="drpHint" runat="server">
                            <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                            <asp:ListItem Text="Birth City" Value="Birth City"></asp:ListItem>
                            <asp:ListItem Text="Favourite colour" Value="Favourite colour"></asp:ListItem>
                            <asp:ListItem Text="Favourite Cricketer" Value="Favourite Cricketer"></asp:ListItem>
                            <asp:ListItem Text="Favourite Food" Value="Favourite Food"></asp:ListItem>
                            <asp:ListItem Text="First School" Value="First School"></asp:ListItem>
                            <asp:ListItem Text="Mother's Madien Name" Value="Mother's Madien Name"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Enter Characters Displayed </td>
                    <td>
                        <asp:TextBox ID="txtcapture" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <%--class="btn btn-primary"--%>
                    <%--class="btn btn-primary"--%>
                    <td style="text-align: center">
                        <asp:Button ID="btnReister" Width="100px" Text="Rigester" runat="server" /></td>

                    <td>
                        <asp:Button ID="btnClear" Width="100px" Text="Clear" runat="server" /></td>
                </tr>

            </table>


        </div>
    </form>
</body>
</html>
