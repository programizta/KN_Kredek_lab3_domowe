using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace PiotrKoleczeklab3
{
    public partial class FormShowView : Form
    {
        string[] choices = { "dbo.widok_harmonogram_opiekuna",
                             "dbo.widok_historii_zwierząt",
                             "dbo.widok_stref",
                             "dbo.widok_zwierzat" };
        public FormShowView()
        {
            InitializeComponent();
        }

        private void FormShowView_Load(object sender, EventArgs e)
        {
            if (FormMain.viewChosen == choices[0]) ShowView(choices[0]);
            if (FormMain.viewChosen == choices[1]) ShowView(choices[1]);
            if (FormMain.viewChosen == choices[2]) ShowView(choices[2]);
            if (FormMain.viewChosen == choices[3]) ShowView(choices[3]);
        }

        private void ShowView(string viewName)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter($"select * from {viewName}",
            FormMain.GetConnection());
            DataTable table = new DataTable();
            dataAdapter.Fill(table);
            dataGridViews.DataSource = table;
        }
    }
}
