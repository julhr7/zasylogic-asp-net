using Atencion_Cliente.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Atencion_Cliente__.Net_Framework.Datos
{
    public class MotivoDatos
    {
        public List<MotivoModel> Consultar()
        {
            List<MotivoModel> lista = new List<MotivoModel>();
            Conexion.Conectar();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_motivo_sel", Conexion.cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new MotivoModel()
                        {
                            idMotivo = Convert.ToInt32(dr["idMotivo"]),
                            descMotivo = dr["descMotivo"].ToString(),
                        });

                    }
                }
            }
            catch (Exception e)
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