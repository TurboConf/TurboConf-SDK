namespace ThemeSwitcher
{
    partial class ThemeSwitcherForm
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
            this.listBoxThemes = new System.Windows.Forms.ListBox();
            this.pictureBoxPreview = new System.Windows.Forms.PictureBox();
            this.buttonOK = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBoxPreview)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(246)))), ((int)(((byte)(231)))));
            this.panel1.Controls.Add(this.buttonCancel);
            this.panel1.Controls.Add(this.buttonOK);
            this.panel1.Controls.Add(this.pictureBoxPreview);
            this.panel1.Controls.Add(this.listBoxThemes);
            this.panel1.Size = new System.Drawing.Size(783, 607);
            this.panel1.Controls.SetChildIndex(this.listBoxThemes, 0);
            this.panel1.Controls.SetChildIndex(this.pictureBoxPreview, 0);
            this.panel1.Controls.SetChildIndex(this.buttonOK, 0);
            this.panel1.Controls.SetChildIndex(this.buttonCancel, 0);
            // 
            // listBoxThemes
            // 
            this.listBoxThemes.FormattingEnabled = true;
            this.listBoxThemes.Location = new System.Drawing.Point(6, 24);
            this.listBoxThemes.Name = "listBoxThemes";
            this.listBoxThemes.Size = new System.Drawing.Size(264, 550);
            this.listBoxThemes.TabIndex = 24;
            this.listBoxThemes.SelectedValueChanged += new System.EventHandler(this.listBoxThemes_SelectedValueChanged);
            // 
            // pictureBoxPreview
            // 
            this.pictureBoxPreview.Location = new System.Drawing.Point(276, 24);
            this.pictureBoxPreview.Name = "pictureBoxPreview";
            this.pictureBoxPreview.Size = new System.Drawing.Size(500, 550);
            this.pictureBoxPreview.TabIndex = 25;
            this.pictureBoxPreview.TabStop = false;
            // 
            // buttonOK
            // 
            this.buttonOK.Location = new System.Drawing.Point(701, 578);
            this.buttonOK.Name = "buttonOK";
            this.buttonOK.Size = new System.Drawing.Size(75, 23);
            this.buttonOK.TabIndex = 26;
            this.buttonOK.Text = "Установить";
            this.buttonOK.UseVisualStyleBackColor = true;
            this.buttonOK.Click += new System.EventHandler(this.buttonOK_Click);
            // 
            // buttonCancel
            // 
            this.buttonCancel.Location = new System.Drawing.Point(620, 578);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(75, 23);
            this.buttonCancel.TabIndex = 27;
            this.buttonCancel.Text = "Отмена";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.button2_Click);
            // 
            // ThemeSwitcherForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(789, 608);
            this.FormHeight = 608;
            this.FormWidth = 789;
            this.Name = "ThemeSwitcherForm";
            this.Text = "ThemeSwitcherForm";
            this.Load += new System.EventHandler(this.ThemeSwitcherForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBoxPreview)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxThemes;
        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonOK;
        private System.Windows.Forms.PictureBox pictureBoxPreview;
    }
}