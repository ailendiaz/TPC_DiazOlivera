using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease;

namespace TPC_DiazOlivera
{
    public partial class Error : System.Web.UI.Page
    {
        public string detalleErro { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string error;
            error = Request.QueryString["Error"];
        }
    }
}