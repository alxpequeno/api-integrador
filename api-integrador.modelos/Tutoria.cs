using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.modelos
{
    public class Tutoria
    {
      public int     idTutoria              {get;set;}
      public string  tituloTutoria          {get;set;}
      public string  categoriaTutoria       {get;set;}
      public string  Foto                   {get;set;}
      public DateTime  fechaTutoria         {get;set;}
      public string  horaTutoria            {get;set;}
      public string  ubicacionTutoria       {get;set;}
      public double  precioTutoria          {get;set;}
      public string  descripcionTutoria     {get;set;}
      public bool    estadoTutoria          {get;set;}
      public int    cantidadAlumnos         {get;set;}
      public int    cantidadMaxima          {get;set;}
      public int     idTutor                {get;set;}
    }
}

