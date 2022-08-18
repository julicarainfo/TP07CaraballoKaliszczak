using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace Millonario
{
public class Pregunta
{
  private int _idPRegunta,_nivelDificultad;
  private string _textoPregunta;

  public Pregunta (int idPregunta,int nivelDificultad, string textoPregunta)
  {
    _idPRegunta=idPregunta;
    _nivelDificultad=nivelDificultad;
    _textoPregunta=textoPregunta;
  }

  public Pregunta()
  {

  }
    public int idPRegunta
        {
            get { return _idPRegunta; }
            set { _idPRegunta = value; }
        }
    public int nevelDificultad
        {
            get { return _nivelDificultad; }
            set { _nivelDificultad = value; }
        }
    public string textoPregunta
        {
            get { return _textoPregunta; }  
            set { _textoPregunta = value; }
        }
}
}