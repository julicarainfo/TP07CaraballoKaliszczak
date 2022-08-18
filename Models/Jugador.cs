using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Millonario.Models
{
    public class Jugador
    {
       private int _idJugador;
       private string _nombre;
       private DateTime _fechaHora;
       private int _pozoGanado;
       private bool _comodinDobleChance;
       private bool _comodin50;
       private bool _comodinSaltear;

       public Jugador(int idJugador, string nombre, DateTime fechaHora, int pozoGanado, bool comodinDobleChance, bool comodin50, bool comodinSaltear)
       {
        _idJugador=idJugador;
        _nombre=nombre;
        _fechaHora=fechaHora;
        _pozoGanado=pozoGanado;
        _comodinDobleChance=comodinDobleChance;
        _comodin50=comodin50;
        _comodinSaltear=comodinSaltear;
       }
       public Jugador()
       {

       }
       public int idJugador
       {
        get{return _idJugador;}
        set{_idJugador=value;}
       }
       
       public string nombre
       {
        get{return _nombre;}
        set{_nombre=value;}
       }
       public DateTime fechaHora
       {
        get{return _fechaHora;}
        set{_fechaHora=value;}
       }
       public int pozoGanado
       {
        get{return _pozoGanado;}
        set{_pozoGanado=value;}
       }
       public bool comodinDobleChance
       {
        get{return _comodinDobleChance;}
        set{_comodinDobleChance=value;}
       }
        public bool comodin50
       {
        get{return _comodin50;}
        set{_comodin50=value;}
       }
        public bool comodinSaltear
       {
        get{return _comodinSaltear;}
        set{_comodinSaltear=value;}
       }
    }
    
}