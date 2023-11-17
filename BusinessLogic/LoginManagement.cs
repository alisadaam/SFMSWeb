using System;
using System.Collections.Generic;
using System.ServiceModel.Security;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
 
using System.Web.Configuration;

namespace SFMSWeb.BusinessLogic
{
	public class LoginManagement : System.Web.UI.Page
	{
		public void UnsetSessions()
		{
			Session.Abandon();
			//SessionHelper.DestroyLoggedUserSession();
		}

	
		public string GetUserName()
		{
			return Session["USERNAME"].ToString();
		}
		public string GetPassword()
		{
			return Session["Passwd"].ToString();
		}
		public void SetPassword(string password)
		{
			Session["Passwd"] = password;
		}
	}
}