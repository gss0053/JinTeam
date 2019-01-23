using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JinTeamForSeller.Bus.admin
{
    public partial class admin_main : Form
    {
        public admin_main()
        {
            InitializeComponent();
        }

        private void 회원관리ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            admin_user user = new admin_user();
            user.MdiParent = this;
            user.Show();
        }

        private void seller관리ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            admin_seller seller = new admin_seller();
            seller.MdiParent = this;
            seller.Show();
        }
    }
}
