using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.datos;
using api_integrador.modelos;

namespace api_integrador.negocios
{
    public class TutorNegocios
    {
        TutorDatos datosT = new TutorDatos();


        public string RegistrarTutor(Tutor tutor)
        {
            string mensaje = "";
            try
            {
                datosT.RegistrarTutor(tutor);
                mensaje = "Tutor Registrado";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro el tutor " + ex.Message;
            }
            return mensaje;
        }



        public List<Tutor> ListarTutores()
        {
            return datosT.ListarTutores();
        }



        public string ActualizarTutor(Tutor tutor)
        {
            string mensaje = "";
            try
            {
               
                
                    var existeTutor = datosT.ListarTutores().Any(x => x.emailTutor == tutor.emailTutor);
                    if (existeTutor)
                    {
                        
                        datosT.ActualizarTutor(tutor);
                        mensaje = "Tutor actualizado";
                    }
                    else
                        mensaje = "Tutor no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se actualizo el tutor " + ex.Message;
            }
            return mensaje;
        }

        public string EliminarTutor(string email)
        {
            string mensaje = "";
            try
            {
                
                
                    var existeTutor = datosT.ListarTutores().Any(x => x.emailTutor == email);
                    if (existeTutor)
                    {
                        datosT.EliminarTutor(email);
                        mensaje = "Tutor eliminado";
                    }
                    else
                        mensaje = "Tutor no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el tutor : " + ex.Message;
            }

            return mensaje;
        }




    }
}
