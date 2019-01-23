namespace JinTeamForSeller.Bus.admin
{
    partial class admin_main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.회원관리ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.seller관리ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.발주서발급ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.회원관리ToolStripMenuItem,
            this.seller관리ToolStripMenuItem,
            this.발주서발급ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(930, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 회원관리ToolStripMenuItem
            // 
            this.회원관리ToolStripMenuItem.Name = "회원관리ToolStripMenuItem";
            this.회원관리ToolStripMenuItem.Size = new System.Drawing.Size(67, 20);
            this.회원관리ToolStripMenuItem.Text = "회원관리";
            this.회원관리ToolStripMenuItem.Click += new System.EventHandler(this.회원관리ToolStripMenuItem_Click);
            // 
            // seller관리ToolStripMenuItem
            // 
            this.seller관리ToolStripMenuItem.Name = "seller관리ToolStripMenuItem";
            this.seller관리ToolStripMenuItem.Size = new System.Drawing.Size(70, 20);
            this.seller관리ToolStripMenuItem.Text = "seller관리";
            this.seller관리ToolStripMenuItem.Click += new System.EventHandler(this.seller관리ToolStripMenuItem_Click);
            // 
            // 발주서발급ToolStripMenuItem
            // 
            this.발주서발급ToolStripMenuItem.Name = "발주서발급ToolStripMenuItem";
            this.발주서발급ToolStripMenuItem.Size = new System.Drawing.Size(83, 20);
            this.발주서발급ToolStripMenuItem.Text = "발주서 발급";
            // 
            // admin_main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(930, 552);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "admin_main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "admin_main";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 회원관리ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem seller관리ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 발주서발급ToolStripMenuItem;
    }
}