
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper;

namespace Millonario.Models;
public static class JuegoQQSM
{
    private static int PreguntaActual;
    private static char RespuestaCorrectaActual;
    private static int PosicionPozo;
    private static int PozoAcumuladoSeguro;
    private static int PozoAcumulado;
    private static bool Comodin5050;
    private static bool ComodinDobleChance;
    private static bool ComodinSaltearPregunta;
    private static List<Pozo> ListaPozo;
    private static Jugador Player;
    private static string _connectionString = @"Server=DESKTOP-C3LD3QR\SQLEXPRESS;DataBase = Millonario;Trusted_Connection=True;";

    public static void IniciarJuego(string Nombre)
    {
        PreguntaActual=1;
        RespuestaCorrectaActual=' ';
        PosicionPozo=0;
        PozoAcumuladoSeguro=0;
        PozoAcumulado=0;
        Comodin5050=true;
        ComodinDobleChance=true;
        ComodinSaltearPregunta=true;
        ListaPozo.Add(new Pozo(1000,false));
        ListaPozo.Add(new Pozo(3000,false));
        ListaPozo.Add(new Pozo(9000,false));
        ListaPozo.Add(new Pozo(15000,false));
        ListaPozo.Add(new Pozo(20000,true));
        ListaPozo.Add(new Pozo(35000,false));
        ListaPozo.Add(new Pozo(50000,false));
        ListaPozo.Add(new Pozo(60000,false));
        ListaPozo.Add(new Pozo(80000,false));
        ListaPozo.Add(new Pozo(100000,true));
        ListaPozo.Add(new Pozo(150000,false));
        ListaPozo.Add(new Pozo(200000,false));
        ListaPozo.Add(new Pozo(300000,false));
        ListaPozo.Add(new Pozo(400000,false));
        ListaPozo.Add(new Pozo(500000,true));
        ListaPozo.Add(new Pozo(600000,false));
        ListaPozo.Add(new Pozo(650000,false));
        ListaPozo.Add(new Pozo(700000,false));
        ListaPozo.Add(new Pozo(850000,false));
        ListaPozo.Add(new Pozo(1000000,true));
        DateTime FechaAhora = DateTime.Now;  
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql ="INSERT INTO Jugadores (Nombre,FechaHora,Pozo_Ganado,ComodinDobleChance,Comodin50,ComodinSaltear) VALUES (@Nombre,@FechaAhora,@PozoAcumuladoSeguro,@ComodinDobleChance,@Comodin5050,@ComodinSaltearPregunta)";
            Player = db.Execute(sql, new {@Nombre=Nombre,@FechaHora=FechaAhora,@Pozo_Ganado=PozoAcumuladoSeguro,@ComodinDobleChance=ComodinDobleChance,@Comodin50=Comodin5050,@ComodinSaltear=ComodinSaltearPregunta});
        }     
        Player=new Jugador(0,Nombre,FechaAhora,PozoAcumuladoSeguro,comodinDobleChance,Comodin5050,ComodinSaltearPregunta);
    }   
    public static Pregunta ObtenerProximaPregunta()
    {
        PreguntaActual++;
        Pregunta PreguntaDeAhora = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql ="SELECT * FROM Preguntas WHERE idPregunta = @PreguntaActual";
            PreguntaDeAhora = db.QueryFirstOrDefault<Pregunta>(sql, new {@PreguntaActual = PreguntaActual});
        }     
        return PreguntaDeAhora;
    } 
    public static List<Respuesta> ObtenerRespuestas()
    {
        List <Respuesta> _listaRespuesta = new List<Respuesta>();
         using(SqlConnection db = new SqlConnection(_connectionString))
        {
        string sql = "SELECT * FROM Respuesta WHERE idPregunta = @PreguntaActual ";
        _listaRespuesta = db.Query<Respuesta>(sql, new{@PreguntaActual = PreguntaActual}).ToList();
        }  
        if (_listaRespuesta[PreguntaActual].correcta = true)
        {
            RespuestaCorrectaActual = _listaRespuesta[PreguntaActual].opcionRespuesta;
        }
        return _listaRespuesta;   
    }
    public static bool RespuestaUsuario(char opcion, char opcionComodin, bool ComodinDobleChance)

    {
        bool seguir = true;
        if (ComodinDobleChance=false)
        {
            using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql ="UPDATE Jugador SET ComodinDobleChance = 0 WHERE idJugador = @idJugador  ";
            db.Execute(sql, new {@idJugador = Player.idJugador});
        }     
        }
        if (opcion != RespuestaCorrectaActual)
            {
                seguir=false;
            }
        else
        {
            PosicionPozo++;
            if (ListaPozo[PosicionPozo].valorSeguro = true)
            {
                PozoAcumuladoSeguro = ListaPozo[PosicionPozo].importe;
            } 
            return seguir;
        }


    }
    public static List<Pozo> ListarPozo()
    { 
        return ListaPozo;
    }
    public static int DevolverPosicionPozo()
    {
        return PosicionPozo;
    }
    public static char[] Descartar50()
    {
    }
}

