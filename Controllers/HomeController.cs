using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Millonario.Models;

namespace Millonario.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index(string Nombre)
    {
        JuegoQQSM.IniciarJuego(Nombre);
        player=new Jugador();
        ViewBag.player=player;
        return View();
    }

     public IActionResult preguntas()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
