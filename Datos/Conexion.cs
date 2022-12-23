using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Atencion_Cliente__.Net_Framework.Datos
{
    public static class Conexion
    {
        public static SqlConnection cnn;
        public static void Conectar()
        {
            try 
            {
                cnn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='D:\\_Pruebas_Evaluacion\\ZASYLOGIC\\Atencion_Cliente - .Net Framework\\App_Data\\BD_ZASYLOGIC.mdf';Integrated Security=True");
                cnn.Open();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
        public static void Desconectar()
        {
            try
            {
                cnn.Close();
                cnn.Dispose();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}