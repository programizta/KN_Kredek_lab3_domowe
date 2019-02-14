using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PiotrKoleczeklab3
{
    public partial class FormAddKeeper : Form
    {
        public FormAddKeeper()
        {
            InitializeComponent();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void buttonAccept_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand(@"INSERT INTO dbo.opiekunowie
                                                (imie, nazwisko, adres, nr_tel, przelozony_id)
                                                VALUES (@imie, @nazwisko, @adres, @nr_tel, @przelozony_id)"
                                                , FormMain.GetConnection());
            command.Parameters.Add("@imie", SqlDbType.VarChar).Value = textBoxFirstName.Text;
            command.Parameters.Add("@nazwisko", SqlDbType.VarChar).Value = textBoxLastName.Text;
            command.Parameters.Add("@adres", SqlDbType.VarChar).Value = textBoxAddress.Text;
            command.Parameters.Add("@nr_tel", SqlDbType.VarChar).Value = textBoxTelNumber.Text;
            command.Parameters.Add("@przelozony_id", SqlDbType.VarChar).Value = textBoxBossID.Text;
            FormMain.GetConnection().Open();
            command.ExecuteNonQuery();
            FormMain.GetConnection().Close();
            MessageBox.Show("Pomyślnie wprowadzono rekord do bazy!");
        }
    }
}
