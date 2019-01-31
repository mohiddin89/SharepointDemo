using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Client;

namespace SharepointDemo
{
    public partial class CrudOperations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReister_Click(object sender, EventArgs e)
        {
            ClientContext context = new ClientContext("https://verinontechnology.sharepoint.com/sites/SharepointAppPractice");
            string LoginName = "adam.a@VerinonTechnology.onmicrosoft.com";
            string Pwd = "verinon@2018";
            SecureString securePwd = new SecureString();
            foreach(char eachchar in Pwd)
            {
                securePwd.AppendChar(eachchar);
            }
            SharePointOnlineCredentials credentials = new SharePointOnlineCredentials(LoginName, securePwd);
            context.Credentials = credentials;
            context.ExecuteQuery();

            Web web = context.Web;
            context.Load(web);
            context.ExecuteQuery();

            List listReg = web.Lists.GetByTitle("UserRegistration");
            context.Load(listReg);
            context.ExecuteQuery();

            ListItemCreationInformation itemCreation = new ListItemCreationInformation();
            Microsoft.SharePoint.Client.ListItem item = listReg.AddItem(itemCreation);
            context.Load(item);
            item["Name"] = txtName.Text;
            item["Passport_Office"] = drppassOfc.SelectedValue;
            item["SurName"] = txtsurName.Text;
            item["DateofBirth"] = TextBox1.Text;
            item["Email_ID"] = txtEmail.Text;
            item["Login_ID"] = txtlogin.Text;
            item["Password"] = txtPwd.Text;
            item["Confirm_Password"] = txtCPwd.Text;
            item["Hint_Question"] = drpHint.SelectedValue;
            item["Hint_Answer"] = txtHanswer.Text;
            item.Update();
            context.ExecuteQuery();
            Console.Write("Record Submitted successful....");
            Clear();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ColumnCreation();
            #region Clear Code
            //txtName.Text = string.Empty;
            //drppassOfc.SelectedValue = "--Select--";
            //txtsurName.Text = string.Empty;
            //TextBox1.Text = string.Empty;
            //txtEmail.Text = string.Empty;
            //txtlogin.Text = string.Empty;
            //txtPwd.Text = string.Empty;
            //txtCPwd.Text = string.Empty;
            //drpHint.SelectedValue = "--Select--";
            //txtHanswer.Text = string.Empty;             
            #endregion
        }
        public void Clear()
        {
            

            txtName.Text = string.Empty;
            drppassOfc.SelectedValue = "--Select--";
            txtsurName.Text = string.Empty;
            TextBox1.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtlogin.Text = string.Empty;
            txtPwd.Text = string.Empty;
            txtCPwd.Text = string.Empty;
            drpHint.SelectedValue = "--Select--";
            txtHanswer.Text = string.Empty;

        }
        public void ColumnCreation()
        {

            ClientContext context = new ClientContext("https://verinontechnology.sharepoint.com/sites/SharepointAppPractice");
            string LoginName = "adam.a@VerinonTechnology.onmicrosoft.com";
            string Pwd = "verinon@2018";
            SecureString securePwd = new SecureString();
            foreach (char eachchar in Pwd)
            {
                securePwd.AppendChar(eachchar);
            }
            SharePointOnlineCredentials credentials = new SharePointOnlineCredentials(LoginName, securePwd);
            context.Credentials = credentials;
            context.ExecuteQuery();

            Web web = context.Web;
            context.Load(web);
            context.Load(web.Fields);
            context.ExecuteQuery();

            List listReg = web.Lists.GetByTitle("UserRegistration");
            context.Load(listReg.Fields);
            context.ExecuteQuery();

            

            Field field = web.Fields.AddFieldAsXml("<Field DisplayName='RegID' type='Number'/>",true, AddFieldOptions.DefaultValue);
            FieldNumber number = context.CastTo<FieldNumber>(field);
            number.Update();
            listReg.Fields.Add(field);
            listReg.Update();
            context.Load(listReg);
            context.ExecuteQuery();

        }
    }
}