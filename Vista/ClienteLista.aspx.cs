using Atencion_Cliente.Models;
using Atencion_Cliente__.Net_Framework.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Atencion_Cliente__.Net_Framework.Vista
{
    public partial class ClienteLista : System.Web.UI.Page
    {

        [WebMethod]
        public static List<ClienteModel> Consultar(string fecha)
        {
            return ClienteDatos.Consultar(fecha);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}