using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace aplikacija
{
    public class Global
    {
        private static string Korisnik_ID = "";
        public static string korisnik
        {
            get { return Korisnik_ID; }
            set { Korisnik_ID = value; }
        }

        private static int Kolicina = 0;
        public static int kolicina
        {
            get { return Kolicina; }
            set { Kolicina = value; }
        }

        private static int ID_proizvoda = 0;
        public static int proizvod_ID
        {
            get { return ID_proizvoda; }
            set { ID_proizvoda = value; }
        }
    }
}