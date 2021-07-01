using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Entities.Store;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThoughtWorks.QRCode.Codec;

namespace WebSite
{
   
    public partial class QrCodeCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ManagerInfo currentManager = ManagerHelper.GetCurrentManager();
            if (currentManager == null)
            {
                this.Page.Response.Redirect(Globals.ApplicationPath + "/admin/Login.aspx", true);
            }
            if (this.Page.IsPostBack)
            {
                return;
            }
            string url= Request.Params["Url"].ToString().Trim().Split(',')[0]; 
            string Name = Request.Params["Name"].ToString().Trim();
            string TypeParam = "";
            try
            {
                TypeParam = Request.Params["type"].ToString().Trim();
            }
            catch {
                TypeParam = "";
            }
            Response.Write(GetDimensionalCode(url,Name, TypeParam));
        }

        private string GetDimensionalCode(string link, string Name,string TypeParam)
        {
            if (!string.IsNullOrEmpty(TypeParam))
                link += "&type=" + TypeParam;
            Bitmap bmp = null;

            string path = Server.MapPath("~/Admin/QrCodeImg/" + Name + ".png");
            try

            {

                QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();

                qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;

                qrCodeEncoder.QRCodeScale = 4;

                //int version = Convert.ToInt16(cboVersion.Text);

                qrCodeEncoder.QRCodeVersion = 7;

                qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;

                bmp = qrCodeEncoder.Encode(link);
                bmp.Save(path);
                Response.Redirect("~/Admin/QrCodeImg/" + Name + ".png");
            }

            catch (Exception ex)

            {
                string res = "Fail";
               return res;

            }
            return "Success";

        }
    }
}