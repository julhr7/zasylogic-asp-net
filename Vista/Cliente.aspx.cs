using Atencion_Cliente.Models;
using Atencion_Cliente__.Net_Framework.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Atencion_Cliente__.Net_Framework.Vista
{
    public partial class Cliente : System.Web.UI.Page
    {
        //ClienteDatos ocliente = new ClienteDatos();
        MotivoDatos oMotivo = new MotivoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            cboMotivo.DataSource = oMotivo.Consultar();
            cboMotivo.DataTextField = "descMotivo";
            cboMotivo.DataValueField = "idMotivo";
            cboMotivo.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClienteModel modelo = new ClienteModel()
            {
                nombres = txtNombre.Text,
                apellidos = txtApellidos.Text,
                celular = txtCelular.Text,
                email = txtEmail.Text,
                sexo = optHombre.Checked? 1: 0,
                idMotivo = Convert.ToInt32(cboMotivo.SelectedValue)
            };
            //ocliente.Guardar(modelo);
            ClienteDatos.Guardar(modelo);
        }


    }
}