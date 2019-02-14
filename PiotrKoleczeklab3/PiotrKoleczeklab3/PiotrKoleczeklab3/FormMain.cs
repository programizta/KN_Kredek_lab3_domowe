using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PiotrKoleczeklab3
{
    public partial class FormMain : Form
    {
        FormChooseTable formChooseTable;
        static SqlConnection connection;
        public readonly string[] views = { "Harmonogramy opiekunów", "Historie zwierząt", "Strefy ZOO", "Zwierzęta" };
        public static string viewChosen;
        public FormMain()
        {
            connection = new SqlConnection(@"Data Source=DESKTOP-TNNGVJ6\PIOTREKSQL;
                                             database=Ogrod_zoo;
                                             Trusted_Connection=yes");
            InitializeComponent();
        }

        private void addViewsToComboBox()
        {
            foreach (string view in views)
            {
                comboBoxViews.Items.Add(view);
            }
        }

        public static SqlConnection GetConnection()
        {
            return connection;
        }

        private void buttonAddData_Click(object sender, EventArgs e)
        {
            formChooseTable = new FormChooseTable();
            formChooseTable.Show(this);
        }

        private void buttonAbout_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Twórca aplikacji: Piotr Kołeczek\n" +
                "Program został wykonany jako trzecie zadanie" +
                "domowe (podstawy SQL w aplikacjach WinForms) w ramach" +
                "kursu programowania w środowisku .NET koła naukowego 'Kredek'");
        }

        private void buttonUpdateData_Click(object sender, EventArgs e)
        {

        }

        private void buttonDeleteData_Click(object sender, EventArgs e)
        {

        }

        private void buttonShowView_Click(object sender, EventArgs e)
        {
            if (comboBoxViews.Text.ToString() == "")
            {
                MessageBox.Show("Nie wybrałeś żadnego widoku!");
                return;
            }
            else if (comboBoxViews.Text == views[0])
            {
                viewChosen = "dbo.widok_harmonogram_opiekuna";
                FormShowView formShowView = new FormShowView();
                formShowView.Show(this);
            }
            else if (comboBoxViews.Text == views[1])
            {
                viewChosen = "dbo.widok_historii_zwierząt";
                FormShowView formShowView = new FormShowView();
                formShowView.Show(this);
            }
            else if (comboBoxViews.Text == views[2])
            {
                viewChosen = "dbo.widok_stref";
                FormShowView formShowView = new FormShowView();
                formShowView.Show(this);
            }
            else if (comboBoxViews.Text == views[3])
            {
                viewChosen = "dbo.widok_zwierzat";
                FormShowView formShowView = new FormShowView();
                formShowView.Show(this);
            }

        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            addViewsToComboBox();
        }

        private void comboBoxViews_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
