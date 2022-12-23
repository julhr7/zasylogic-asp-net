using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atencion_Cliente.Models
{
    public class ClienteModel
    {
        public int idAtencionCliente { get; set; }
        [Required(ErrorMessage ="El campo nombre es obligatorio")]
        public string nombres { get; set; }
        [Required(ErrorMessage = "El campo apellido es obligatorio")]
        public string apellidos { get; set; }
        [Required(ErrorMessage = "El campo celular es obligatorio")]
        public string celular{ get; set; }
        [Required(ErrorMessage = "El campo email es obligatorio")]
        public string email { get; set; }
        [Required(ErrorMessage = "El campo sexo es obligatorio")]
        public int sexo { get; set; }
        public string descSexo { get; set; }

        [Required(ErrorMessage = "El campo motivo es obligatorio")]        
        public int idMotivo { get; set; }
        public string descMotivo { get; set; }


        public List<MotivoModel> MotivoList { get; set; }
        public string fecha { get; set; }
        public int respuesta { get; set; }
    }
}
