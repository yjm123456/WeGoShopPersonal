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

        #region ������Ϣ

        /// <summary>
        /// ��ͬ���
        /// </summary>
        public string ContractNo { get; set; }

        /// <summary>
        /// ��˾����
        /// </summary>
        public string CompanyName { get; set; }
        /// <summary>
        /// ��֯����
        /// </summary>
        public int InstitutionalType { get; set; }
        /// <summary>
        /// ��֯��������
        /// </summary>
        public string OrganizingInstitution { get; set; }

        public string SaleManName { get; set; }

        public long SaleManId { get; set; }

        /// <summary>
        /// ��������
        /// </summary>
        public string AccountName { get; set; }
        /// <summary>
        /// ������
        /// </summary>
        public string DepositBank { get; set; }
        /// <summary>
        /// ���п���
        /// </summary>
        public string BankAccount { get; set; }
        /// <summary>
        /// ��ϵ��
        /// </summary>
        public string LiasonManName { get; set; }

        /// <summary>
        /// ��ϵ�绰
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// �̶��绰
        /// </summary>
        public string FixPhone { get; set; }

        /// <summary>
        /// ʹ�÷�Χ
        /// </summary>
        public int ApplicationRange { get; set; }

        public string Remark { get; set; }

        /// <summary>
        /// ���֤��
        /// </summary>
        public string IdentityCard { get; set; }
        public ManagerInfo()
		{
			this.CreateDate = System.DateTime.Now;
		}

        #endregion
    }
}
