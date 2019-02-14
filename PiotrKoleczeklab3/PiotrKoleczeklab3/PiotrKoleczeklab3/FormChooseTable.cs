using System;
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
    public partial class FormChooseTable : Form
    {
        FormAddKeeper formAddKeeper;
        string[] choices = { "dbo.harmonogramy", "dbo.opiekunowie", "dbo.zwierzeta" };
        public FormChooseTable()
        {
            InitializeComponent();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void buttonChoose_Click(object sender, EventArgs e)
        {
            if (comboBoxTables.Text.ToString() == "") MessageBox.Show("Nie wybrałeś żadnej tablicy!");
            if (comboBoxTables.Text == choices[0])
            {
                Close();
            }
            if (comboBoxTables.Text == choices[1])
            {
                formAddKeeper = new FormAddKeeper();
                formAddKeeper.FormClosed += new FormClosedEventHandler(buttonCancel_Click);
                formAddKeeper.Show();
                Hide();
            }
            if (comboBoxTables.Text == choices[2])
            {
                Close();
            }
        }

        private void FormChooseTable_Load(object sender, EventArgs e)
        {
            foreach (string table in choices)
            {
                comboBoxTables.Items.Add(table);
            }
        }
    }
}
