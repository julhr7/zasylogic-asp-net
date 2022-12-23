using Atencion_Cliente.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Atencion_Cliente__.Net_Framework.Datos
{
    public static class ClienteDatos
    {
        public static void Guardar (ClienteModel modelo)
        {
            Conexion.Conectar();
            try 
            {
                SqlCommand cmd = new SqlCommand("sp_cliente_ins", Conexion.cnn);
                cmd.Parameters.AddWithValue("nombres", modelo.nombres);
                cmd.Parameters.AddWithValue("apellidos", modelo.apellidos);
                cmd.Parameters.AddWithValue("celular", modelo.celular);
                cmd.Parameters.AddWithValue("email", modelo.email);
                cmd.Parameters.AddWithValue("sexo", modelo.sexo);
                cmd.Parameters.AddWithValue("idMotivo", modelo.idMotivo);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            } 
            finally
            {
                Conexion.Desconectar();
            }
        }
        public static List<ClienteModel> Consultar(string fecha)
        {
            List<ClienteModel> lista = new List<ClienteModel>();
            Conexion.Conectar();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_cliente_sel", Conexion.cnn);
                cmd.Parameters.AddWithValue("fecha", fecha);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new ClienteModel()
                        {
                            idAtencionCliente = Convert.ToInt32(dr["idAtencionCliente"]),
                            nombres = dr["nombres"].ToString(),
                            apellidos = dr["apellidos"].ToString(),
                            celular = dr["celular"].ToString(),
                            email = dr["email"].ToString(),
                            sexo = Convert.ToInt32(dr["sexo"].ToString()),
                            descSexo = dr["descSexo"].ToString(),
                            idMotivo = Convert.ToInt32(dr["idMotivo"].ToString()),
                            descMotivo = dr["descMotivo"].ToString(),
                            fecha = dr["fecha"].ToString(),
                        });
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            } 
            finally
            {
                Conexion.Desconectar();
            }
            return lista;
        }
    }
}