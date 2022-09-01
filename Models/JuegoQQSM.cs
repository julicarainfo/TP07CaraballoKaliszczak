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
    private static int PocicionPozo;
    private static int PozoAcumuladoSeguro;
    private static int PozoAcumulado;
    private static bool Comodin5050;
    private static bool ComodinDobleChance;
    private static bool ComodinSaltearPregunta;
    private static List<Pozo> ListaPozo;
    private static Jugador Player;

     private static string _connectionString = @"Server=DESKTOP-A-PHZ2-CIDI-030\SQLEXPRESS;DataBase = Millonario;Trusted_Connection=True;";








}