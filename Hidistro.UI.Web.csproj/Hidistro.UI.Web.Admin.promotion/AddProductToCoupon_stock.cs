using ASPNET.WebControls;
using Hidistro.ControlPanel.Commodities;
using Hidistro.ControlPanel.Promotions;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Core.Enums;
using Hidistro.Entities.Commodities;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Hidistro.UI.Web.Admin.promotion
{
	public class AddProductToCoupon_stock : AdminPage
	{
		protected ProductSaleStatus status = ProductSaleStatus.OnStock;

		protected int couponId;

        protected string netId;

        protected System.Web.UI.HtmlControls.HtmlForm thisForm;

		protected System.Web.UI.WebControls.Label lblJoin;

		protected System.Web.UI.WebControls.Label lbsaleNumber;

		protected System.Web.UI.WebControls.Label lbwareNumber;

		protected PageSize hrefPageSize;

		protected System.Web.UI.WebControls.TextBox txt_name;

		protected System.Web.UI.WebControls.TextBox txt_minPrice;

		protected System.Web.UI.WebControls.TextBox txt_maxPrice;

		protected System.Web.UI.WebControls.Button btnQuery;

		protected System.Web.UI.WebControls.Repeater grdProducts;

		protected Pager pager;

		protected AddProductToCoupon_stock() : base("m08", "yxp01")
		{
		}

		protected void Page_Load(object sender, System.EventArgs e)
        {
            this.netId = ConfigurationManager.AppSettings["netId"];
            string[] allKeys = base.Request.Params.AllKeys;
			if (allKeys.Contains("id") && !this.bInt(base.Request["id"].ToString(), ref this.couponId))
			{
				this.couponId = 0;
			}
			this.btnQuery.Click += new System.EventHandler(this.btnQuery_Click);
			if (!base.IsPostBack)
			{
				this.BindProducts(this.couponId);
			}
		}

		protected void btnQuery_Click(object sender, System.EventArgs e)
		{
			this.BindProducts(this.couponId);
		}

		private bool bInt(string val, ref int i)
		{
			return !string.IsNullOrEmpty(val) && !val.Contains(".") && !val.Contains("-") && int.TryParse(val, out i);
		}

		private bool bDecimal(string val, ref decimal i)
		{
			return !string.IsNullOrEmpty(val) && decimal.TryParse(val, out i);
		}

		private void BindProducts(int couponId)
		{
			System.Data.DataTable selectedProducts = this.GetSelectedProducts(couponId);
			string text = this.txt_name.Text;
			string text2 = this.txt_minPrice.Text;
			string text3 = this.txt_maxPrice.Text;
			decimal? minPrice = null;
			decimal? maxPrice = null;
			decimal value = 0m;
			if (!this.bDecimal(text2, ref value))
			{
				minPrice = null;
			}
			else
			{
				minPrice = new decimal?(value);
			}
			if (!this.bDecimal(text3, ref value))
			{
				maxPrice = null;
			}
			else
			{
				maxPrice = new decimal?(value);
			}
			ProductQuery productQuery = new ProductQuery
			{
				Keywords = text,
				ProductCode = "",
				CategoryId = null,
				PageSize = this.pager.PageSize,
				PageIndex = this.pager.PageIndex,
				SortOrder = SortAction.Desc,
				SortBy = "DisplaySequence",
				StartDate = null,
				BrandId = null,
				EndDate = null,
				TypeId = null,
				SaleStatus = this.status,
				minPrice = minPrice,
				maxPrice = maxPrice,
				TwoSaleStatus = "OnStock"
			};
			Globals.EntityCoding(productQuery, true);
			DbQueryResult products = ProductHelper.GetProducts(productQuery);
			System.Data.DataTable dataTable = (System.Data.DataTable)products.Data;
			dataTable.Columns.Add("seledStatus");
			dataTable.Columns.Add("canSelStatus");
			dataTable.Columns.Add("canChkStatus");
			if (dataTable != null && selectedProducts != null)
			{
				if (dataTable.Rows.Count > 0 && selectedProducts.Rows.Count > 0)
				{
					for (int i = 0; i < dataTable.Rows.Count; i++)
					{
						int num = int.Parse(dataTable.Rows[i]["ProductId"].ToString());
						if (selectedProducts.Select(string.Format("ProductId={0}", num)).Length > 0)
						{
							dataTable.Rows[i]["seledStatus"] = "''";
							dataTable.Rows[i]["canSelStatus"] = "none";
							dataTable.Rows[i]["canChkStatus"] = "disabled";
						}
						else
						{
							dataTable.Rows[i]["seledStatus"] = "none";
							dataTable.Rows[i]["canSelStatus"] = "''";
							dataTable.Rows[i]["canChkStatus"] = string.Empty;
						}
					}
				}
				else if (dataTable.Rows.Count > 0)
				{
					for (int j = 0; j < dataTable.Rows.Count; j++)
					{
						dataTable.Rows[j]["seledStatus"] = "none";
						dataTable.Rows[j]["canSelStatus"] = "''";
						dataTable.Rows[j]["canChkStatus"] = string.Empty;
					}
				}
			}
			this.grdProducts.DataSource = products.Data;
			this.grdProducts.DataBind();
			this.pager.TotalRecords = products.TotalRecords;
			this.lbwareNumber.Text = products.TotalRecords.ToString();
			this.lblJoin.Text = selectedProducts.Rows.Count.ToString();
			this.setInSale();
		}

		private void setInSale()
		{
			System.Data.DataTable productNum = ProductHelper.GetProductNum();
			this.lbsaleNumber.Text = productNum.Rows[0]["OnSale"].ToString();
		}

		private System.Data.DataTable GetSelectedProducts(int couponId)
		{
			return CouponHelper.GetCouponProducts(couponId);
		}
	}
}
