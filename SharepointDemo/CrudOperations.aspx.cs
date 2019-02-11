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
        ClientContext context;
        Web web;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginDetails();
        }
        public void loginDetails()
        {
            context = new ClientContext("https://verinontechnology.sharepoint.com/sites/SharepointAppPractice");
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

            web = context.Web;
            context.Load(web);
            context.ExecuteQuery();
        }

        protected void btnReister_Click(object sender, EventArgs e)
        {
            if (ReturnUser())
            {
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
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ColumnCreation();
           
        }
        protected void btnRetrive_Click(object sender, EventArgs e)
        {
            List<string> names = new List<string>();          

            List listReg = web.Lists.GetByTitle("UserRegistration");
            context.Load(listReg);
            context.ExecuteQuery();

            CamlQuery query = new CamlQuery();
            query.ViewXml = "<View><Query></Query><ViewFields><FieldRef Name='Login_ID'/></ViewFields></View>";
            Microsoft.SharePoint.Client.ListItemCollection collListItem = listReg.GetItems(query);
            context.Load(collListItem);
            context.ExecuteQuery();
            foreach (Microsoft.SharePoint.Client.ListItem oitem in collListItem)
            {
                names.Add(oitem["Login_ID"].ToString());                
                if(names.Exists(perfectvalue))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login id is already in use')", true);
                    
                }
                else
                {
                    btnReister.Enabled = true;
                }               
            }
        }
        private bool perfectvalue(string val)
        {
            return val == txtlogin.Text;
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
            context.Load(web.Fields);
            context.ExecuteQuery();

            List listReg = web.Lists.GetByTitle("UserRegistration");
            context.Load(listReg.Fields);
            context.ExecuteQuery();           

            Field field = listReg.Fields.AddFieldAsXml("<Field DisplayName='RegID' Type='Number'/>",true, AddFieldOptions.DefaultValue);
            listReg.Fields.Add(field);
            listReg.Update();
            context.Load(listReg);
            context.ExecuteQuery();

        }
        public bool ReturnUser()
        {
            List<string> names = new List<string>();

            List listReg = web.Lists.GetByTitle("UserRegistration");
            context.Load(listReg);
            context.ExecuteQuery();

            CamlQuery query = new CamlQuery();
            query.ViewXml = "<View><Query></Query><ViewFields><FieldRef Name='Login_ID'/></ViewFields></View>";
            Microsoft.SharePoint.Client.ListItemCollection collListItem = listReg.GetItems(query);
            context.Load(collListItem);
            context.ExecuteQuery();
            foreach (Microsoft.SharePoint.Client.ListItem oitem in collListItem)
            {
                names.Add(oitem["Login_ID"].ToString());
                if (names.Exists(perfectvalue))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login id is Already available')", true);
                    return false;
                }
                
            }
            return true;
        }
    }
}