namespace WebApplication2.Models
{
    public class ResumenCurso
    {
        public string CodCurso { get; set; }
        public string NomCurso { get; set; }
        public string NomProf { get; set; }
        public int CantAlumnos { get; set; }
        public decimal PromGeneral { get; set; }
        public int Aprobados { get; set; }
        public int Desaprobados { get; set; }
    }
}
