using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TurboConf.Service;

namespace ThemeSwitcher
{
    public partial class ThemeSwitcherForm : CustomForm
    {
        public ThemeSwitcherForm()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void listBoxThemes_SelectedValueChanged(object sender, EventArgs e)
        {
            if (listBoxThemes.SelectedItem != null)
            {
                var path = "settings/ThemeSwitcher/Themes/" + listBoxThemes.SelectedItem.ToString() + ".png";
                if (!File.Exists(path))
                {
                    pictureBoxPreview.Image = null;
                    return;
                }

                pictureBoxPreview.Image = new Bitmap(path);
            }
        }

        private void ThemeSwitcherForm_Load(object sender, EventArgs e)
        {
            listBoxThemes.SelectedIndex = 0;
        }

        private void buttonOK_Click(object sender, EventArgs e)
        {
            Close();
            InvokeScriptHandler("buttonOK_Click", listBoxThemes.SelectedItem);
        }
    }
}
