using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Entities;
using Hidistro.Entities.Store;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Text;

namespace Hidistro.SqlDal.Store
{
	public class MessageDao
	{

        private  string  businessId = ConfigurationManager.AppSettings["BusinessId"].ToString();
        private Database database;

		public MessageDao()
		{
			this.database = DatabaseFactory.CreateDatabase("HidistroManagerSqlServer");
		}

		public DbQueryResult GetManagers(ManagerQuery query)
		{
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.AppendFormat("UserName LIKE '%{0}%'", DataHelper.CleanSearchString(query.Username));
			if (query.RoleId != 0)
			{
				stringBuilder.AppendFormat(" AND RoleId = {0}", query.RoleId);
			}
            stringBuilder.AppendFormat(" AND BusinessId = '{0}'", businessId);
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "BusinessInfo", "UserId", stringBuilder.ToString(), "*");
		}

		public ManagerInfo GetManager(int userId)
		{
			System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM BusinessInfo WHERE BusinessId=@BusinessId and UserId = @UserId");
			this.database.AddInParameter(sqlStringCommand, "UserId", System.Data.DbType.String, userId);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            ManagerInfo result = null;
			using (System.Data.IDataReader dataReader = this.database.ExecuteReader(sqlStringCommand))
			{
				result = ReaderConvert.ReaderToModel<ManagerInfo>(dataReader);
			}
			return result;
		}

		public ManagerInfo GetManager(string userName)
		{
			System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM BusinessInfo WHERE BusinessId=@BusinessId and UserName = @UserName");
			this.database.AddInParameter(sqlStringCommand, "UserName", System.Data.DbType.String, userName);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            ManagerInfo result = null;
			using (System.Data.IDataReader dataReader = this.database.ExecuteReader(sqlStringCommand))
			{
				result = ReaderConvert.ReaderToModel<ManagerInfo>(dataReader);
			}
			return result;
		}

        public ManagerInfo CheckAdminName(string userName)
        {
            System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM BusinessInfo WHERE UserName = @UserName");
            this.database.AddInParameter(sqlStringCommand, "UserName", System.Data.DbType.String, userName);
            ManagerInfo result = null;
            using (System.Data.IDataReader dataReader = this.database.ExecuteReader(sqlStringCommand))
            {
                result = ReaderConvert.ReaderToModel<ManagerInfo>(dataReader);
            }
            return result;
        }

        public ManagerInfo GetManageByBusId(string busInessId)
        {
            System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT  top 1 * from BusinessInfo WHERE BusinessId=@BusinessId and Version!=4");
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            ManagerInfo result = null;
            using (System.Data.IDataReader dataReader = this.database.ExecuteReader(sqlStringCommand))
            {
                result = ReaderConvert.ReaderToModel<ManagerInfo>(dataReader);
            }
            return result;
        }
        public void setShopUserValue()
        {
            System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE BusinessInfo SET ShopUserState=@State where BusinessId=@BusinessId");
            this.database.AddInParameter(sqlStringCommand, "State", System.Data.DbType.Int32, 999);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            this.database.ExecuteNonQuery(sqlStringCommand);
        }
        public int getMaxUserId()
        {
            System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("select Max(UserId) as UserId from BusinessInfo");
            BaseUserId result = null;
            using (System.Data.IDataReader dataReader = this.database.ExecuteReader(sqlStringCommand))
            {
                result = ReaderConvert.ReaderToModel<BaseUserId>(dataReader);
            }
            return result.UserId;
        }
        public bool Create(ManagerInfo manager)
		{
			System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("INSERT INTO BusinessInfo (UserId,RoleId, UserName, Password, Email, CreateDate,InstitutionalType,VerifyState,Version,DueTime,ShopUserState,BusinessId,CompanyName,LiasonManName,Phone,ApplicationRange,Remark,OrganizingInstitution,AccountName,DepositBank,BankAccount,IdentityCard,ContractNo,SaleManId,SaleManName) VALUES (@UserId,@RoleId, @UserName, @Password, @Email, @CreateDate,@InstitutionalType,@VerifyState,@Version,@DueTime,@ShopUserState,@BusinessId,@CompanyName,@LiasonManName,@Phone,@ApplicationRange,@Remark,@OrganizingInstitution,@AccountName,@DepositBank,@BankAccount,@IdentityCard,@ContractNo,@SaleManId,@SaleManName)");
            this.database.AddInParameter(sqlStringCommand, "UserId", System.Data.DbType.Int64, getMaxUserId()+1);
            this.database.AddInParameter(sqlStringCommand, "RoleId", System.Data.DbType.Int32, manager.RoleId);
			this.database.AddInParameter(sqlStringCommand, "UserName", System.Data.DbType.String, manager.UserName);
			this.database.AddInParameter(sqlStringCommand, "Password", System.Data.DbType.String, manager.Password);
			this.database.AddInParameter(sqlStringCommand, "Email", System.Data.DbType.String, manager.Email);
			this.database.AddInParameter(sqlStringCommand, "CreateDate", System.Data.DbType.DateTime, manager.CreateDate);
            this.database.AddInParameter(sqlStringCommand, "InstitutionalType", System.Data.DbType.Int16, 0);
            this.database.AddInParameter(sqlStringCommand, "VerifyState", System.Data.DbType.Int16, 1);
            this.database.AddInParameter(sqlStringCommand, "ShopUserState", System.Data.DbType.Int16, 1);
            this.database.AddInParameter(sqlStringCommand, "Version", System.Data.DbType.Int16, 4);
            this.database.AddInParameter(sqlStringCommand, "DueTime", System.Data.DbType.DateTime, manager.DueTime);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            this.database.AddInParameter(sqlStringCommand, "CompanyName", System.Data.DbType.String, manager.CompanyName);
            this.database.AddInParameter(sqlStringCommand, "LiasonManName", System.Data.DbType.String, manager.LiasonManName);
            this.database.AddInParameter(sqlStringCommand, "Phone", System.Data.DbType.String, manager.Phone);
            this.database.AddInParameter(sqlStringCommand, "ApplicationRange", System.Data.DbType.Int16, manager.ApplicationRange);
            this.database.AddInParameter(sqlStringCommand, "Remark", System.Data.DbType.String, manager.Remark);
            this.database.AddInParameter(sqlStringCommand, "OrganizingInstitution", System.Data.DbType.String, manager.OrganizingInstitution);
            this.database.AddInParameter(sqlStringCommand, "AccountName", System.Data.DbType.String, manager.AccountName);
            this.database.AddInParameter(sqlStringCommand, "DepositBank", System.Data.DbType.String, manager.DepositBank);
            this.database.AddInParameter(sqlStringCommand, "BankAccount", System.Data.DbType.String, manager.BankAccount);
            this.database.AddInParameter(sqlStringCommand, "IdentityCard", System.Data.DbType.String, manager.IdentityCard);
            this.database.AddInParameter(sqlStringCommand, "ContractNo", System.Data.DbType.String, manager.ContractNo);
            this.database.AddInParameter(sqlStringCommand, "SaleManId", System.Data.DbType.Int64, manager.SaleManId);
            this.database.AddInParameter(sqlStringCommand, "SaleManName", System.Data.DbType.String, manager.SaleManName);
            return this.database.ExecuteNonQuery(sqlStringCommand) > 0;
		}

		public bool DeleteManager(int userId)
		{
			System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("DELETE FROM BusinessInfo WHERE BusinessId=@BusinessId and UserId = @UserId and Version=4");
			this.database.AddInParameter(sqlStringCommand, "UserId", System.Data.DbType.Int32, userId);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            return this.database.ExecuteNonQuery(sqlStringCommand) > 0;
		}

		public bool Update(ManagerInfo manager)
		{
			System.Data.Common.DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE BusinessInfo SET RoleId = @RoleId, UserName = @UserName, Password = @Password, Email = @Email WHERE  BusinessId=@BusinessId and  UserId = @UserId");
			this.database.AddInParameter(sqlStringCommand, "UserId", System.Data.DbType.Int32, manager.UserId);
			this.database.AddInParameter(sqlStringCommand, "RoleId", System.Data.DbType.Int32, manager.RoleId);
			this.database.AddInParameter(sqlStringCommand, "UserName", System.Data.DbType.String, manager.UserName);
			this.database.AddInParameter(sqlStringCommand, "Password", System.Data.DbType.String, manager.Password);
			this.database.AddInParameter(sqlStringCommand, "Email", System.Data.DbType.String, manager.Email);
            this.database.AddInParameter(sqlStringCommand, "BusinessId", System.Data.DbType.String, businessId);
            return this.database.ExecuteNonQuery(sqlStringCommand) > 0;
		}
	}
}
