using System;
using System.Data.SQLite;
using System.Web.UI;
using System.Xml.Linq;

namespace website
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle any logic you might need on page load
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("its working?");
        }
    }
}
