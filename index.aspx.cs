using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tx_addbuttons
{
    public partial class index : System.Web.UI.Page
    {
        protected void dummyButton_Click(object sender, EventArgs e)
        {
            byte[] data;
            TextControl1.SaveText(out data, 
                TXTextControl.Web.BinaryStreamType.InternalUnicodeFormat);

            ScriptManager.RegisterClientScriptBlock(
                this.Page, 
                this.Page.GetType(), 
                "alert", 
                "alert('Successfully saved.');", 
                true);
        }
    }
}