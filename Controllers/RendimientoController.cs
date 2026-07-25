using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class RendimientoController : Controller
    {
        private readonly string? conexion;

        public RendimientoController(IConfiguration configuration)
        {
            conexion = configuration.GetConnectionString("conexion");
        }

        List<Curso> listCursos()
        {
            List<Curso> temporal = new List<Curso>();
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand("sp_list_cursos", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Curso curso = new Curso
                        {
                            CodCurso = reader.GetString(0),
                            NomCurso = reader.GetString(1)
                        };
                        temporal.Add(curso);
                    }
                }
            }
            return temporal;
        }

        List<ReporteRendimiento> ListarReporte(string codCurso)
        {
            List<ReporteRendimiento> temporal = new List<ReporteRendimiento>();
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand("ReporteRendimientoCurso", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@codCurso", codCurso);
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ReporteRendimiento item = new ReporteRendimiento
                        {
                            CodAlu = reader.GetString(0),
                            NomAlu = reader.GetString(1),
                            Nota1 = reader.GetDecimal(2),
                            Nota2 = reader.GetDecimal(3),
                            Examen = reader.GetDecimal(4),
                            Promedio = reader.GetDecimal(5),
                            Estado = reader.GetString(6)
                        };
                        temporal.Add(item);
                    }
                }
            }
            return temporal;
        }

        public async Task<IActionResult> Index(string codCurso = "")
        {
            List<Curso> cursos = listCursos();
            ViewBag.cursos = new SelectList(cursos, "CodCurso", "NomCurso");

            if (!string.IsNullOrEmpty(codCurso))
            {
                try
                {
                    List<ReporteRendimiento> reporte = ListarReporte(codCurso);
                    ViewBag.totalRegistros = reporte.Count;
                    return View(await Task.Run(() => reporte));
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                    ViewBag.totalRegistros = 0;
                    return View(new List<ReporteRendimiento>());
                }
            }

            ViewBag.totalRegistros = 0;
            return View(new List<ReporteRendimiento>());
        }
    }
}
