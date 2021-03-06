﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrudOperations.aspx.cs" Inherits="SharepointDemo.CrudOperations" %>

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

    .auto-style2 {
        width: 212px;
    }

    .appear1 {
        color:white;
        font-weight:800;  
    }

    .auto-style3 {
        height: 29px;
    }

    .auto-style4 {
        width: 212px;
        height: 29px;
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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox1").datepicker();//paste textbox id here
        });
        function copyText() {

            document.getElementById("txtlogin").value = document.getElementById("txtEmail").value;
        }
        function clearText() {
            document.getElementById("txtlogin").value = "";
        }
        function MandatoryValidation() {
            if (document.getElementById('<%=drppassOfc.ClientID%>').value == "--Select--") {
                alert(document.getElementById('<%=drppassOfc.ClientID%>').value);
                alert("Passport Offcice Feild can not be blank");
                document.getElementById("<%=drppassOfc.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtName.ClientID%>").value == "") {
                alert(document.getElementById("<%=txtName.ClientID%>").value);
               alert("Name Feild can not be blank");
               document.getElementById("<%=txtName.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtsurName.ClientID%>").value == "") {
                alert("sur Name Feild can not be blank");
                document.getElementById("<%=txtsurName.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TextBox1.ClientID%>").value == "") {
                alert("Please fill User DOB");
                document.getElementById("<%=TextBox1.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtEmail.ClientID %>").value == "") {
                alert("Email id can not be blank");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            var emailPat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;;
            var emailid = document.getElementById("<%=txtEmail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                alert("Your email address seems incorrect. Please try again.");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                  return false;
              }
              if (document.getElementById("<%=txtlogin.ClientID%>").value == "") {
                alert("Please enter LoginID");
                document.getElementById("<%=txtlogin.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=drpHint.ClientID%>").value == "--Select--") {
                alert("Please select Security Question");
                document.getElementById("<%=drpHint.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtHanswer.ClientID%>").value == "") {
                alert("Please enter answer for security question");
                document.getElementById("<%=txtHanswer.ClientID%>").focus();
                return false;
            }

            return validatePassword();
        }
        function validatePassword() {
            alert("validatePWD");
            var newPassword = document.getElementById('<%=txtPwd.ClientID %>').value;
            alert(newPassword);
            var minNumberofChars = 8;
            var maxNumberofChars = 16;
            var regularExpression = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;

            if (newPassword.length == "") {
                alert("please enter password");
                document.getElementById('<%=txtPwd.ClientID %>').focus();
                return false;
            }

            if (newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars) {
                alert("password should 8 characters");
                return false;
            }
            if (!regularExpression.test(newPassword)) {
                alert("password should contain atleast one number,one small letter,one capital letter and one special character");
                return false;
            }
            if (document.getElementById("<%=txtCPwd.ClientID%>").value == "") {
                alert("please enter confirmpassword");
                document.getElementById("<%=txtCPwd.ClientID%>").focus();
                return false;
            }
            if ((document.getElementById("<%=txtCPwd.ClientID%>").value) != (document.getElementById('<%=txtPwd.ClientID %>').value)) {
                alert("confirmpassword should be equal to password");
                document.getElementById("<%=txtCPwd.ClientID%>").focus();
                return false;
            }
        }
        function validUser() {

        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" name="myform" runat="server">
        <div>
            <h2 class="appear" style="text-align: center">Registration</h2>
            <table width="100%">
                <%--<img src="486-247Park.jpg" />--%>
                <tr>
                    <td class="auto-style1">Passport Office<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="drppassOfc" runat="server" Width="150px">
                            <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
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
                    <td>Given Name<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sur Name<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtsurName" runat="server"></asp:TextBox></td>
                </tr>

                <%--<tr>
                    <td>Date of Birth</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>--%>

                <tr>
                    <td>Date of Birth<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email ID<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Do you want your Login Id to be same as E-mail Id?</td>
                    <td class="auto-style2">
                        <asp:RadioButton ID="rdbyes" Text="Yes" GroupName="Email" onclick="if(this.checked){copyText()}" runat="server" />
                        <asp:RadioButton ID="rdbNo" Text="No" GroupName="Email" onclick="if(this.checked){clearText()}" runat="server" /></td>
                </tr>

                <tr>
                    <td class="auto-style3">Login ID<span style="color: red">*</span></td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtlogin" runat="server"></asp:TextBox></td>

                    <td class="auto-style3">
                        <asp:LinkButton ID="lnkbtnCheck" Text="Check Availability" runat="server" OnClick="btnRetrive_Click"><span style="color:white">Check Availability</span></asp:LinkButton></td>
                </tr>
                <tr>
                    <td>Password<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPwd" TextMode="Password" runat="server"></asp:TextBox></td>
                    <%--,'myWin','scrollbars=no,width=500,height=150'--%>
                    <td><a href="http://localhost:53907/PwdPolocy.html" onclick="window.open('PwdPolocy.html');" title="Password Policy"><span style="color:white">Password Policy</span></a></td>
                </tr>

                <tr>
                    <td>Confirm Password<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCPwd" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Hint Question<span style="color: red">*</span></td>
                    <td class="auto-style2">
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
                    <td>Hint Answer<span style="color: red">*</span></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtHanswer" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Enter Characters Displayed</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtcapture" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <%--class="btn btn-primary"--%>
                    <%--class="btn btn-primary"--%>
                    <td style="text-align: center">
                        <asp:Button ID="btnReister" class="btn btn-primary" Width="100px" Text="Rigester" runat="server" OnClick="btnReister_Click" OnClientClick="return MandatoryValidation()" /></td>

                    <td class="auto-style2">
                        <asp:Button ID="btnClear" class="btn btn-primary" Width="100px" Text="Clear" runat="server" OnClick="btnClear_Click" /></td>
                </tr>

            </table>
        </div>

    </form>
</body>
</html>
