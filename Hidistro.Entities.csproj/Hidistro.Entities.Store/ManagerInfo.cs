using System;

namespace Hidistro.Entities.Store
{
	public class ManagerInfo
	{
		public virtual int UserId
		{
			get;
			protected set;
		}

		public virtual int RoleId
		{
			get;
			set;
		}

		public virtual string UserName
		{
			get;
			set;
		}

		public virtual string Password
		{
			get;
			set;
		}

		public virtual string Email
		{
			get;
			set;
		}

		public virtual System.DateTime CreateDate
		{
			get;
			set;
		}
        public virtual System.DateTime DueTime
        {
            get;
            set;
        }
        public virtual int ShopUserState
        {
            get;
            set;
        }

        #region 新增信息

        /// <summary>
        /// 合同编号
        /// </summary>
        public string ContractNo { get; set; }

        /// <summary>
        /// 公司名称
        /// </summary>
        public string CompanyName { get; set; }
        /// <summary>
        /// 组织机构
        /// </summary>
        public int InstitutionalType { get; set; }
        /// <summary>
        /// 组织机构代码
        /// </summary>
        public string OrganizingInstitution { get; set; }

        public string SaleManName { get; set; }

        public long SaleManId { get; set; }

        /// <summary>
        /// 开户名称
        /// </summary>
        public string AccountName { get; set; }
        /// <summary>
        /// 开户行
        /// </summary>
        public string DepositBank { get; set; }
        /// <summary>
        /// 银行卡号
        /// </summary>
        public string BankAccount { get; set; }
        /// <summary>
        /// 联系人
        /// </summary>
        public string LiasonManName { get; set; }

        /// <summary>
        /// 联系电话
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        public string FixPhone { get; set; }

        /// <summary>
        /// 使用范围
        /// </summary>
        public int ApplicationRange { get; set; }

        public string Remark { get; set; }

        /// <summary>
        /// 身份证号
        /// </summary>
        public string IdentityCard { get; set; }
        public ManagerInfo()
		{
			this.CreateDate = System.DateTime.Now;
		}

        #endregion
    }
}
