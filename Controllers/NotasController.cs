using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class NotasController : Controller
    {
        private readonly string? conexion;

        public NotasController(IConfiguration configuration)
        {
            conexion = configuration.GetConnectionString("conexion");
        }

        List<NotasPeriodo> ListarNotasPeriodo(string periodo)
        {
            List<NotasPeriodo> temporal = new List<NotasPeriodo>();

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand("NotasPeriodo", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@periodo", periodo);
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        NotasPeriodo item = new NotasPeriodo
                        {
                            CodAlu = reader.GetString(0),
                            NomAlu = reader.GetString(1),
                            NomCurso = reader.GetString(2),
                            NomProf = reader.GetString(3),
                            Nota1 = reader.GetDecimal(4),
                            Nota2 = reader.GetDecimal(5),
                            Examen = reader.GetDecimal(6),
                            Promedio = reader.GetDecimal(7)
                        };
                        temporal.Add(item);
                    }
                }
            }
            return temporal;
        }

        List<string> listPeriodos()
        {
            List<string> temporal = new List<string>();
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand("sp_list_periodos", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temporal.Add(reader.GetString(0));
                    }
                }
            }
            return temporal;
        }

        public async Task<IActionResult> Index(string periodo = "", int page = 0)
        {
            List<string> periodos = listPeriodos();
            ViewBag.periodos = new SelectList(periodos);

            IEnumerable<NotasPeriodo> notas = ListarNotasPeriodo(periodo);
            int filas = 10;
            int totalRegistros = notas.Count();
            int totalPaginas = totalRegistros % filas == 0 ?
                                (totalRegistros / filas) :
                                (totalRegistros / filas + 1);

            ViewBag.totalRegistros = totalRegistros;
            ViewBag.totalPaginas = totalPaginas;
            ViewBag.page = page;
            ViewBag.periodo = periodo;

            return View(await Task.Run(() => notas.Skip(filas * (page - 1)).Take(filas)));
        }
    }
}
