using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using Hishop.Components.Validation;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;

namespace Hidistro.UI.Web.Admin.Trade
{
	public class SetOrderOption : AdminPage
	{
		protected System.Web.UI.WebControls.TextBox txtShowDays;

		protected System.Web.UI.WebControls.TextBox txtCloseOrderDays;

		protected System.Web.UI.WebControls.TextBox txtFinishOrderDays;

		protected System.Web.UI.WebControls.TextBox txtMaxReturnedDays;

		protected System.Web.UI.WebControls.TextBox txtTaxRate;

		protected System.Web.UI.WebControls.Button btnSave;

		protected SetOrderOption() : base("m03", "ddp01")
		{
		}

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!base.IsPostBack)
			{
				SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
				this.txtShowDays.Text = masterSettings.OrderShowDays.ToString(System.Globalization.CultureInfo.InvariantCulture);
				this.txtCloseOrderDays.Text = masterSettings.CloseOrderDays.ToString(System.Globalization.CultureInfo.InvariantCulture);
				this.txtFinishOrderDays.Text = masterSettings.FinishOrderDays.ToString(System.Globalization.CultureInfo.InvariantCulture);
				int num = masterSettings.MaxReturnedDays;
				if (num < 1)
				{
					num = 15;
				}
				this.txtMaxReturnedDays.Text = num.ToString(System.Globalization.CultureInfo.InvariantCulture);
				this.txtTaxRate.Text = masterSettings.TaxRate.ToString(System.Globalization.CultureInfo.InvariantCulture);
			}
		}

		protected void btnSave_Click(object sender, System.EventArgs e)
		{
			int orderShowDays;
			int closeOrderDays;
			int finishOrderDays;
			int maxReturnedDays;
			decimal taxRate;
			if (!this.ValidateValues(out orderShowDays, out closeOrderDays, out finishOrderDays, out maxReturnedDays, out taxRate))
			{
				return;
			}
			SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
			masterSettings.OrderShowDays = orderShowDays;
			masterSettings.CloseOrderDays = closeOrderDays;
			masterSettings.FinishOrderDays = finishOrderDays;
			masterSettings.MaxReturnedDays = maxReturnedDays;
			masterSettings.TaxRate = taxRate;
			if (!this.ValidationSettings(masterSettings))
			{
				return;
			}
			Globals.EntityCoding(masterSettings, true);
			SettingsManager.Save(masterSettings);
			this.ShowMsg("????????????????????????", true);
		}

		private bool ValidateValues(out int showDays, out int closeOrderDays, out int finishOrderDays, out int maxReturnedDays, out decimal taxRate)
		{
			string text = string.Empty;
			if (!int.TryParse(this.txtShowDays.Text, out showDays))
			{
				text += Formatter.FormatErrorMessage("??????????????????????????????,??????????????????,?????????1-90??????");
			}
			if (!int.TryParse(this.txtCloseOrderDays.Text, out closeOrderDays))
			{
				text += Formatter.FormatErrorMessage("??????????????????????????????????????????,??????????????????,?????????1-90??????");
			}
			if (!int.TryParse(this.txtFinishOrderDays.Text, out finishOrderDays))
			{
				text += Formatter.FormatErrorMessage("??????????????????????????????????????????,??????????????????,?????????1-90??????");
			}
			if (!int.TryParse(this.txtMaxReturnedDays.Text, out maxReturnedDays))
			{
				text += Formatter.FormatErrorMessage("??????????????????????????????????????????,??????????????????,?????????1-90??????");
			}
			if (!decimal.TryParse(this.txtTaxRate.Text, out taxRate))
			{
				text += Formatter.FormatErrorMessage("??????????????????????????????,???????????????,?????????0-100??????");
			}
			if (!string.IsNullOrEmpty(text))
			{
				this.ShowMsg(text, false);
				return false;
			}
			return true;
		}

		private bool ValidationSettings(SiteSettings setting)
		{
			ValidationResults validationResults = Validation.Validate<SiteSettings>(setting, new string[]
			{
				"ValMasterSettings"
			});
			string text = string.Empty;
			if (!validationResults.IsValid)
			{
				foreach (ValidationResult current in ((System.Collections.Generic.IEnumerable<ValidationResult>)validationResults))
				{
					text += Formatter.FormatErrorMessage(current.Message);
				}
				this.ShowMsg(text, false);
			}
			return validationResults.IsValid;
		}

		private void SavaKuaidi100Key()
		{
			XmlDocument xmlDocument = new XmlDocument();
			string filename = System.Web.HttpContext.Current.Request.MapPath("~/config/Express.xml");
			xmlDocument.Load(filename);
			xmlDocument.SelectSingleNode("companys");
			xmlDocument.Save(filename);
		}
	}
}
