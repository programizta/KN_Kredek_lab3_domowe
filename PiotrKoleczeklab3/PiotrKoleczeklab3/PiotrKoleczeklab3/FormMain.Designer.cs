namespace PiotrKoleczeklab3
{
    partial class FormMain
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
            this.labelMain = new System.Windows.Forms.Label();
            this.buttonAddData = new System.Windows.Forms.Button();
            this.buttonUpdateData = new System.Windows.Forms.Button();
            this.buttonDeleteData = new System.Windows.Forms.Button();
            this.labelViews = new System.Windows.Forms.Label();
            this.buttonShowView = new System.Windows.Forms.Button();
            this.comboBoxViews = new System.Windows.Forms.ComboBox();
            this.buttonExit = new System.Windows.Forms.Button();
            this.buttonAbout = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // labelMain
            // 
            this.labelMain.AutoSize = true;
            this.labelMain.Font = new System.Drawing.Font("Comic Sans MS", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.labelMain.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.labelMain.Location = new System.Drawing.Point(159, 9);
            this.labelMain.Name = "labelMain";
            this.labelMain.Size = new System.Drawing.Size(485, 40);
            this.labelMain.TabIndex = 0;
            this.labelMain.Text = "Program zarządzający bazą ZOO";
            // 
            // buttonAddData
            // 
            this.buttonAddData.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonAddData.Location = new System.Drawing.Point(12, 89);
            this.buttonAddData.Name = "buttonAddData";
            this.buttonAddData.Size = new System.Drawing.Size(170, 50);
            this.buttonAddData.TabIndex = 1;
            this.buttonAddData.Text = "Wprowadź nowe dane do bazy";
            this.buttonAddData.UseVisualStyleBackColor = true;
            this.buttonAddData.Click += new System.EventHandler(this.buttonAddData_Click);
            // 
            // buttonUpdateData
            // 
            this.buttonUpdateData.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonUpdateData.Location = new System.Drawing.Point(320, 89);
            this.buttonUpdateData.Name = "buttonUpdateData";
            this.buttonUpdateData.Size = new System.Drawing.Size(170, 50);
            this.buttonUpdateData.TabIndex = 2;
            this.buttonUpdateData.Text = "Aktualizuj dane";
            this.buttonUpdateData.UseVisualStyleBackColor = true;
            this.buttonUpdateData.Click += new System.EventHandler(this.buttonUpdateData_Click);
            // 
            // buttonDeleteData
            // 
            this.buttonDeleteData.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonDeleteData.Location = new System.Drawing.Point(622, 89);
            this.buttonDeleteData.Name = "buttonDeleteData";
            this.buttonDeleteData.Size = new System.Drawing.Size(170, 50);
            this.buttonDeleteData.TabIndex = 3;
            this.buttonDeleteData.Text = "Usuń dane";
            this.buttonDeleteData.UseVisualStyleBackColor = true;
            this.buttonDeleteData.Click += new System.EventHandler(this.buttonDeleteData_Click);
            // 
            // labelViews
            // 
            this.labelViews.AutoSize = true;
            this.labelViews.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.labelViews.Location = new System.Drawing.Point(291, 192);
            this.labelViews.Name = "labelViews";
            this.labelViews.Size = new System.Drawing.Size(62, 20);
            this.labelViews.TabIndex = 4;
            this.labelViews.Text = "Widoki:";
            // 
            // buttonShowView
            // 
            this.buttonShowView.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonShowView.Location = new System.Drawing.Point(320, 298);
            this.buttonShowView.Name = "buttonShowView";
            this.buttonShowView.Size = new System.Drawing.Size(170, 50);
            this.buttonShowView.TabIndex = 5;
            this.buttonShowView.Text = "Wyświetl widok";
            this.buttonShowView.UseVisualStyleBackColor = true;
            this.buttonShowView.Click += new System.EventHandler(this.buttonShowView_Click);
            // 
            // comboBoxViews
            // 
            this.comboBoxViews.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.comboBoxViews.FormattingEnabled = true;
            this.comboBoxViews.Location = new System.Drawing.Point(295, 225);
            this.comboBoxViews.Name = "comboBoxViews";
            this.comboBoxViews.Size = new System.Drawing.Size(221, 28);
            this.comboBoxViews.TabIndex = 6;
            this.comboBoxViews.SelectedIndexChanged += new System.EventHandler(this.comboBoxViews_SelectedIndexChanged);
            // 
            // buttonExit
            // 
            this.buttonExit.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonExit.Location = new System.Drawing.Point(622, 399);
            this.buttonExit.Name = "buttonExit";
            this.buttonExit.Size = new System.Drawing.Size(170, 50);
            this.buttonExit.TabIndex = 7;
            this.buttonExit.Text = "Wyjdź z programu";
            this.buttonExit.UseVisualStyleBackColor = true;
            this.buttonExit.Click += new System.EventHandler(this.buttonExit_Click);
            // 
            // buttonAbout
            // 
            this.buttonAbout.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.buttonAbout.Location = new System.Drawing.Point(12, 399);
            this.buttonAbout.Name = "buttonAbout";
            this.buttonAbout.Size = new System.Drawing.Size(170, 50);
            this.buttonAbout.TabIndex = 8;
            this.buttonAbout.Text = "About...";
            this.buttonAbout.UseVisualStyleBackColor = true;
            this.buttonAbout.Click += new System.EventHandler(this.buttonAbout_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 461);
            this.Controls.Add(this.buttonAbout);
            this.Controls.Add(this.buttonExit);
            this.Controls.Add(this.comboBoxViews);
            this.Controls.Add(this.buttonShowView);
            this.Controls.Add(this.labelViews);
            this.Controls.Add(this.buttonDeleteData);
            this.Controls.Add(this.buttonUpdateData);
            this.Controls.Add(this.buttonAddData);
            this.Controls.Add(this.labelMain);
            this.Name = "FormMain";
            this.Text = "Menu główne";
            this.Load += new System.EventHandler(this.FormMain_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelMain;
        private System.Windows.Forms.Button buttonAddData;
        private System.Windows.Forms.Button buttonUpdateData;
        private System.Windows.Forms.Button buttonDeleteData;
        private System.Windows.Forms.Label labelViews;
        private System.Windows.Forms.Button buttonShowView;
        private System.Windows.Forms.ComboBox comboBoxViews;
        private System.Windows.Forms.Button buttonExit;
        private System.Windows.Forms.Button buttonAbout;
    }
}

