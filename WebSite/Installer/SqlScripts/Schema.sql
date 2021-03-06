CREATE TABLE [dbo].[aspnet_DistributorGrade] (
    [GradeId]              INT             IDENTITY (1, 1) NOT NULL,
    [Name]                 NVARCHAR (100)  NULL,
    [Description]          NVARCHAR (500)  NULL,
    [CommissionsLimit]     MONEY           NOT NULL,
    [FirstCommissionRise]  DECIMAL (18, 2) NOT NULL,
    [SecondCommissionRise] DECIMAL (18, 2) NOT NULL,
    [ThirdCommissionRise]  DECIMAL (18, 2) NOT NULL,
    [IsDefault]            BIT             NULL,
    [Ico]                  VARCHAR (255)   NOT NULL,
    [AddCommission]        DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_aspnet_DistributorGrade] PRIMARY KEY CLUSTERED ([GradeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_Distributors] (
    [UserId]                 INT           NOT NULL,
    [StoreName]              VARCHAR (255) NOT NULL,
    [Logo]                   VARCHAR (255) NULL,
    [BackImage]              VARCHAR (500) NOT NULL,
    [RequestAccount]         VARCHAR (500) NULL,
    [AccountTime]            DATETIME      NULL,
    [GradeId]                INT           NOT NULL,
    [ReferralUserId]         INT           NOT NULL,
    [ReferralPath]           VARCHAR (50)  NULL,
    [OrdersTotal]            MONEY         NOT NULL,
    [ReferralOrders]         INT           NOT NULL,
    [ReferralBlance]         MONEY         NOT NULL,
    [ReferralRequestBalance] MONEY         NOT NULL,
    [CreateTime]             DATETIME      NOT NULL,
    [ReferralStatus]         INT           NOT NULL,
    [StoreDescription]       NTEXT         NOT NULL,
    [DistributorGradeId]     INT           NULL,
    [StoreCard]              VARCHAR (255) NULL,
    [CardCreatTime]          DATETIME      NULL,
    CONSTRAINT [PK_aspnet_Distributors] PRIMARY KEY CLUSTERED ([UserId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_Managers] (
    [UserId]     INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]     INT            NOT NULL,
    [UserName]   NVARCHAR (256) NOT NULL,
    [Password]   NVARCHAR (256) NOT NULL,
    [Email]      NVARCHAR (256) NOT NULL,
    [CreateDate] DATETIME       NOT NULL,
    CONSTRAINT [PK_aspnet_Managers] PRIMARY KEY CLUSTERED ([UserId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_MemberGrades] (
    [GradeId]     INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100)  NOT NULL,
    [Description] NVARCHAR (500)  NULL,
    [Points]      INT             NOT NULL,
    [IsDefault]   BIT             NOT NULL,
    [Discount]    INT             NOT NULL,
    [TranVol]     DECIMAL (18, 2) NULL,
    [TranTimes]   INT             NULL,
    CONSTRAINT [PK_aspnet_MemberGrades] PRIMARY KEY CLUSTERED ([GradeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_Members] (
    [UserId]            INT            IDENTITY (1, 1) NOT NULL,
    [GradeId]           INT            NOT NULL,
    [ReferralUserId]    INT            NULL,
    [UserName]          NVARCHAR (256) NOT NULL,
    [CreateDate]        DATETIME       NOT NULL,
    [OrderNumber]       INT            NOT NULL,
    [Expenditure]       MONEY          NOT NULL,
    [Points]            INT            NOT NULL,
    [TopRegionId]       INT            NULL,
    [RegionId]          INT            NULL,
    [RealName]          NVARCHAR (50)  NULL,
    [Email]             NVARCHAR (256) NULL,
    [CellPhone]         NVARCHAR (50)  NULL,
    [QQ]                NVARCHAR (20)  NULL,
    [Address]           NVARCHAR (300) NULL,
    [VipCardNumber]     NVARCHAR (150) NULL,
    [VipCardDate]       DATETIME       NULL,
    [OpenId]            NVARCHAR (128) NULL,
    [SessionId]         NVARCHAR (128) NULL,
    [SessionEndTime]    DATETIME       NULL,
    [Password]          NVARCHAR (256) NULL,
    [MicroSignal]       NVARCHAR (50)  NULL,
    [UserHead]          NVARCHAR (500) NULL,
    [UserBindName]      NVARCHAR (50)  NULL,
    [Status]            INT            NOT NULL,
    [AlipayUserId]      VARCHAR (100)  NULL,
    [AlipayOpenid]      VARCHAR (100)  NULL,
    [AlipayLoginId]     VARCHAR (100)  NULL,
    [AlipayUsername]    NVARCHAR (50)  NULL,
    [AlipayAvatar]      VARCHAR (255)  NULL,
    [CardID]            VARCHAR (50)   NULL,
    [IsFollowWeixin]    BIT            NULL,
    [IsFollowAlipay]    BIT            NULL,
    [LastOrderDate]     DATETIME       NULL,
    [PayOrderDate]      DATETIME       NULL,
    [FinishOrderDate]   DATETIME       NULL,
    [IsAuthorizeWeiXin] INT            NOT NULL,
    [TotalAmount]       MONEY          NOT NULL,
    [AvailableAmount]   MONEY          NOT NULL,
    CONSTRAINT [PK_aspnet_Members] PRIMARY KEY CLUSTERED ([UserId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_RolePermissions] (
    [PermissionId] VARCHAR (100) NOT NULL,
    [RoleId]       INT           NOT NULL,
    CONSTRAINT [PK_aspnet_RolePermissions] PRIMARY KEY CLUSTERED ([PermissionId] ASC, [RoleId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[aspnet_Roles] (
    [RoleId]      INT            IDENTITY (1, 1) NOT NULL,
    [RoleName]    NVARCHAR (256) NOT NULL,
    [Description] NVARCHAR (256) NULL,
    [IsDefault]   BIT            NOT NULL,
    CONSTRAINT [PK_aspnet_Roles] PRIMARY KEY NONCLUSTERED ([RoleId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[CustomDistributor] (
    [Id]           INT           NOT NULL,
    [storename]    VARCHAR (100) NULL,
    [ordernums]    INT           NULL,
    [commtotalsum] MONEY         NULL,
    [rank]         INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_Activities] (
    [ActivitiesId]          INT             IDENTITY (1, 1) NOT NULL,
    [ActivitiesName]        NVARCHAR (50)   NOT NULL,
    [ActivitiesType]        INT             NULL,
    [StartTime]             DATETIME        NOT NULL,
    [EndTime]               DATETIME        NOT NULL,
    [ActivitiesDescription] TEXT            NULL,
    [TakeEffect]            INT             NULL,
    [Type]                  INT             NULL,
    [MemberGrades]          VARCHAR (500)   NOT NULL,
    [DefualtGroup]          VARCHAR (50)    NOT NULL,
    [CustomGroup]           VARCHAR (500)   NOT NULL,
    [attendTime]            INT             NOT NULL,
    [attendType]            INT             NOT NULL,
    [isAllProduct]          BIT             NOT NULL,
    [MeetMoney]             DECIMAL (10, 2) NOT NULL,
    [ReductionMoney]        DECIMAL (10, 2) NOT NULL,
    [MeetType]              INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([ActivitiesId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_Activities_Detail] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [ActivitiesId]   INT             NOT NULL,
    [MeetMoney]      DECIMAL (10, 2) NOT NULL,
    [ReductionMoney] DECIMAL (10, 2) NOT NULL,
    [bFreeShipping]  BIT             NOT NULL,
    [Integral]       INT             NOT NULL,
    [CouponId]       INT             NOT NULL,
    [MeetNumber]     INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_Activities_Product] (
    [ActivitiesId] INT NOT NULL,
    [ProductID]    INT NOT NULL,
    [status]       INT NOT NULL
);
GO
CREATE TABLE [dbo].[Hishop_ActivitiesMember] (
    [Id]           INT IDENTITY (1, 1) NOT NULL,
    [ActivitiesId] INT NOT NULL,
    [UserId]       INT NOT NULL,
    CONSTRAINT [PK_dbo.Hishop_ActivitiesMember] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_AliFuWuMessageTemplates] (
    [IsValid]             INT             NULL,
    [OrderIndex]          INT             NULL,
    [WXOpenTM]            VARCHAR (50)    NULL,
    [MessageType]         NVARCHAR (100)  NOT NULL,
    [Name]                NVARCHAR (100)  NULL,
    [SendEmail]           BIT             NULL,
    [SendSMS]             BIT             NULL,
    [SendInnerMessage]    BIT             NULL,
    [SendWeixin]          BIT             NULL,
    [WeixinTemplateId]    VARCHAR (150)   NULL,
    [TagDescription]      NVARCHAR (500)  NULL,
    [EmailSubject]        NVARCHAR (1024) NULL,
    [EmailBody]           NTEXT           NULL,
    [InnerMessageSubject] NVARCHAR (1024) NULL,
    [InnerMessageBody]    NTEXT           NULL,
    [SMSBody]             NVARCHAR (1024) NULL,
    PRIMARY KEY CLUSTERED ([MessageType] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail] (
    [AutoID]                  INT          IDENTITY (1, 1) NOT NULL,
    [MessageType]             VARCHAR (50) NULL,
    [DetailType]              VARCHAR (50) NULL,
    [DetailName]              VARCHAR (50) NULL,
    [AllowToAdmin]            INT          NULL,
    [AllowToDistributor]      INT          NULL,
    [AllowToMember]           INT          NULL,
    [IsSelectedByDistributor] INT          NULL,
    [IsSelectedByMember]      INT          NULL,
    PRIMARY KEY CLUSTERED ([AutoID] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_Attributes] (
    [AttributeId]       INT           IDENTITY (1, 1) NOT NULL,
    [AttributeName]     NVARCHAR (50) NOT NULL,
    [DisplaySequence]   INT           NOT NULL,
    [TypeId]            INT           NOT NULL,
    [UsageMode]         INT           NOT NULL,
    [UseAttributeImage] BIT           NOT NULL,
    CONSTRAINT [PK_Hishop_Attributes] PRIMARY KEY CLUSTERED ([AttributeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_AttributeValues] (
    [ValueId]         INT            IDENTITY (1, 1) NOT NULL,
    [AttributeId]     INT            NOT NULL,
    [DisplaySequence] INT            NOT NULL,
    [ValueStr]        NVARCHAR (200) NOT NULL,
    [ImageUrl]        NVARCHAR (255) NULL,
    CONSTRAINT [PK_Hishop_AttributeValues] PRIMARY KEY CLUSTERED ([ValueId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_BalanceDrawRequest] (
    [SerialID]         INT             IDENTITY (1, 1) NOT NULL,
    [UserId]           INT             NOT NULL,
    [RequestType]      INT             NOT NULL,
    [UserName]         NVARCHAR (256)  NOT NULL,
    [RequestTime]      DATETIME        NOT NULL,
    [Amount]           MONEY           NOT NULL,
    [AccountName]      NVARCHAR (50)   NOT NULL,
    [CellPhone]        NVARCHAR (50)   NOT NULL,
    [MerchantCode]     NVARCHAR (300)  NOT NULL,
    [Remark]           NVARCHAR (2000) NULL,
    [RedpackRecordNum] INT             NOT NULL,
    [IsCheck]          INT             NOT NULL,
    [CheckTime]        DATETIME        NULL,
    [bankName]         NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Hishop_BalanceDrawRequest] PRIMARY KEY CLUSTERED ([SerialID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Banner] (
    [BannerId]        INT            IDENTITY (1, 1) NOT NULL,
    [ShortDesc]       NVARCHAR (200) NULL,
    [ImageUrl]        NVARCHAR (350) NULL,
    [DisplaySequence] INT            NULL,
    [LocationType]    INT            NULL,
    [Url]             NVARCHAR (350) NOT NULL,
    [Type]            INT            NULL,
    [IsDisable]       BIT            NOT NULL,
    CONSTRAINT [PK_Hishop_Banner] PRIMARY KEY NONCLUSTERED ([BannerId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Bargain] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [Title]              VARCHAR (255) NOT NULL,
    [ActivityCover]      VARCHAR (255) NOT NULL,
    [BeginDate]          DATETIME      NOT NULL,
    [EndDate]            DATETIME      NOT NULL,
    [Remarks]            VARCHAR (255) NULL,
    [Status]             INT           NOT NULL,
    [CreateDate]         DATETIME      NOT NULL,
    [ProductId]          INT           NOT NULL,
    [ActivityStock]      INT           NOT NULL,
    [PurchaseNumber]     INT           NOT NULL,
    [BargainType]        INT           NOT NULL,
    [BargainTypeMaxVlue] FLOAT (53)    NOT NULL,
    [BargainTypeMinVlue] FLOAT (53)    NOT NULL,
    [InitialPrice]       MONEY         NOT NULL,
    [IsCommission]       BIT           NOT NULL,
    [FloorPrice]         MONEY         NOT NULL,
    [TranNumber]         INT           NOT NULL,
    [IsDelete]           INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_BargainDetial] (
    [Id]                   INT          IDENTITY (1, 1) NOT NULL,
    [UserId]               INT          NOT NULL,
    [BargainId]            INT          NOT NULL,
    [Number]               INT          NOT NULL,
    [Price]                MONEY        NOT NULL,
    [NumberOfParticipants] INT          NOT NULL,
    [CreateDate]           DATETIME     NULL,
    [Sku]                  VARCHAR (50) NULL,
    [IsDelete]             INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_BrandCategories] (
    [BrandId]         INT            IDENTITY (1, 1) NOT NULL,
    [BrandName]       NVARCHAR (50)  NOT NULL,
    [Logo]            NVARCHAR (255) NULL,
    [CompanyUrl]      NVARCHAR (255) NULL,
    [RewriteName]     NVARCHAR (50)  NULL,
    [MetaKeywords]    NVARCHAR (100) NULL,
    [MetaDescription] NVARCHAR (100) NULL,
    [Description]     NTEXT          NULL,
    [DisplaySequence] INT            NOT NULL,
    [Theme]           NVARCHAR (100) NULL,
    CONSTRAINT [PK_Hishop_BrandCategories] PRIMARY KEY CLUSTERED ([BrandId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Categories] (
    [CategoryId]            INT             NOT NULL,
    [Name]                  NVARCHAR (100)  NOT NULL,
    [DisplaySequence]       INT             NOT NULL,
    [IconUrl]               NVARCHAR (255)  NULL,
    [Meta_Title]            NVARCHAR (1000) NULL,
    [Meta_Description]      NVARCHAR (1000) NULL,
    [Meta_Keywords]         NVARCHAR (1000) NULL,
    [ParentCategoryId]      INT             NULL,
    [Depth]                 INT             NOT NULL,
    [Path]                  VARCHAR (4000)  NOT NULL,
    [RewriteName]           NVARCHAR (50)   NULL,
    [SKUPrefix]             NVARCHAR (10)   NULL,
    [AssociatedProductType] INT             NULL,
    [Notes1]                NTEXT           NULL,
    [Notes2]                NTEXT           NULL,
    [Notes3]                NTEXT           NULL,
    [Notes4]                NTEXT           NULL,
    [Notes5]                NTEXT           NULL,
    [Theme]                 VARCHAR (100)   NULL,
    [HasChildren]           BIT             NOT NULL,
    [FirstCommission]       VARCHAR (50)    NULL,
    [SecondCommission]      VARCHAR (50)    NULL,
    [ThirdCommission]       VARCHAR (50)    NULL,
    CONSTRAINT [PK_Hishop_Categories] PRIMARY KEY CLUSTERED ([CategoryId] ASC) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Commissions] (
    [CommId]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]         INT            NOT NULL,
    [ReferralUserId] INT            NOT NULL,
    [OrderId]        NVARCHAR (50)  NOT NULL,
    [TradeTime]      DATETIME       NOT NULL,
    [OrderTotal]     MONEY          NOT NULL,
    [CommTotal]      MONEY          NOT NULL,
    [CommType]       INT            NOT NULL,
    [State]          BIT            NULL,
    [CommRemark]     NVARCHAR (255) NULL,
    CONSTRAINT [PK_Hishop_Commissions] PRIMARY KEY CLUSTERED ([CommId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Coupon_Coupons] (
    [CouponId]           INT             IDENTITY (1, 1) NOT NULL,
    [CouponName]         NVARCHAR (20)   NOT NULL,
    [CouponValue]        DECIMAL (10, 2) NOT NULL,
    [ConditionValue]     DECIMAL (10, 2) NOT NULL,
    [BeginDate]          DATETIME        NOT NULL,
    [EndDate]            DATETIME        NOT NULL,
    [StockNum]           INT             NOT NULL,
    [ReceiveNum]         INT             NOT NULL,
    [UsedNum]            INT             NOT NULL,
    [MemberGrades]       VARCHAR (500)   NOT NULL,
    [DefualtGroup]       VARCHAR (50)    NOT NULL,
    [CustomGroup]        VARCHAR (500)   NOT NULL,
    [ImgUrl]             NVARCHAR (500)  NULL,
    [ProductNumber]      INT             NOT NULL,
    [Finished]           BIT             NULL,
    [IsAllProduct]       BIT             NOT NULL,
    [maxReceivNum]       INT             NOT NULL,
    [CouponTypes]        VARCHAR (50)    NULL,
    [ExpiredPromptTimes] NCHAR (10)      NULL
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Coupon_MemberCoupons] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [CouponId]       INT             NOT NULL,
    [MemberId]       INT             NULL,
    [ReceiveDate]    DATETIME        NULL,
    [UsedDate]       DATETIME        NULL,
    [OrderNo]        NVARCHAR (50)   NULL,
    [Status]         INT             NULL,
    [CouponName]     NVARCHAR (20)   NOT NULL,
    [ConditionValue] DECIMAL (10, 2) NULL,
    [BeginDate]      DATETIME        NULL,
    [EndDate]        DATETIME        NULL,
    [CouponValue]    DECIMAL (18)    NULL,
    CONSTRAINT [PK_Hishop_Coupon_slave] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Coupon_Products] (
    [CouponId]  INT NOT NULL,
    [ProductId] INT NOT NULL,
    [status]    INT NULL,
    CONSTRAINT [PK_Hishop_Coupon_Good] PRIMARY KEY CLUSTERED ([CouponId] ASC, [ProductId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_CouponItems] (
    [CouponId]     INT              NOT NULL,
    [LotNumber]    UNIQUEIDENTIFIER NOT NULL,
    [ClaimCode]    NVARCHAR (50)    NOT NULL,
    [UserId]       INT              NULL,
    [UserName]     NVARCHAR (256)   NULL,
    [EmailAddress] NVARCHAR (255)   NULL,
    [GenerateTime] DATETIME         NOT NULL,
    [CouponStatus] INT              NOT NULL,
    [UsedTime]     DATETIME         NULL,
    [OrderId]      NVARCHAR (60)    NULL,
    CONSTRAINT [PK_Hishop_CouponItems] PRIMARY KEY CLUSTERED ([ClaimCode] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Coupons] (
    [CouponId]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (100) NOT NULL,
    [StartTime]     DATETIME       NOT NULL,
    [ClosingTime]   DATETIME       NOT NULL,
    [Description]   NTEXT          NULL,
    [Amount]        MONEY          NULL,
    [DiscountValue] MONEY          NOT NULL,
    [SentCount]     INT            NOT NULL,
    [UsedCount]     INT            NOT NULL,
    [NeedPoint]     INT            NOT NULL,
    CONSTRAINT [PK_Hishop_Coupons] PRIMARY KEY CLUSTERED ([CouponId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_CustomDistributor] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [storename]    VARCHAR (100) NULL,
    [ordernums]    INT           NULL,
    [commtotalsum] MONEY         NULL,
    [logo]         VARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_DistributorGradeCommission] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [UserID]             INT             NOT NULL,
    [Commission]         DECIMAL (18, 2) NOT NULL,
    [PubTime]            DATETIME        NOT NULL,
    [OperAdmin]          NVARCHAR (50)   NOT NULL,
    [Memo]               NVARCHAR (2000) NULL,
    [OrderID]            NVARCHAR (50)   NULL,
    [OldCommissionTotal] DECIMAL (18, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_DistributorProducts] (
    [ProductId] INT NOT NULL,
    [UserId]    INT NOT NULL
);
GO
CREATE TABLE [dbo].[Hishop_ExpressTemplates] (
    [ExpressId]   INT           IDENTITY (1, 1) NOT NULL,
    [ExpressName] NVARCHAR (50) NOT NULL,
    [XmlFile]     NVARCHAR (50) NOT NULL,
    [IsUse]       BIT           NOT NULL,
    [IsDefault]   BIT           NOT NULL,
    CONSTRAINT [PK_Hishop_ExpressTemplates] PRIMARY KEY CLUSTERED ([ExpressId] ASC) ON [PRIMARY]
);
GO
CREATE TABLE [dbo].[Hishop_Favorite] (
    [FavoriteId] INT            IDENTITY (1, 1) NOT NULL,
    [ProductId]  INT            NOT NULL,
    [UserId]     INT            NOT NULL,
    [Tags]       NVARCHAR (100) NOT NULL,
    [Remark]     NVARCHAR (500) NULL,
    CONSTRAINT [PK_Hishop_Favorite] PRIMARY KEY CLUSTERED ([ProductId] ASC, [UserId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_FreightTemplate_FreeShipping] (
    [TemplateId]      INT          NOT NULL,
    [ModeId]          TINYINT      NOT NULL,
    [ConditionType]   TINYINT      NOT NULL,
    [ConditionNumber] VARCHAR (30) NOT NULL,
    [FreeId]          DECIMAL (18) IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Hishop_FreeShipping] PRIMARY KEY CLUSTERED ([FreeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [IX_Hishop_FreeShipping]
    ON [dbo].[Hishop_FreightTemplate_FreeShipping]([TemplateId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_FreightTemplate_FreeShippingRegions] (
    [TemplateId] INT          NOT NULL,
    [RegionId]   VARCHAR (10) NOT NULL,
    [FreeId]     DECIMAL (18) NOT NULL,
    CONSTRAINT [PK_Hishop_FreeShippingRegions] PRIMARY KEY CLUSTERED ([RegionId] ASC, [FreeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [IX_Hishop_FreeShippingRegions]
    ON [dbo].[Hishop_FreightTemplate_FreeShippingRegions]([TemplateId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_FreightTemplate_SpecifyRegionGroups] (
    [GroupId]     INT             IDENTITY (1, 1) NOT NULL,
    [TemplateId]  INT             NOT NULL,
    [ModeId]      TINYINT         NOT NULL,
    [FristNumber] DECIMAL (18, 2) NOT NULL,
    [FristPrice]  MONEY           NOT NULL,
    [AddNumber]   DECIMAL (18, 2) NOT NULL,
    [AddPrice]    MONEY           NOT NULL,
    [IsDefault]   BIT             NOT NULL,
    CONSTRAINT [PK_Hishop_SpecifyRegionGroups] PRIMARY KEY CLUSTERED ([GroupId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [IX_Hishop_SpecifyRegionGroups]
    ON [dbo].[Hishop_FreightTemplate_SpecifyRegionGroups]([TemplateId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_FreightTemplate_SpecifyRegions] (
    [TemplateId] INT NOT NULL,
    [GroupId]    INT NOT NULL,
    [RegionId]   INT NOT NULL,
    CONSTRAINT [PK_Hishop_SpecifyRegions] PRIMARY KEY CLUSTERED ([GroupId] ASC, [RegionId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [IX_Hishop_FreightTemplate_SpecifyRegions]
    ON [dbo].[Hishop_FreightTemplate_SpecifyRegions]([TemplateId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_FreightTemplate_Templates] (
    [TemplateId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (20) NOT NULL,
    [FreeShip]   BIT           NOT NULL,
    [MUnit]      TINYINT       NOT NULL,
    [HasFree]    BIT           NOT NULL,
    CONSTRAINT [PK_Hishop_FreightTemplates] PRIMARY KEY CLUSTERED ([TemplateId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_HelpBargainDetial] (
    [Id]              INT      IDENTITY (1, 1) NOT NULL,
    [BargainDetialId] INT      NOT NULL,
    [UserId]          INT      NOT NULL,
    [BargainPrice]    MONEY    NOT NULL,
    [CreateDate]      DATETIME NULL,
    [BargainId]       INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_LimitedTimeDiscount] (
    [LimitedTimeDiscountId] INT            IDENTITY (1, 1) NOT NULL,
    [ActivityName]          NVARCHAR (100) NOT NULL,
    [BeginTime]             DATETIME       NOT NULL,
    [EndTime]               DATETIME       NOT NULL,
    [Description]           NVARCHAR (100) NULL,
    [LimitNumber]           INT            NOT NULL,
    [ApplyMembers]          VARCHAR (50)   NOT NULL,
    [DefualtGroup]          VARCHAR (50)   NOT NULL,
    [CustomGroup]           VARCHAR (50)   NOT NULL,
    [CreateTime]            DATETIME       NULL,
    [Status]                INT            NULL,
    PRIMARY KEY CLUSTERED ([LimitedTimeDiscountId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_LimitedTimeDiscountProduct] (
    [LimitedTimeDiscountProductId] INT             IDENTITY (1, 1) NOT NULL,
    [LimitedTimeDiscountId]        INT             NOT NULL,
    [ProductId]                    INT             NOT NULL,
    [Discount]                     DECIMAL (18, 2) NULL,
    [Minus]                        DECIMAL (18, 2) NULL,
    [IsDehorned]                   INT             NULL,
    [IsChamferPoint]               INT             NULL,
    [FinalPrice]                   DECIMAL (18, 2) NOT NULL,
    [CreateTime]                   DATETIME        NULL,
    [BeginTime]                    DATETIME        NOT NULL,
    [EndTime]                      DATETIME        NOT NULL,
    [Status]                       INT             NULL,
    PRIMARY KEY CLUSTERED ([LimitedTimeDiscountProductId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_Logs] (
    [LogId]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [PageUrl]     NVARCHAR (1000) NOT NULL,
    [AddedTime]   DATETIME        NOT NULL,
    [UserName]    NVARCHAR (64)   NOT NULL,
    [IPAddress]   NVARCHAR (50)   NOT NULL,
    [Privilege]   INT             NOT NULL,
    [Description] NTEXT           NULL,
    CONSTRAINT [PK_Hishop_Logs] PRIMARY KEY NONCLUSTERED ([LogId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_MemberAmountDetailed] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [UserId]          INT            NOT NULL,
    [PayId]           NVARCHAR (256) NOT NULL,
    [TradeAmount]     MONEY          NOT NULL,
    [AvailableAmount] MONEY          NOT NULL,
    [TradeType]       INT            NOT NULL,
    [UserName]        NVARCHAR (256) NOT NULL,
    [TradeWays]       INT            NOT NULL,
    [TradeTime]       DATETIME       NOT NULL,
    [Remark]          TEXT           NULL,
    [State]           INT            NOT NULL,
    [GatewayPayId]    NVARCHAR (256) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_MemberAmountRequest] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [UserName]    NVARCHAR (256) NOT NULL,
    [RequestTime] DATETIME       NOT NULL,
    [Amount]      MONEY          NOT NULL,
    [RequestType] INT            NOT NULL,
    [AccountCode] TEXT           NOT NULL,
    [AccountName] NVARCHAR (256) NOT NULL,
    [BankName]    TEXT           NOT NULL,
    [Remark]      TEXT           NULL,
    [State]       INT            NOT NULL,
    [CheckTime]   DATETIME       NULL,
    [CellPhone]   TEXT           NULL,
    [Operator]    NVARCHAR (256) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_MemberClientSet] (
    [ClientTypeId] INT          NOT NULL,
    [StartTime]    DATETIME     NULL,
    [EndTime]      DATETIME     NULL,
    [LastDay]      INT          NULL,
    [ClientChar]   NVARCHAR (2) NULL,
    [ClientValue]  DECIMAL (18) NULL,
    CONSTRAINT [PK_Hishop_MemberClientSet] PRIMARY KEY NONCLUSTERED ([ClientTypeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_MessageAdminUserMsgList] (
    [AutoID]     INT          IDENTITY (1, 1) NOT NULL,
    [UserOpenId] VARCHAR (50) NOT NULL,
    [RealName]   VARCHAR (50) NULL,
    [RoleName]   VARCHAR (50) NULL,
    [Msg1]       INT          NULL,
    [Msg2]       INT          NULL,
    [Msg3]       INT          NULL,
    [Msg4]       INT          NULL,
    [Msg5]       INT          NULL,
    [Msg6]       INT          NULL,
    [Type]       INT          NULL,
    CONSTRAINT [PK_Hishop_MessageAdminUserList] PRIMARY KEY CLUSTERED ([UserOpenId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_MessageTemplates] (
    [IsValid]             INT             NULL,
    [OrderIndex]          INT             NULL,
    [WXOpenTM]            VARCHAR (50)    NULL,
    [MessageType]         NVARCHAR (100)  NOT NULL,
    [Name]                NVARCHAR (100)  NULL,
    [SendEmail]           BIT             NULL,
    [SendSMS]             BIT             NULL,
    [SendInnerMessage]    BIT             NULL,
    [SendWeixin]          BIT             NULL,
    [WeixinTemplateId]    VARCHAR (150)   NULL,
    [TagDescription]      NVARCHAR (500)  NULL,
    [EmailSubject]        NVARCHAR (1024) NULL,
    [EmailBody]           NTEXT           NULL,
    [InnerMessageSubject] NVARCHAR (1024) NULL,
    [InnerMessageBody]    NTEXT           NULL,
    [SMSBody]             NVARCHAR (1024) NULL,
    CONSTRAINT [PK_Hishop_MessageTemplates] PRIMARY KEY CLUSTERED ([MessageType] ASC) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_MessageTemplatesDetail] (
    [AutoID]                  INT          IDENTITY (1, 1) NOT NULL,
    [MessageType]             VARCHAR (50) NOT NULL,
    [DetailType]              VARCHAR (50) NULL,
    [DetailName]              VARCHAR (50) NULL,
    [AllowToAdmin]            INT          NULL,
    [AllowToDistributor]      INT          NULL,
    [AllowToMember]           INT          NULL,
    [IsSelectedByDistributor] INT          NULL,
    [IsSelectedByMember]      INT          NULL
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Notice] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Title]    NVARCHAR (50) NOT NULL,
    [Memo]     NTEXT         NOT NULL,
    [Author]   NVARCHAR (50) NOT NULL,
    [AddTime]  DATETIME      NOT NULL,
    [IsPub]    INT           NOT NULL,
    [PubTime]  DATETIME      NULL,
    [SendType] INT           NOT NULL,
    [SendTo]   INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_NoticeRead] (
    [NoticeId]    INT      NOT NULL,
    [UserId]      INT      NOT NULL,
    [ReadTime]    DATETIME NOT NULL,
    [NoticeIsDel] INT      NOT NULL,
    CONSTRAINT [PK_Hishop_NoticeRead] PRIMARY KEY CLUSTERED ([NoticeId] ASC, [UserId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_NoticeTempUser] (
    [LoginName] VARCHAR (50) NOT NULL,
    [UserId]    INT          NOT NULL
);
GO
CREATE TABLE [dbo].[Hishop_NoticeUser] (
    [NoticeId] INT NOT NULL,
    [UserId]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([NoticeId] ASC, [UserId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_OrderDebitNote] (
    [NoteId]   NVARCHAR (50)  NOT NULL,
    [OrderId]  NVARCHAR (50)  NOT NULL,
    [Operator] NVARCHAR (50)  NOT NULL,
    [Remark]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Hishop_OrderDebitNote] PRIMARY KEY CLUSTERED ([NoteId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_OrderExpressData] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [CompanyCode]   NVARCHAR (20)  NOT NULL,
    [ExpressNumber] NVARCHAR (50)  NOT NULL,
    [DataContent]   NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_OrderItems] (
    [Id]                         INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]                    NVARCHAR (50)   NOT NULL,
    [SkuId]                      NVARCHAR (100)  NOT NULL,
    [ProductId]                  INT             NOT NULL,
    [SKU]                        NVARCHAR (50)   NULL,
    [Quantity]                   INT             NOT NULL,
    [ShipmentQuantity]           INT             NOT NULL,
    [CostPrice]                  MONEY           NOT NULL,
    [ItemListPrice]              MONEY           NOT NULL,
    [ItemAdjustedPrice]          MONEY           NOT NULL,
    [ItemAdjustedCommssion]      MONEY           NOT NULL,
    [ItemDescription]            NVARCHAR (200)  NOT NULL,
    [ThumbnailsUrl]              NVARCHAR (255)  NULL,
    [Weight]                     MONEY           NULL,
    [SKUContent]                 NVARCHAR (4000) NULL,
    [PromotionId]                INT             NULL,
    [PromotionName]              NVARCHAR (100)  NULL,
    [OrderItemsStatus]           INT             NOT NULL,
    [ItemsCommission]            MONEY           NULL,
    [SecondItemsCommission]      MONEY           NULL,
    [ThirdItemsCommission]       MONEY           NULL,
    [PointNumber]                INT             NULL,
    [Type]                       INT             NULL,
    [IsHandled]                  BIT             NOT NULL,
    [ReturnMoney]                MONEY           NOT NULL,
    [DiscountAverage]            DECIMAL (18, 2) NOT NULL,
    [IsAdminModify]              BIT             NOT NULL,
    [DeleteBeforeState]          INT             NULL,
    [LimitedTimeDiscountId]      INT             NOT NULL,
    [ItemsCommissionScale]       DECIMAL (18, 2) NOT NULL,
    [SecondItemsCommissionScale] DECIMAL (18, 2) NOT NULL,
    [ThirdItemsCommissionScale]  DECIMAL (18, 2) NOT NULL,
    [BalancePayMoney]            DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_Hishop_OrderItems] PRIMARY KEY NONCLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_OrderRefund] (
    [RefundId]     INT           IDENTITY (10000, 1) NOT NULL,
    [OrderId]      NVARCHAR (50) NOT NULL,
    [ApplyForTime] DATETIME      NOT NULL,
    [RefundType]   INT           NULL,
    [RefundRemark] NTEXT         NULL,
    [AdminRemark]  NTEXT         NULL,
    [HandleStatus] INT           NOT NULL,
    [HandleTime]   DATETIME      NULL,
    [Operator]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_Hishop_Refund] PRIMARY KEY NONCLUSTERED ([RefundId] ASC) ON [PRIMARY]
);
GO
CREATE TABLE [dbo].[Hishop_OrderReplace] (
    [ReplaceId]    INT           IDENTITY (10000, 1) NOT NULL,
    [OrderId]      NVARCHAR (50) NOT NULL,
    [ApplyForTime] DATETIME      NOT NULL,
    [Comments]     NTEXT         NULL,
    [HandleStatus] INT           NOT NULL,
    [HandleTime]   DATETIME      NULL,
    [AdminRemark]  NTEXT         NULL,
    CONSTRAINT [PK_Hishop_OrderReplace] PRIMARY KEY NONCLUSTERED ([ReplaceId] ASC) ON [PRIMARY]
);
GO
CREATE TABLE [dbo].[Hishop_OrderReturns] (
    [ReturnsId]         INT            IDENTITY (10000, 1) NOT NULL,
    [OrderId]           NVARCHAR (50)  NOT NULL,
    [ApplyForTime]      DATETIME       NOT NULL,
    [RefundType]        INT            NOT NULL,
    [RefundMoney]       MONEY          NOT NULL,
    [Comments]          NTEXT          NULL,
    [HandleStatus]      INT            NOT NULL,
    [HandleTime]        DATETIME       NULL,
    [AdminRemark]       NTEXT          NULL,
    [Operator]          NVARCHAR (50)  NULL,
    [Account]           NVARCHAR (50)  NULL,
    [ProductId]         INT            NOT NULL,
    [UserId]            INT            NOT NULL,
    [AuditTime]         NVARCHAR (50)  NULL,
    [RefundTime]        NVARCHAR (50)  NULL,
    [SkuId]             NVARCHAR (100) NULL,
    [DeleteBeforeState] INT            NULL,
    [OrderItemID]       INT            NOT NULL,
    CONSTRAINT [PK_Hishop_Returns] PRIMARY KEY NONCLUSTERED ([ReturnsId] ASC) ON [PRIMARY]
);
GO
CREATE TABLE [dbo].[Hishop_Orders] (
    [OrderId]                     NVARCHAR (50)   NOT NULL,
    [OrderMarking]                NVARCHAR (50)   NULL,
    [Remark]                      NVARCHAR (4000) NULL,
    [ManagerMark]                 INT             NULL,
    [ManagerRemark]               NVARCHAR (4000) NULL,
    [AdjustedDiscount]            MONEY           NULL,
    [OrderStatus]                 INT             NOT NULL,
    [CloseReason]                 NVARCHAR (4000) NULL,
    [OrderDate]                   DATETIME        NOT NULL,
    [PayDate]                     DATETIME        NULL,
    [ShippingDate]                DATETIME        NULL,
    [FinishDate]                  DATETIME        NULL,
    [UserId]                      INT             NOT NULL,
    [Username]                    NVARCHAR (64)   NOT NULL,
    [EmailAddress]                NVARCHAR (255)  NULL,
    [RealName]                    NVARCHAR (50)   NULL,
    [QQ]                          NVARCHAR (20)   NULL,
    [Wangwang]                    NVARCHAR (20)   NULL,
    [MSN]                         NVARCHAR (128)  NULL,
    [ShippingRegion]              NVARCHAR (300)  NULL,
    [Address]                     NVARCHAR (300)  NULL,
    [ZipCode]                     NVARCHAR (20)   NULL,
    [ShipTo]                      NVARCHAR (50)   NULL,
    [TelPhone]                    NVARCHAR (50)   NULL,
    [CellPhone]                   NVARCHAR (50)   NULL,
    [ShipToDate]                  NVARCHAR (50)   NULL,
    [ShippingModeId]              INT             NULL,
    [ModeName]                    NVARCHAR (50)   NULL,
    [RealShippingModeId]          INT             NULL,
    [RealModeName]                NVARCHAR (50)   NULL,
    [RegionId]                    INT             NULL,
    [Freight]                     MONEY           NULL,
    [AdjustedFreight]             MONEY           NULL,
    [ShipOrderNumber]             NVARCHAR (50)   NULL,
    [Weight]                      MONEY           NULL,
    [ExpressCompanyName]          NVARCHAR (500)  NULL,
    [ExpressCompanyAbb]           NVARCHAR (500)  NULL,
    [PaymentTypeId]               INT             NULL,
    [PaymentType]                 NVARCHAR (100)  NULL,
    [PayCharge]                   MONEY           NULL,
    [RefundStatus]                INT             NULL,
    [RefundAmount]                MONEY           NULL,
    [RefundRemark]                NVARCHAR (4000) NULL,
    [Gateway]                     NVARCHAR (200)  NULL,
    [OrderTotal]                  MONEY           NULL,
    [OrderPoint]                  INT             NULL,
    [OrderCostPrice]              MONEY           NULL,
    [OrderProfit]                 MONEY           NULL,
    [ActualFreight]               MONEY           NULL,
    [OtherCost]                   MONEY           NULL,
    [OptionPrice]                 MONEY           NULL,
    [Amount]                      MONEY           NULL,
    [DiscountAmount]              MONEY           NULL,
    [ActivitiesId]                NVARCHAR (50)   NULL,
    [ActivitiesName]              NVARCHAR (200)  NULL,
    [ReducedPromotionId]          INT             NULL,
    [ReducedPromotionName]        NVARCHAR (100)  NULL,
    [ReducedPromotionAmount]      MONEY           NULL,
    [IsReduced]                   BIT             NULL,
    [SentTimesPointPromotionId]   INT             NULL,
    [SentTimesPointPromotionName] NVARCHAR (100)  NULL,
    [TimesPoint]                  MONEY           NULL,
    [IsSendTimesPoint]            BIT             NULL,
    [FreightFreePromotionId]      INT             NULL,
    [FreightFreePromotionName]    NVARCHAR (100)  NULL,
    [IsFreightFree]               BIT             NULL,
    [CouponName]                  NVARCHAR (100)  NULL,
    [CouponCode]                  NVARCHAR (50)   NULL,
    [CouponAmount]                MONEY           NULL,
    [CouponValue]                 MONEY           NULL,
    [GroupBuyId]                  INT             NULL,
    [NeedPrice]                   MONEY           NULL,
    [GroupBuyStatus]              INT             NULL,
    [CountDownBuyId]              INT             NULL,
    [BundlingId]                  INT             NULL,
    [BundlingNum]                 INT             NULL,
    [BundlingPrice]               MONEY           NULL,
    [GatewayOrderId]              NVARCHAR (100)  NULL,
    [IsPrinted]                   BIT             NULL,
    [Tax]                         MONEY           NULL,
    [InvoiceTitle]                NVARCHAR (50)   NULL,
    [Sender]                      NVARCHAR (50)   NULL,
    [ReferralUserId]              INT             NULL,
    [FirstCommission]             MONEY           NULL,
    [SecondCommission]            MONEY           NULL,
    [ThirdCommission]             MONEY           NULL,
    [RedPagerActivityName]        NVARCHAR (100)  NULL,
    [RedPagerID]                  INT             NULL,
    [RedPagerOrderAmountCanUse]   MONEY           NULL,
    [RedPagerAmount]              MONEY           NULL,
    [OldAddress]                  NVARCHAR (200)  NULL,
    [PointToCash]                 MONEY           NOT NULL,
    [PointExchange]               INT             NOT NULL,
    [SplitState]                  INT             NOT NULL,
    [DeleteBeforeState]           INT             NOT NULL,
    [ClientShortType]             INT             NOT NULL,
    [ReferralPath]                VARCHAR (50)    NULL,
    [BargainDetialId]             INT             NOT NULL,
    [BalancePayMoneyTotal]        DECIMAL (18, 2) NOT NULL,
    [BalancePayFreightMoneyTotal] DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_Hishop_Orders] PRIMARY KEY NONCLUSTERED ([OrderId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE CLUSTERED INDEX [Hishop_Orders_Index]
    ON [dbo].[Hishop_Orders]([OrderDate] ASC)
    ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index2]
    ON [dbo].[Hishop_Orders]([PaymentTypeId] ASC)
    ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index3]
    ON [dbo].[Hishop_Orders]([Username] ASC)
    ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index4]
    ON [dbo].[Hishop_Orders]([UserId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_OrderSendNote] (
    [NoteId]   NVARCHAR (50)  NOT NULL,
    [OrderId]  NVARCHAR (50)  NOT NULL,
    [Operator] NVARCHAR (50)  NOT NULL,
    [Remark]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Hishop_OrderSendNote] PRIMARY KEY CLUSTERED ([NoteId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PaymentTypes] (
    [ModeId]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]               NVARCHAR (100) NOT NULL,
    [Description]        NTEXT          NULL,
    [Gateway]            NVARCHAR (200) NULL,
    [DisplaySequence]    INT            NOT NULL,
    [IsUseInpour]        BIT            NOT NULL,
    [IsUseInDistributor] BIT            NOT NULL,
    [Charge]             MONEY          NOT NULL,
    [IsPercent]          BIT            NOT NULL,
    [Settings]           NTEXT          NULL,
    CONSTRAINT [PK_Hishop_PaymentTypes] PRIMARY KEY CLUSTERED ([ModeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PhotoCategories] (
    [CategoryId]      INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName]    NVARCHAR (50) NOT NULL,
    [DisplaySequence] INT           NOT NULL,
    [TypeId]          INT           NOT NULL,
    CONSTRAINT [PK_distro_PhotoCategories] PRIMARY KEY CLUSTERED ([CategoryId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PhotoGallery] (
    [PhotoId]        INT            IDENTITY (1, 1) NOT NULL,
    [CategoryId]     INT            NOT NULL,
    [PhotoName]      NVARCHAR (100) NULL,
    [PhotoPath]      VARCHAR (300)  NOT NULL,
    [FileSize]       INT            NOT NULL,
    [UploadTime]     DATETIME       NOT NULL,
    [LastUpdateTime] DATETIME       NOT NULL,
    [TypeId]         INT            NOT NULL,
    CONSTRAINT [PK_distro_PhotoGallery] PRIMARY KEY CLUSTERED ([PhotoId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PointExchange_Changed] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [exChangeId]   INT           NOT NULL,
    [exChangeName] NVARCHAR (50) NOT NULL,
    [ProductId]    INT           NOT NULL,
    [PointNumber]  INT           NOT NULL,
    [Date]         DATETIME      NOT NULL,
    [MemberID]     INT           NOT NULL,
    [MemberGrades] VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_PointExChange_PointExChanges] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [MemberGrades]  VARCHAR (500)  NOT NULL,
    [DefualtGroup]  VARCHAR (50)   NOT NULL,
    [CustomGroup]   VARCHAR (500)  NOT NULL,
    [BeginDate]     DATETIME       NOT NULL,
    [EndDate]       DATETIME       NOT NULL,
    [ProductNumber] INT            NOT NULL,
    [ImgUrl]        NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_PointExChange_Products] (
    [exChangeId]    INT NOT NULL,
    [ProductId]     INT NOT NULL,
    [status]        INT NOT NULL,
    [ProductNumber] INT NOT NULL,
    [PointNumber]   INT NOT NULL,
    [ChangedNumber] INT NOT NULL,
    [eachMaxNumber] INT NOT NULL,
    CONSTRAINT [PK_Hishop_PointExChange_Products] PRIMARY KEY CLUSTERED ([ProductId] ASC, [exChangeId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_PrivilegeInRoles] (
    [RoleId]    INT NOT NULL,
    [Privilege] INT NOT NULL,
    CONSTRAINT [PK_Hishop_PrivilegeInRoles] PRIMARY KEY CLUSTERED ([RoleId] ASC, [Privilege] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PrizesDeliveryRecord] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Receiver]      NVARCHAR (50)  NULL,
    [Tel]           VARCHAR (50)   NULL,
    [status]        INT            NOT NULL,
    [LogId]         INT            NOT NULL,
    [DeliveryTime]  DATETIME       NULL,
    [ReceiveTime]   DATETIME       NULL,
    [ExpressName]   NVARCHAR (50)  NULL,
    [CourierNumber] VARCHAR (50)   NULL,
    [ReggionPath]   VARCHAR (50)   NULL,
    [Address]       NVARCHAR (100) NULL,
    [Pid]           VARCHAR (50)   NOT NULL,
    [RecordType]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE NONCLUSTERED INDEX [IX_Hishop_PrizesDeliveryRecord_Column]
    ON [dbo].[Hishop_PrizesDeliveryRecord]([LogId] ASC);
GO
CREATE TABLE [dbo].[Hishop_ProductAttributes] (
    [ProductId]   INT NOT NULL,
    [AttributeId] INT NOT NULL,
    [ValueId]     INT NOT NULL,
    CONSTRAINT [PK_Hishop_ProductAttributes] PRIMARY KEY CLUSTERED ([ProductId] ASC, [AttributeId] ASC, [ValueId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ProductConsultations] (
    [ConsultationId]   INT             IDENTITY (1, 1) NOT NULL,
    [ProductId]        INT             NOT NULL,
    [UserId]           INT             NOT NULL,
    [UserName]         NVARCHAR (100)  NULL,
    [UserEmail]        NVARCHAR (100)  NULL,
    [ConsultationText] NVARCHAR (1000) NOT NULL,
    [ConsultationDate] DATETIME        NOT NULL,
    [ReplyText]        NTEXT           NULL,
    [ReplyDate]        DATETIME        NULL,
    [ReplyUserId]      INT             NULL,
    [ViewDate]         DATETIME        NULL,
    CONSTRAINT [PK_Hishop_ProductConsultations] PRIMARY KEY NONCLUSTERED ([ConsultationId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ProductReviews] (
    [ReviewId]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [ProductId]   INT             NOT NULL,
    [UserId]      INT             NOT NULL,
    [UserName]    NVARCHAR (100)  NOT NULL,
    [UserEmail]   NVARCHAR (100)  NULL,
    [ReviewText]  NVARCHAR (3000) NOT NULL,
    [ReviewDate]  DATETIME        NOT NULL,
    [OrderID]     NVARCHAR (50)   NULL,
    [SkuID]       NVARCHAR (100)  NULL,
    [OrderItemID] INT             NOT NULL,
    CONSTRAINT [PK_Hishop_ProductReviews] PRIMARY KEY NONCLUSTERED ([ReviewId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Products] (
    [CategoryId]         INT             NOT NULL,
    [TypeId]             INT             NULL,
    [ProductId]          INT             IDENTITY (1, 1) NOT NULL,
    [ProductName]        NVARCHAR (200)  NOT NULL,
    [ProductCode]        NVARCHAR (50)   NULL,
    [ShortDescription]   NVARCHAR (2000) NULL,
    [Unit]               NVARCHAR (50)   NULL,
    [Description]        NTEXT           NULL,
    [SaleStatus]         INT             NOT NULL,
    [AddedDate]          DATETIME        NOT NULL,
    [VistiCounts]        INT             NOT NULL,
    [SaleCounts]         INT             NOT NULL,
    [ShowSaleCounts]     INT             NOT NULL,
    [DisplaySequence]    INT             NOT NULL,
    [ImageUrl1]          NVARCHAR (255)  NULL,
    [ImageUrl2]          NVARCHAR (255)  NULL,
    [ImageUrl3]          NVARCHAR (255)  NULL,
    [ImageUrl4]          NVARCHAR (255)  NULL,
    [ImageUrl5]          NVARCHAR (255)  NULL,
    [ThumbnailUrl40]     NVARCHAR (255)  NULL,
    [ThumbnailUrl60]     NVARCHAR (255)  NULL,
    [ThumbnailUrl100]    NVARCHAR (255)  NULL,
    [ThumbnailUrl160]    NVARCHAR (255)  NULL,
    [ThumbnailUrl180]    NVARCHAR (255)  NULL,
    [ThumbnailUrl220]    NVARCHAR (255)  NULL,
    [ThumbnailUrl310]    NVARCHAR (255)  NULL,
    [ThumbnailUrl410]    NVARCHAR (255)  NULL,
    [MarketPrice]        MONEY           NULL,
    [BrandId]            INT             NULL,
    [MainCategoryPath]   NVARCHAR (256)  NULL,
    [ExtendCategoryPath] NVARCHAR (256)  NULL,
    [HasSKU]             BIT             NOT NULL,
    [IsfreeShipping]     BIT             NULL,
    [TaobaoProductId]    BIGINT          NULL,
    [Source]             VARCHAR (1)     NULL,
    [MinShowPrice]       MONEY           NOT NULL,
    [MaxShowPrice]       MONEY           NOT NULL,
    [FreightTemplateId]  INT             NOT NULL,
    [FirstCommission]    DECIMAL (18, 2) NOT NULL,
    [SecondCommission]   DECIMAL (18, 2) NOT NULL,
    [ThirdCommission]    DECIMAL (18, 2) NOT NULL,
    [IsSetCommission]    BIT             NOT NULL,
    [CubicMeter]         DECIMAL (18, 2) NOT NULL,
    [FreightWeight]      DECIMAL (18, 2) NOT NULL,
    [ProductShortName]   NVARCHAR (50)   NULL,
    CONSTRAINT [PK_Hishop_Products] PRIMARY KEY NONCLUSTERED ([ProductId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE CLUSTERED INDEX [Hishop_Products_Index]
    ON [dbo].[Hishop_Products]([DisplaySequence] ASC)
    ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_Products_Index2]
    ON [dbo].[Hishop_Products]([MainCategoryPath] ASC)
    ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_Products_Index3]
    ON [dbo].[Hishop_Products]([ExtendCategoryPath] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ProductTag] (
    [TagId]     INT NOT NULL,
    [ProductId] INT NOT NULL,
    CONSTRAINT [PK_Hishop_ProductTag] PRIMARY KEY CLUSTERED ([TagId] ASC, [ProductId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ProductTypeBrands] (
    [ProductTypeId] INT NOT NULL,
    [BrandId]       INT NOT NULL,
    CONSTRAINT [PK_Hishop_ProductTypeBrands] PRIMARY KEY CLUSTERED ([ProductTypeId] ASC, [BrandId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ProductTypes] (
    [TypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [TypeName] NVARCHAR (50)  NOT NULL,
    [Remark]   NVARCHAR (200) NULL,
    CONSTRAINT [PK_Hishop_ProductTypes] PRIMARY KEY CLUSTERED ([TypeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PromotionGame] (
    [GameId]                 INT             IDENTITY (1, 1) NOT NULL,
    [GameType]               INT             NOT NULL,
    [GameTitle]              NVARCHAR (200)  NOT NULL,
    [Description]            NVARCHAR (1000) NULL,
    [BeginTime]              DATETIME        NOT NULL,
    [EndTime]                DATETIME        NOT NULL,
    [ApplyMembers]           VARCHAR (50)    NOT NULL,
    [NeedPoint]              INT             NOT NULL,
    [GivePoint]              INT             NOT NULL,
    [OnlyGiveNotPrizeMember] BIT             NOT NULL,
    [PlayType]               INT             NOT NULL,
    [NotPrzeDescription]     NVARCHAR (1000) NULL,
    [GameUrl]                NVARCHAR (150)  NULL,
    [GameQRCodeAddress]      NVARCHAR (150)  NULL,
    [Status]                 INT             NOT NULL,
    [KeyWork]                VARCHAR (100)   NULL,
    [LimitEveryDay]          INT             NOT NULL,
    [MaximumDailyLimit]      INT             NOT NULL,
    [PrizeRate]              FLOAT (2)       NOT NULL,
    [MemberCheck]            INT             NOT NULL,
    [DefualtGroup]           VARCHAR (50)    NOT NULL,
    [CustomGroup]            VARCHAR (500)   NOT NULL,
    CONSTRAINT [PK_Hishop_PromotionGame] PRIMARY KEY CLUSTERED ([GameId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PromotionGamePrizes] (
    [PrizeId]             INT            IDENTITY (1, 1) NOT NULL,
    [GameId]              INT            NOT NULL,
    [PrizeGrade]          INT            NOT NULL,
    [PrizeType]           INT            NOT NULL,
    [GivePoint]           INT            NULL,
    [GiveCouponId]        VARCHAR (100)  NULL,
    [GiveShopBookId]      VARCHAR (100)  NULL,
    [GriveShopBookPicUrl] VARCHAR (200)  NULL,
    [PrizeCount]          INT            NOT NULL,
    [PrizeRate]           INT            NOT NULL,
    [PrizeName]           NVARCHAR (100) NOT NULL,
    [Prize]               NVARCHAR (100) NOT NULL,
    [IsLogistics]         INT            NOT NULL,
    [PrizeImage]          VARCHAR (500)  NOT NULL,
    CONSTRAINT [PK_Hishop_PromotionGamePrizes] PRIMARY KEY CLUSTERED ([PrizeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PromotionGameResultMembersLog] (
    [LogId]    INT      IDENTITY (1, 1) NOT NULL,
    [GameId]   INT      NOT NULL,
    [PrizeId]  INT      NOT NULL,
    [UserId]   INT      NOT NULL,
    [PlayTime] DATETIME NOT NULL,
    [IsUsed]   BIT      NOT NULL,
    CONSTRAINT [PK_Hishop_PromotionGameResultMembersLog] PRIMARY KEY CLUSTERED ([LogId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_PromotionWinningPool] (
    [WinningPoolId] INT IDENTITY (1, 1) NOT NULL,
    [GameId]        INT NOT NULL,
    [Number]        INT NOT NULL,
    [GamePrizeId]   INT NOT NULL,
    [IsReceive]     INT NOT NULL,
    CONSTRAINT [PK_Hishop_PromotionWinningPool] PRIMARY KEY CLUSTERED ([WinningPoolId] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_ShareActivity] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [CouponId]     INT             NOT NULL,
    [BeginDate]    DATETIME        NOT NULL,
    [EndDate]      DATETIME        NOT NULL,
    [MeetValue]    DECIMAL (10, 2) NOT NULL,
    [CouponNumber] INT             NOT NULL,
    [CouponName]   NVARCHAR (50)   NOT NULL,
    [ActivityName] NVARCHAR (50)   NULL,
    [ImgUrl]       VARCHAR (500)   NULL,
    [ShareTitle]   NVARCHAR (50)   NULL,
    [Description]  NTEXT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Hishop_ShareActivity_Record] (
    [id]         INT IDENTITY (1, 1) NOT NULL,
    [shareId]    INT NOT NULL,
    [shareUser]  INT NOT NULL,
    [attendUser] INT NULL,
    CONSTRAINT [PK_Hishop_ShareActivity_Record] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Shippers] (
    [ShipperId]         INT            IDENTITY (1, 1) NOT NULL,
    [DistributorUserId] INT            NOT NULL,
    [IsDefault]         BIT            NOT NULL,
    [ShipperTag]        NVARCHAR (50)  NOT NULL,
    [ShipperName]       NVARCHAR (50)  NOT NULL,
    [RegionId]          INT            NOT NULL,
    [Address]           NVARCHAR (300) NOT NULL,
    [CellPhone]         NVARCHAR (20)  NULL,
    [TelPhone]          NVARCHAR (20)  NULL,
    [Zipcode]           NVARCHAR (20)  NOT NULL,
    [Remark]            NVARCHAR (300) NULL,
    CONSTRAINT [PK_Hishop_Shippers] PRIMARY KEY CLUSTERED ([ShipperId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_ShoppingCarts] (
    [UserId]                INT            NOT NULL,
    [SkuId]                 NVARCHAR (100) NOT NULL,
    [Quantity]              INT            NOT NULL,
    [AddTime]               DATETIME       NOT NULL,
    [CategoryId]            INT            NULL,
    [Templateid]            INT            NULL,
    [Type]                  INT            NOT NULL,
    [ExchangeId]            INT            NULL,
    [LimitedTimeDiscountId] INT            NOT NULL,
    CONSTRAINT [PK_Hishop_ShoppingCarts] PRIMARY KEY CLUSTERED ([UserId] ASC, [SkuId] ASC, [LimitedTimeDiscountId] ASC, [Type] ASC)
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_SKUItems] (
    [SkuId]       NVARCHAR (100) NOT NULL,
    [AttributeId] INT            NOT NULL,
    [ValueId]     INT            NOT NULL,
    CONSTRAINT [PK_Hishop_SKUItems] PRIMARY KEY CLUSTERED ([SkuId] ASC, [AttributeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_SKUMemberPrice] (
    [SkuId]           NVARCHAR (100) NOT NULL,
    [GradeId]         INT            NOT NULL,
    [MemberSalePrice] MONEY          NOT NULL,
    CONSTRAINT [PK_Hishop_SKUMemberPrice] PRIMARY KEY CLUSTERED ([SkuId] ASC, [GradeId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_SKUs] (
    [SkuId]     NVARCHAR (100) NOT NULL,
    [ProductId] INT            NOT NULL,
    [SKU]       NVARCHAR (50)  NULL,
    [Weight]    MONEY          NULL,
    [Stock]     INT            NOT NULL,
    [CostPrice] MONEY          NULL,
    [SalePrice] MONEY          NOT NULL,
    CONSTRAINT [PK_Hishop_SKUs] PRIMARY KEY CLUSTERED ([SkuId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [Hishop_SKUs_Index2]
    ON [dbo].[Hishop_SKUs]([ProductId] ASC)
    ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Tags] (
    [TagID]   INT           IDENTITY (1, 1) NOT NULL,
    [TagName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Hishop_Tags] PRIMARY KEY NONCLUSTERED ([TagID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_TemplateRelatedShipping] (
    [ModeId]             INT            NOT NULL,
    [ExpressCompanyName] NVARCHAR (500) NULL
);
GO
CREATE TABLE [dbo].[Hishop_TempSendCouponUserLists] (
    [UserId]  INT NULL,
    [AdminId] INT NULL
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_UserGroupSet] (
    [ActiveDay] INT NOT NULL
);
GO
CREATE TABLE [dbo].[Hishop_UserShippingAddresses] (
    [RegionId]   INT            NOT NULL,
    [ShippingId] INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     INT            NOT NULL,
    [ShipTo]     NVARCHAR (50)  NOT NULL,
    [Address]    NVARCHAR (500) NOT NULL,
    [Zipcode]    NVARCHAR (20)  NOT NULL,
    [TelPhone]   NVARCHAR (20)  NULL,
    [CellPhone]  NVARCHAR (20)  NULL,
    [IsDefault]  BIT            NOT NULL,
    CONSTRAINT [PK_Hishop_UserShippingAddresses] PRIMARY KEY CLUSTERED ([ShippingId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_UserSign] (
    [ID]        INT      IDENTITY (1, 1) NOT NULL,
    [UserID]    INT      NOT NULL,
    [SignDay]   DATETIME NOT NULL,
    [Continued] INT      NULL,
    [Stage]     INT      NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_VoteItems] (
    [VoteId]       BIGINT         NOT NULL,
    [VoteItemId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [VoteItemName] NVARCHAR (100) NOT NULL,
    [ItemCount]    INT            NOT NULL,
    CONSTRAINT [PK_Hishop_VoteItems] PRIMARY KEY NONCLUSTERED ([VoteItemId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_VoteRecord] (
    [UserId] INT    NOT NULL,
    [VoteId] BIGINT NOT NULL,
    CONSTRAINT [PK_Hishop_VoteRecord] PRIMARY KEY NONCLUSTERED ([UserId] ASC, [VoteId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Votes] (
    [VoteId]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [VoteName]     NVARCHAR (100) NOT NULL,
    [IsBackup]     BIT            NOT NULL,
    [MaxCheck]     INT            NOT NULL,
    [ImageUrl]     NVARCHAR (500) NULL,
    [StartDate]    DATETIME       NOT NULL,
    [EndDate]      DATETIME       NOT NULL,
    [Description]  NTEXT          NULL,
    [MemberGrades] VARCHAR (500)  NULL,
    [DefualtGroup] VARCHAR (50)   NOT NULL,
    [CustomGroup]  VARCHAR (500)  NOT NULL,
    [IsMultiCheck] BIT            NULL,
    CONSTRAINT [PK_Hishop_Votes] PRIMARY KEY NONCLUSTERED ([VoteId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Hishop_Votes_Question] (
    [QuestionId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]      NVARCHAR (500) NOT NULL,
    [VoteId]     BIGINT         NOT NULL,
    PRIMARY KEY CLUSTERED ([QuestionId] ASC)
);
GO
CREATE TABLE [dbo].[MeiQia_Userver] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [unit]     NVARCHAR (50) NULL,
    [userver]  NVARCHAR (50) NULL,
    [password] VARCHAR (50)  NULL,
    [nickname] NVARCHAR (20) NULL,
    [realname] NVARCHAR (20) NULL,
    [level]    VARCHAR (10)  NULL,
    [tel]      VARCHAR (20)  NULL,
    CONSTRAINT [PK_MeiQia_Userver] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Taobao_Products] (
    [Cid]           BIGINT          NOT NULL,
    [StuffStatus]   NVARCHAR (10)   NULL,
    [ProductId]     INT             NOT NULL,
    [ProTitle]      NVARCHAR (200)  NOT NULL,
    [Num]           BIGINT          NOT NULL,
    [LocationState] NVARCHAR (10)   NOT NULL,
    [LocationCity]  NVARCHAR (10)   NOT NULL,
    [FreightPayer]  NVARCHAR (10)   NOT NULL,
    [PostFee]       MONEY           NULL,
    [ExpressFee]    MONEY           NULL,
    [EMSFee]        MONEY           NULL,
    [HasInvoice]    BIT             NOT NULL,
    [HasWarranty]   BIT             NOT NULL,
    [HasDiscount]   BIT             NOT NULL,
    [ValidThru]     BIGINT          NOT NULL,
    [ListTime]      DATETIME        NULL,
    [PropertyAlias] NVARCHAR (4000) NULL,
    [InputPids]     NVARCHAR (2000) NULL,
    [InputStr]      NVARCHAR (2000) NULL,
    [SkuProperties] NVARCHAR (4000) NULL,
    [SkuQuantities] NVARCHAR (2000) NULL,
    [SkuPrices]     NVARCHAR (2000) NULL,
    [SkuOuterIds]   NVARCHAR (2000) NULL,
    CONSTRAINT [PK_Taobao_Products] PRIMARY KEY NONCLUSTERED ([ProductId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Activity] (
    [ActivityId]  INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (200)  COLLATE Chinese_PRC_CI_AS NULL,
    [Description] NVARCHAR (500)  COLLATE Chinese_PRC_CI_AS NULL,
    [StartDate]   DATETIME        NULL,
    [EndDate]     DATETIME        NULL,
    [CloseRemark] NVARCHAR (1000) COLLATE Chinese_PRC_CI_AS NULL,
    [Keys]        NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    [MaxValue]    NCHAR (10)      COLLATE Chinese_PRC_CI_AS NULL,
    [PicUrl]      NVARCHAR (300)  COLLATE Chinese_PRC_CI_AS NULL,
    [Item1]       NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    [Item2]       NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    [Item3]       NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    [Item4]       NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    [Item5]       NVARCHAR (50)   COLLATE Chinese_PRC_CI_AS NULL,
    CONSTRAINT [PK_vshop_Activity] PRIMARY KEY CLUSTERED ([ActivityId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_ActivitySignUp] (
    [ActivitySignUpId] INT            IDENTITY (1, 1) NOT NULL,
    [ActivityId]       INT            NULL,
    [UserId]           INT            NULL,
    [UserName]         NVARCHAR (256) COLLATE Chinese_PRC_CI_AS NULL,
    [RealName]         NVARCHAR (50)  COLLATE Chinese_PRC_CI_AS NULL,
    [SignUpDate]       DATETIME       NULL,
    [Item1]            NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [Item2]            NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [Item3]            NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [Item4]            NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [Item5]            NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    CONSTRAINT [PK_vshop_ActivitySignUp] PRIMARY KEY CLUSTERED ([ActivitySignUpId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_AlarmNotify] (
    [AlarmNotifyId] INT             IDENTITY (1, 1) NOT NULL,
    [AppId]         NVARCHAR (100)  NULL,
    [ErrorType]     INT             NULL,
    [Description]   NVARCHAR (500)  NULL,
    [AlarmContent]  NVARCHAR (2000) NULL,
    [TimeStamp]     DATETIME        NULL,
    CONSTRAINT [PK_Hishop_AlarmNotify] PRIMARY KEY NONCLUSTERED ([AlarmNotifyId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_AliFuwuReply] (
    [ReplyId]      INT            IDENTITY (1, 1) NOT NULL,
    [Keys]         NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [MatchType]    INT            NULL,
    [ReplyType]    INT            NULL,
    [MessageType]  INT            NULL,
    [IsDisable]    BIT            NULL,
    [LastEditDate] DATETIME       NOT NULL,
    [LastEditor]   NVARCHAR (255) COLLATE Chinese_PRC_CI_AS NULL,
    [Content]      NTEXT          NULL,
    [Type]         INT            NULL,
    [ActivityId]   INT            NULL,
    [ArticleID]    INT            NOT NULL,
    CONSTRAINT [PK_vshopAliFuwuReply] PRIMARY KEY CLUSTERED ([ReplyId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_AlipayActiveOpendId] (
    [AliOpenID] VARCHAR (128) NOT NULL,
    [PubTime]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([AliOpenID] ASC)
);
GO
CREATE TABLE [dbo].[vshop_Article] (
    [ArticleId]   INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50)  NULL,
    [ArticleType] INT            NOT NULL,
    [LinkType]    INT            NOT NULL,
    [Content]     NTEXT          NULL,
    [ImageUrl]    NVARCHAR (255) NULL,
    [Url]         NVARCHAR (255) NULL,
    [Memo]        NVARCHAR (255) NULL,
    [PubTime]     DATETIME       NOT NULL,
    [mediaid]     VARCHAR (100)  NULL,
    [IsShare]     BIT            NOT NULL,
    CONSTRAINT [PK_vshop_Article] PRIMARY KEY CLUSTERED ([ArticleId] ASC) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_ArticleItems] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [ArticleId] INT            NOT NULL,
    [Title]     NVARCHAR (50)  NULL,
    [Content]   NTEXT          NULL,
    [ImageUrl]  NVARCHAR (255) NULL,
    [Url]       NVARCHAR (255) NULL,
    [LinkType]  INT            NOT NULL,
    [PubTime]   DATETIME       NOT NULL,
    [mediaid]   VARCHAR (100)  NULL,
    CONSTRAINT [PK_vshop_ArticleItems] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_CustomGrouping] (
    [Id]         INT             IDENTITY (1, 1) NOT NULL,
    [GroupName]  NVARCHAR (50)   NOT NULL,
    [UserCount]  INT             NOT NULL,
    [Memo]       NVARCHAR (2000) NULL,
    [UpdateTime] DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Vshop_CustomGroupingUser] (
    [GroupId]    INT      NOT NULL,
    [UserId]     INT      NOT NULL,
    [UpdateTime] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([GroupId] ASC, [UserId] ASC)
);
GO
CREATE TABLE [dbo].[vshop_FeedBackNotify] (
    [FeedBackNotifyID] INT             IDENTITY (1, 1) NOT NULL,
    [AppId]            NVARCHAR (100)  NULL,
    [TimeStamp]        DATETIME        NULL,
    [OpenId]           NVARCHAR (100)  NULL,
    [MsgType]          NVARCHAR (20)   NULL,
    [FeedBackId]       NVARCHAR (255)  NULL,
    [TransId]          NVARCHAR (255)  NULL,
    [Reason]           NVARCHAR (1000) NULL,
    [Solution]         NVARCHAR (1000) NULL,
    [ExtInfo]          NVARCHAR (1000) NULL,
    CONSTRAINT [PK_Hishop_FeedBackNotify] PRIMARY KEY NONCLUSTERED ([FeedBackNotifyID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_FollowUsers] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [OpenId]     VARCHAR (100) NOT NULL,
    [FollowTime] DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[Vshop_HomeProducts] (
    [ProductId]       INT NOT NULL,
    [DisplaySequence] INT NULL
);
GO
CREATE TABLE [dbo].[Vshop_HomeTopics] (
    [TopicId]         INT NOT NULL,
    [DisplaySequence] INT NULL
);
GO
CREATE TABLE [dbo].[vshop_IntegralDetail] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [IntegralSourceType] INT           NOT NULL,
    [IntegralSource]     VARCHAR (100) NOT NULL,
    [IntegralChange]     MONEY         NOT NULL,
    [Remark]             VARCHAR (500) NULL,
    [Userid]             INT           NOT NULL,
    [GoToUrl]            VARCHAR (100) NULL,
    [TrateTime]          DATETIME      NOT NULL,
    [IntegralStatus]     INT           NULL,
    CONSTRAINT [PK_IntegralDetail] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Menu] (
    [MenuId]          INT            IDENTITY (1, 1) NOT NULL,
    [ParentMenuId]    INT            NULL,
    [Name]            NVARCHAR (50)  COLLATE Chinese_PRC_CI_AS NULL,
    [Type]            NVARCHAR (50)  COLLATE Chinese_PRC_CI_AS NULL,
    [ReplyId]         INT            NULL,
    [DisplaySequence] INT            NULL,
    [Bind]            INT            NULL,
    [Content]         NVARCHAR (300) COLLATE Chinese_PRC_CI_AS NULL,
    CONSTRAINT [PK_vshop_Menu] PRIMARY KEY CLUSTERED ([MenuId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Menu_Fuwu] (
    [MenuId]          INT            IDENTITY (1, 1) NOT NULL,
    [ParentMenuId]    INT            NULL,
    [Name]            NVARCHAR (50)  COLLATE Chinese_PRC_CI_AS NULL,
    [Type]            NVARCHAR (50)  COLLATE Chinese_PRC_CI_AS NULL,
    [ReplyId]         INT            NULL,
    [DisplaySequence] INT            NULL,
    [Bind]            INT            NULL,
    [Content]         NVARCHAR (300) COLLATE Chinese_PRC_CI_AS NULL,
    CONSTRAINT [PK_vshop_Menu_fuwu] PRIMARY KEY CLUSTERED ([MenuId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Message] (
    [ReplyId]     INT             NULL,
    [MsgID]       INT             IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (200)  NULL,
    [ImageUrl]    NVARCHAR (255)  NULL,
    [Url]         NVARCHAR (255)  NULL,
    [Description] NVARCHAR (1000) NULL,
    [Content]     NTEXT           NULL,
    CONSTRAINT [PK_Hishop_Message] PRIMARY KEY NONCLUSTERED ([MsgID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[VShop_NavMenu] (
    [MenuId]          INT           IDENTITY (1, 1) NOT NULL,
    [ParentMenuId]    INT           NULL,
    [Name]            VARCHAR (50)  NULL,
    [Type]            VARCHAR (50)  NULL,
    [DisplaySequence] INT           NULL,
    [Content]         VARCHAR (500) NULL,
    [ShopMenuPic]     VARCHAR (100) NULL,
    CONSTRAINT [PK_VShop_NavMenu] PRIMARY KEY CLUSTERED ([MenuId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_OneyuanTao_Detail] (
    [ActivityId]     VARCHAR (50)   NOT NULL,
    [IsOn]           BIT            NOT NULL,
    [Title]          NVARCHAR (30)  NOT NULL,
    [StartTime]      DATETIME       NOT NULL,
    [EndTime]        DATETIME       NOT NULL,
    [HeadImgage]     VARCHAR (300)  NOT NULL,
    [ReachType]      INT            NOT NULL,
    [ActivityDec]    NVARCHAR (100) NOT NULL,
    [ProductId]      INT            NOT NULL,
    [ProductPrice]   MONEY          NOT NULL,
    [ProductImg]     VARCHAR (300)  NOT NULL,
    [ProductTitle]   NVARCHAR (200) NOT NULL,
    [SkuId]          NVARCHAR (100) NOT NULL,
    [PrizeNumber]    INT            NOT NULL,
    [EachPrice]      MONEY          NOT NULL,
    [EachCanBuyNum]  INT            NOT NULL,
    [FitMember]      VARCHAR (500)  NOT NULL,
    [DefualtGroup]   VARCHAR (50)   NOT NULL,
    [CustomGroup]    VARCHAR (500)  NOT NULL,
    [ReachNum]       INT            NOT NULL,
    [PrizeTime]      DATETIME       NULL,
    [FinishedNum]    INT            NOT NULL,
    [IsEnd]          BIT            NOT NULL,
    [IsAllRefund]    BIT            NOT NULL,
    [PrizeCountInfo] TEXT           NULL,
    [HasCalculate]   BIT            NOT NULL,
    [IsSuccess]      BIT            NOT NULL,
    CONSTRAINT [PK__tmp_ms_x__45F4A7916EAB62A3] PRIMARY KEY CLUSTERED ([ActivityId] DESC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember] (
    [Pid]           VARCHAR (50)   NOT NULL,
    [UserId]        INT            NOT NULL,
    [BuyTime]       DATETIME       NOT NULL,
    [BuyNum]        INT            NOT NULL,
    [IsPay]         BIT            NOT NULL,
    [ActivityId]    VARCHAR (50)   NOT NULL,
    [SkuId]         VARCHAR (100)  NOT NULL,
    [SkuIdStr]      VARCHAR (100)  NULL,
    [ProductPrice]  DECIMAL (18)   NOT NULL,
    [PayTime]       DATETIME       NULL,
    [PayWay]        VARCHAR (50)   NULL,
    [PayNum]        VARCHAR (50)   NULL,
    [Remark]        NVARCHAR (300) NULL,
    [TotalPrice]    MONEY          NOT NULL,
    [IsRefund]      BIT            NOT NULL,
    [RefundNum]     VARCHAR (50)   NULL,
    [RefundTime]    DATETIME       NULL,
    [RefundErr]     BIT            NOT NULL,
    [IsWin]         BIT            NOT NULL,
    [WinIds]        VARCHAR (100)  NULL,
    [WinTime]       DATETIME       NULL,
    [out_refund_no] VARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([Pid] ASC)
);
GO
CREATE NONCLUSTERED INDEX [IX_Vshop_OneyuanTao_ParticipantMember_Column]
    ON [dbo].[Vshop_OneyuanTao_ParticipantMember]([UserId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_Vshop_OneyuanTao_ParticipantMember_Column_1]
    ON [dbo].[Vshop_OneyuanTao_ParticipantMember]([ActivityId] ASC);
GO
CREATE TABLE [dbo].[Vshop_OneyuanTao_WinningRecord] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [UserId]     INT          NOT NULL,
    [ActivityId] VARCHAR (50) NOT NULL,
    [Pid]        VARCHAR (50) NOT NULL,
    [PrizeNum]   VARCHAR (20) NOT NULL,
    [IsWin]      BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE NONCLUSTERED INDEX [IX_Vshop_OneyuanTao_WinningRecord_Column]
    ON [dbo].[Vshop_OneyuanTao_WinningRecord]([ActivityId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_Vshop_OneyuanTao_WinningRecord_Column_1]
    ON [dbo].[Vshop_OneyuanTao_WinningRecord]([UserId] ASC);
GO
CREATE TABLE [dbo].[vshop_OrderRedPager] (
    [OrderID]              NVARCHAR (50)  NOT NULL,
    [RedPagerActivityId]   INT            NOT NULL,
    [RedPagerActivityName] NVARCHAR (100) NOT NULL,
    [MaxGetTimes]          INT            NOT NULL,
    [AlreadyGetTimes]      INT            NOT NULL,
    [ItemAmountLimit]      MONEY          NOT NULL,
    [OrderAmountCanUse]    MONEY          NOT NULL,
    [ExpiryDays]           INT            NOT NULL,
    [UserID]               INT            NOT NULL,
    CONSTRAINT [PK_vshop_OrderRedPager] PRIMARY KEY CLUSTERED ([OrderID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_OrderSplit] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [OrderIDNum]      INT            NOT NULL,
    [OldOrderID]      NVARCHAR (50)  NOT NULL,
    [ItemList]        VARCHAR (2000) NOT NULL,
    [UpdateTime]      DATETIME       NOT NULL,
    [AdjustedFreight] MONEY          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[VShop_Region] (
    [RegionId]   INT          NOT NULL,
    [RegionName] VARCHAR (50) NULL,
    CONSTRAINT [PK_VShop_Region] PRIMARY KEY CLUSTERED ([RegionId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Reply] (
    [ReplyId]      INT            IDENTITY (1, 1) NOT NULL,
    [Keys]         NVARCHAR (200) COLLATE Chinese_PRC_CI_AS NULL,
    [MatchType]    INT            NULL,
    [ReplyType]    INT            NULL,
    [MessageType]  INT            NULL,
    [IsDisable]    BIT            NULL,
    [LastEditDate] DATETIME       NOT NULL,
    [LastEditor]   NVARCHAR (255) COLLATE Chinese_PRC_CI_AS NULL,
    [Content]      NTEXT          NULL,
    [Type]         INT            NULL,
    [ActivityId]   INT            NULL,
    [ArticleID]    INT            NOT NULL,
    CONSTRAINT [PK_vshop_Reply] PRIMARY KEY CLUSTERED ([ReplyId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_ScanOpenID] (
    [AutoID]              INT           IDENTITY (1, 1) NOT NULL,
    [ScanDate]            DATETIME      NULL,
    [AppID]               VARCHAR (200) NULL,
    [SCannerUserOpenID]   VARCHAR (200) NULL,
    [SCannerUserNickName] VARCHAR (200) NULL,
    CONSTRAINT [PK_vshop_ScanOpenID] PRIMARY KEY CLUSTERED ([AutoID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_ScanSceneInfos] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Platform]       VARCHAR (10)   NOT NULL,
    [Sceneid]        NCHAR (10)     NOT NULL,
    [BindUserId]     VARCHAR (50)   NOT NULL,
    [DescInfo]       NVARCHAR (100) NOT NULL,
    [type]           INT            NOT NULL,
    [CreateTime]     DATETIME       NOT NULL,
    [CodeUrl]        VARCHAR (300)  NULL,
    [LastActiveTime] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
CREATE TABLE [dbo].[vshop_SendRedpackRecord] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [BalanceDrawRequestID] INT            NOT NULL,
    [UserID]               INT            NOT NULL,
    [OpenId]               NVARCHAR (128) NOT NULL,
    [Amount]               INT            NOT NULL,
    [ActName]              NVARCHAR (32)  NULL,
    [Wishing]              NVARCHAR (128) NULL,
    [ClientIP]             VARCHAR (20)   NULL,
    [IsSend]               BIT            NOT NULL,
    [SendTime]             DATETIME       NULL
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Vshop_ShareMaterial_NineImages] (
    [id]        NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [ShareDesc] NVARCHAR (100) NULL,
    [CreatTime] DATETIME       NOT NULL,
    [image1]    NVARCHAR (255) NOT NULL,
    [image2]    NVARCHAR (255) NOT NULL,
    [image3]    NVARCHAR (255) NOT NULL,
    [image4]    NVARCHAR (255) NOT NULL,
    [image5]    NVARCHAR (255) NOT NULL,
    [image6]    NVARCHAR (255) NOT NULL,
    [image7]    NVARCHAR (255) NOT NULL,
    [image8]    NVARCHAR (255) NOT NULL,
    [image9]    NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_Vshop_ShareMaterial_NineImages] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_Distributors] (
    [RecDate]             DATETIME NOT NULL,
    [AgentID]             INT      NOT NULL,
    [OrderNumber]         INT      NOT NULL,
    [SaleAmountFee]       MONEY    NOT NULL,
    [BuyerNumber]         INT      NOT NULL,
    [BuyerAvgPrice]       MONEY    NOT NULL,
    [CommissionAmountFee] MONEY    NOT NULL,
    CONSTRAINT [PK_vshop_Statistics_Distributors] PRIMARY KEY CLUSTERED ([RecDate] ASC, [AgentID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_Globals] (
    [RecDate]                   DATETIME        NOT NULL,
    [OrderNumber]               INT             NULL,
    [SaleAmountFee]             MONEY           NULL,
    [BuyerNumber]               INT             NULL,
    [UserAvgPrice]              MONEY           NULL,
    [FXOrderNumber]             INT             NULL,
    [FXSaleAmountFee]           MONEY           NULL,
    [FXResultPercent]           NUMERIC (18, 3) NULL,
    [CommissionFee]             MONEY           NULL,
    [NewMemberNumber]           INT             NULL,
    [NewAgentNumber]            INT             NULL,
    [FinishedDrawCommissionFee] MONEY           NULL,
    [WaitDrawCommissionFee]     MONEY           NULL,
    CONSTRAINT [PK_vshop_Statistics_Globals] PRIMARY KEY CLUSTERED ([RecDate] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_Log] (
    [RecDate]        DATETIME       NOT NULL,
    [FirstCountTime] DATETIME       NULL,
    [BeginTime]      DATETIME       NULL,
    [EndTime]        DATETIME       NULL,
    [IsSuccess]      INT            NULL,
    [ErrorStep]      VARCHAR (256)  NULL,
    [LogInfo]        VARCHAR (4000) NULL,
    CONSTRAINT [PK_vshop_Statistics_Log] PRIMARY KEY CLUSTERED ([RecDate] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_NotifyLog] (
    [AutoID]     INT           IDENTITY (1, 1) NOT NULL,
    [RecDate]    DATETIME      NULL,
    [TaskTime]   DATETIME      NULL,
    [FuncAction] INT           NULL,
    [ActionDesc] VARCHAR (255) NULL,
    CONSTRAINT [PK_vshop_Statistics_NotifyLog] PRIMARY KEY CLUSTERED ([AutoID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_Products] (
    [RecDate]        DATETIME        NOT NULL,
    [ProductID]      INT             NOT NULL,
    [SaleQty]        INT             NOT NULL,
    [SaleAmountFee]  MONEY           NOT NULL,
    [TotalVisits]    INT             NOT NULL,
    [BuyerNumber]    INT             NOT NULL,
    [ConversionRate] NUMERIC (18, 3) NULL,
    CONSTRAINT [PK_vshop_Statistics_Goods] PRIMARY KEY CLUSTERED ([RecDate] ASC, [ProductID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[vshop_Statistics_ProductsVisits] (
    [RecDate]     DATETIME NOT NULL,
    [ProductID]   INT      NOT NULL,
    [TotalVisits] INT      NOT NULL,
    CONSTRAINT [PK_vshop_Statistics_GoodsVisits] PRIMARY KEY CLUSTERED ([RecDate] ASC, [ProductID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Weibo_Menu] (
    [MenuId]          INT           IDENTITY (1, 1) NOT NULL,
    [ParentMenuId]    INT           NULL,
    [Name]            VARCHAR (50)  NULL,
    [Type]            VARCHAR (50)  NULL,
    [DisplaySequence] INT           NULL,
    [Content]         VARCHAR (500) NULL,
    CONSTRAINT [PK_Weibo_Menu] PRIMARY KEY CLUSTERED ([MenuId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Weibo_Message] (
    [MessageId]     INT            IDENTITY (1, 1) NOT NULL,
    [Type]          VARCHAR (50)   NOT NULL,
    [Receiver_id]   VARCHAR (50)   NOT NULL,
    [Sender_id]     VARCHAR (50)   NOT NULL,
    [Created_at]    DATETIME       NOT NULL,
    [Text]          VARCHAR (1000) NULL,
    [Vfid]          VARCHAR (50)   NULL,
    [Tovfid]        VARCHAR (50)   NULL,
    [Status]        INT            NOT NULL,
    [SenderMessage] VARCHAR (1000) NULL,
    [SenderDate]    DATETIME       NULL,
    [Display_Name]  VARCHAR (100)  NULL,
    [Summary]       VARCHAR (1000) NULL,
    [Image]         VARCHAR (255)  NULL,
    [Url]           VARCHAR (255)  NULL,
    [ArticleId]     INT            NULL,
    [Access_Token]  VARCHAR (70)   NULL,
    CONSTRAINT [PK_Weibo_Message] PRIMARY KEY CLUSTERED ([MessageId] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[Weibo_Reply] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [ReplyKeyId]   INT           NULL,
    [ArticleId]    INT           NULL,
    [IsDisable]    BIT           NOT NULL,
    [EditDate]     DATETIME      NULL,
    [Content]      NTEXT         NULL,
    [Type]         INT           NOT NULL,
    [ReceiverType] VARCHAR (50)  NOT NULL,
    [Displayname]  VARCHAR (500) NULL,
    [Summary]      VARCHAR (500) NULL,
    [Image]        VARCHAR (500) NULL,
    [Url]          VARCHAR (500) NULL,
    CONSTRAINT [PK_Weibo_Reply] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE TABLE [dbo].[Weibo_ReplyKeys] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [Keys]     NVARCHAR (200) NOT NULL,
    [Type]     INT            NOT NULL,
    [Matching] INT            NOT NULL,
    CONSTRAINT [PK_Weibo_ReplyKeys] PRIMARY KEY CLUSTERED ([Id] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[WeiXin_RecentOpenID] (
    [OpenID]  VARCHAR (128) NOT NULL,
    [PubTime] DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([OpenID] ASC)
);
GO
CREATE TABLE [dbo].[WeiXin_SendAll] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [Title]          NVARCHAR (50)   NULL,
    [MessageType]    INT             NOT NULL,
    [ArticleID]      INT             NOT NULL,
    [Content]        NVARCHAR (4000) NULL,
    [SendState]      INT             NOT NULL,
    [SendTime]       DATETIME        NOT NULL,
    [SendCount]      INT             NOT NULL,
    [msgid]          VARCHAR (50)    NULL,
    [TotalCount]     INT             NOT NULL,
    [ReturnJsonData] NVARCHAR (1000) NULL,
    [platform]       INT             NOT NULL,
    CONSTRAINT [PK_WeiXin_SendAll] PRIMARY KEY CLUSTERED ([ID] ASC) ON [PRIMARY]
) ON [PRIMARY];
GO
ALTER TABLE [dbo].[aspnet_DistributorGrade]
    ADD DEFAULT (0) FOR [FirstCommissionRise];
GO
ALTER TABLE [dbo].[aspnet_DistributorGrade]
    ADD DEFAULT (0) FOR [SecondCommissionRise];
GO
ALTER TABLE [dbo].[aspnet_DistributorGrade]
    ADD DEFAULT (0) FOR [ThirdCommissionRise];
GO
ALTER TABLE [dbo].[aspnet_DistributorGrade]
    ADD DEFAULT ('/utility/pics/grade.png') FOR [Ico];
GO
ALTER TABLE [dbo].[aspnet_DistributorGrade]
    ADD DEFAULT 0 FOR [AddCommission];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_CreateTime] DEFAULT (getdate()) FOR [CreateTime];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_OrdersTotal] DEFAULT (0) FOR [OrdersTotal];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_ReferralBlance] DEFAULT (0) FOR [ReferralBlance];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_ReferralOrders] DEFAULT (0) FOR [ReferralOrders];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_ReferralRequestBalance] DEFAULT (0) FOR [ReferralRequestBalance];
GO
ALTER TABLE [dbo].[aspnet_Distributors]
    ADD CONSTRAINT [DF_aspnet_Distributors_ReferralStatus] DEFAULT (1) FOR [ReferralStatus];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 1 FOR [Status];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 0 FOR [IsFollowWeixin];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 0 FOR [IsFollowAlipay];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 0 FOR [IsAuthorizeWeiXin];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 0 FOR [TotalAmount];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD DEFAULT 0 FOR [AvailableAmount];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD CONSTRAINT [DF_aspnet_Members_Expenditure] DEFAULT ((0)) FOR [Expenditure];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD CONSTRAINT [DF_aspnet_Members_OrderNumber] DEFAULT ((0)) FOR [OrderNumber];
GO
ALTER TABLE [dbo].[aspnet_Members]
    ADD CONSTRAINT [DF_aspnet_Members_Points] DEFAULT ((0)) FOR [Points];
GO
ALTER TABLE [dbo].[aspnet_Roles]
    ADD CONSTRAINT [DF_aspnet_Roles_IsDefault] DEFAULT ((1)) FOR [IsDefault];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [ActivitiesType];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [TakeEffect];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [Type];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ('0') FOR [MemberGrades];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT '-1' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT '-1' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [attendTime];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [attendType];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((1)) FOR [isAllProduct];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [MeetMoney];
GO
ALTER TABLE [dbo].[Hishop_Activities]
    ADD DEFAULT ((0)) FOR [ReductionMoney];
GO
ALTER TABLE [dbo].[Hishop_Activities_Detail]
    ADD DEFAULT ((0)) FOR [MeetMoney];
GO
ALTER TABLE [dbo].[Hishop_Activities_Detail]
    ADD DEFAULT ((0)) FOR [ReductionMoney];
GO
ALTER TABLE [dbo].[Hishop_Activities_Detail]
    ADD DEFAULT ((0)) FOR [Integral];
GO
ALTER TABLE [dbo].[Hishop_Activities_Detail]
    ADD DEFAULT ((0)) FOR [MeetNumber];
GO
ALTER TABLE [dbo].[Hishop_Activities_Product]
    ADD DEFAULT ((0)) FOR [status];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplates]
    ADD DEFAULT 1 FOR [IsValid];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplates]
    ADD DEFAULT 99 FOR [OrderIndex];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplates]
    ADD DEFAULT '' FOR [WXOpenTM];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail]
    ADD DEFAULT 1 FOR [AllowToAdmin];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail]
    ADD DEFAULT 0 FOR [AllowToDistributor];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail]
    ADD DEFAULT 0 FOR [AllowToMember];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail]
    ADD DEFAULT 1 FOR [IsSelectedByDistributor];
GO
ALTER TABLE [dbo].[Hishop_AliFuWuMessageTemplatesDetail]
    ADD DEFAULT 1 FOR [IsSelectedByMember];
GO
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest]
    ADD CONSTRAINT [DF_Hishop_BalanceDrawRequest_IsCheck] DEFAULT (0) FOR [IsCheck];
GO
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest]
    ADD CONSTRAINT [DF_Hishop_BalanceDrawRequest_RedpackRecordNum] DEFAULT (0) FOR [RedpackRecordNum];
GO
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest]
    ADD CONSTRAINT [DF_Hishop_BalanceDrawRequest_RequestType] DEFAULT (1) FOR [RequestType];
GO
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest]
    ADD CONSTRAINT [DF_RequestTime] DEFAULT (getdate()) FOR [RequestTime];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [Status];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT getdate() FOR [CreateDate];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [BargainTypeMaxVlue];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [BargainTypeMinVlue];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [IsCommission];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [TranNumber];
GO
ALTER TABLE [dbo].[Hishop_Bargain]
    ADD DEFAULT 0 FOR [IsDelete];
GO
ALTER TABLE [dbo].[Hishop_BargainDetial]
    ADD DEFAULT 0 FOR [Number];
GO
ALTER TABLE [dbo].[Hishop_BargainDetial]
    ADD DEFAULT 0 FOR [IsDelete];
GO
ALTER TABLE [dbo].[Hishop_Categories]
    ADD CONSTRAINT [DF_Hishop_Categories_HasChildren] DEFAULT (0) FOR [HasChildren];
GO
ALTER TABLE [dbo].[Hishop_Commissions]
    ADD CONSTRAINT [DF_Hishop_Commissions_TradeTime] DEFAULT (getdate()) FOR [TradeTime];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD DEFAULT '-1' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD DEFAULT '-1' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Condi__1E6F845E] DEFAULT ((0)) FOR [ConditionValue];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Finis__24285DB4] DEFAULT ((0)) FOR [Finished];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__maxRe__251C81ED] DEFAULT ((1)) FOR [maxReceivNum];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Membe__22401542] DEFAULT ('0') FOR [MemberGrades];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Produ__2334397B] DEFAULT ((0)) FOR [ProductNumber];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Recei__2057CCD0] DEFAULT ((0)) FOR [ReceiveNum];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__Stock__1F63A897] DEFAULT ((0)) FOR [StockNum];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Coupons]
    ADD CONSTRAINT [DF__Hishop_Co__UsedN__214BF109] DEFAULT ((0)) FOR [UsedNum];
GO
ALTER TABLE [dbo].[Hishop_Coupon_Products]
    ADD CONSTRAINT [DF_Hishop_Coupon_Products_status] DEFAULT ((0)) FOR [status];
GO
ALTER TABLE [dbo].[Hishop_CouponItems]
    ADD CONSTRAINT [DF_Hishop_CouponItems_CouponStatus] DEFAULT (0) FOR [CouponStatus];
GO
ALTER TABLE [dbo].[Hishop_Coupons]
    ADD CONSTRAINT [DF_Hishop_Coupons_NeedPoint] DEFAULT ((0)) FOR [NeedPoint];
GO
ALTER TABLE [dbo].[Hishop_Coupons]
    ADD CONSTRAINT [DF_Hishop_Coupons_SentCount] DEFAULT ((0)) FOR [SentCount];
GO
ALTER TABLE [dbo].[Hishop_Coupons]
    ADD CONSTRAINT [DF_Hishop_Coupons_UsedCount] DEFAULT ((0)) FOR [UsedCount];
GO
ALTER TABLE [dbo].[Hishop_DistributorGradeCommission]
    ADD DEFAULT getdate() FOR [PubTime];
GO
ALTER TABLE [dbo].[Hishop_DistributorGradeCommission]
    ADD DEFAULT 0 FOR [OldCommissionTotal];
GO
ALTER TABLE [dbo].[Hishop_ExpressTemplates]
    ADD DEFAULT 0 FOR [IsDefault];
GO
ALTER TABLE [dbo].[Hishop_FreightTemplate_Templates]
    ADD DEFAULT 0 FOR [FreeShip];
GO
ALTER TABLE [dbo].[Hishop_HelpBargainDetial]
    ADD DEFAULT 0 FOR [BargainPrice];
GO
ALTER TABLE [dbo].[Hishop_LimitedTimeDiscount]
    ADD DEFAULT 1 FOR [Status];
GO
ALTER TABLE [dbo].[Hishop_LimitedTimeDiscountProduct]
    ADD DEFAULT 1 FOR [Status];
GO
ALTER TABLE [dbo].[Hishop_MemberAmountDetailed]
    ADD DEFAULT 0 FOR [AvailableAmount];
GO
ALTER TABLE [dbo].[Hishop_MemberAmountDetailed]
    ADD DEFAULT 0 FOR [State];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg1];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg2];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg3];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg4];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg5];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Msg6];
GO
ALTER TABLE [dbo].[Hishop_MessageAdminUserMsgList]
    ADD DEFAULT 0 FOR [Type];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplates]
    ADD DEFAULT 1 FOR [IsValid];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplates]
    ADD DEFAULT 99 FOR [OrderIndex];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplates]
    ADD DEFAULT '' FOR [WXOpenTM];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplatesDetail]
    ADD CONSTRAINT [DF_Hishop_MessageTemplatesDetail_AllowToAdmin] DEFAULT ((1)) FOR [AllowToAdmin];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplatesDetail]
    ADD CONSTRAINT [DF_Hishop_MessageTemplatesDetail_AllowToDistributor] DEFAULT ((0)) FOR [AllowToDistributor];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplatesDetail]
    ADD CONSTRAINT [DF_Hishop_MessageTemplatesDetail_IsSelectedByAdmin1] DEFAULT ((1)) FOR [IsSelectedByDistributor];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplatesDetail]
    ADD CONSTRAINT [DF_Hishop_MessageTemplatesDetail_IsSelectedByAdmin2] DEFAULT ((1)) FOR [IsSelectedByMember];
GO
ALTER TABLE [dbo].[Hishop_MessageTemplatesDetail]
    ADD CONSTRAINT [DF_Table_1_AllowToDistributor1] DEFAULT ((0)) FOR [AllowToMember];
GO
ALTER TABLE [dbo].[Hishop_Notice]
    ADD DEFAULT getdate() FOR [AddTime];
GO
ALTER TABLE [dbo].[Hishop_Notice]
    ADD DEFAULT 0 FOR [IsPub];
GO
ALTER TABLE [dbo].[Hishop_Notice]
    ADD DEFAULT 0 FOR [SendType];
GO
ALTER TABLE [dbo].[Hishop_Notice]
    ADD DEFAULT 0 FOR [SendTo];
GO
ALTER TABLE [dbo].[Hishop_NoticeRead]
    ADD DEFAULT getdate() FOR [ReadTime];
GO
ALTER TABLE [dbo].[Hishop_NoticeRead]
    ADD DEFAULT 0 FOR [NoticeIsDel];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT ((0)) FOR [IsHandled];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT ((0)) FOR [ReturnMoney];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [IsAdminModify];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [DeleteBeforeState];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [LimitedTimeDiscountId];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [ItemsCommissionScale];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [SecondItemsCommissionScale];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [ThirdItemsCommissionScale];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD DEFAULT 0 FOR [BalancePayMoney];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_OrderItems_DiscountAverage] DEFAULT ((0)) FOR [DiscountAverage];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_ItemAdjustedCommssion] DEFAULT ((0)) FOR [ItemAdjustedCommssion];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_ItemsCommission] DEFAULT ((0)) FOR [ItemsCommission];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_PointNumber] DEFAULT ((0)) FOR [PointNumber];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_SecondItemsCommission] DEFAULT ((0)) FOR [SecondItemsCommission];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_ThirdItemsCommission] DEFAULT ((0)) FOR [ThirdItemsCommission];
GO
ALTER TABLE [dbo].[Hishop_OrderItems]
    ADD CONSTRAINT [DF_Hishop_Orders_Type] DEFAULT ((0)) FOR [Type];
GO
ALTER TABLE [dbo].[Hishop_OrderReturns]
    ADD DEFAULT 0 FOR [DeleteBeforeState];
GO
ALTER TABLE [dbo].[Hishop_OrderReturns]
    ADD DEFAULT 0 FOR [OrderItemID];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [SplitState];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [DeleteBeforeState];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [ClientShortType];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [BargainDetialId];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [BalancePayMoneyTotal];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD DEFAULT 0 FOR [BalancePayFreightMoneyTotal];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_Hishop_Orders_DiscountAmount] DEFAULT ((0)) FOR [DiscountAmount];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_Hishop_Orders_FirstCommission] DEFAULT ((0)) FOR [FirstCommission];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_Hishop_Orders_SecondCommission] DEFAULT ((0)) FOR [SecondCommission];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_Hishop_Orders_ThirdCommission] DEFAULT ((0)) FOR [ThirdCommission];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_PointExchange] DEFAULT ((0)) FOR [PointExchange];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_PointToCash] DEFAULT ((0)) FOR [PointToCash];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_RedPagerAmount] DEFAULT ((0)) FOR [RedPagerAmount];
GO
ALTER TABLE [dbo].[Hishop_Orders]
    ADD CONSTRAINT [DF_RedPagerOrderAmountCanUse] DEFAULT ((0)) FOR [RedPagerOrderAmountCanUse];
GO
ALTER TABLE [dbo].[Hishop_PaymentTypes]
    ADD CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInDistributor] DEFAULT ('true') FOR [IsUseInDistributor];
GO
ALTER TABLE [dbo].[Hishop_PaymentTypes]
    ADD CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInpour] DEFAULT ('true') FOR [IsUseInpour];
GO
ALTER TABLE [dbo].[Hishop_PhotoCategories]
    ADD DEFAULT 0 FOR [TypeId];
GO
ALTER TABLE [dbo].[Hishop_PhotoGallery]
    ADD DEFAULT 0 FOR [TypeId];
GO
ALTER TABLE [dbo].[Hishop_PointExchange_Changed]
    ADD DEFAULT 0 FOR [PointNumber];
GO
ALTER TABLE [dbo].[Hishop_PointExchange_Changed]
    ADD DEFAULT '0' FOR [MemberGrades];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_PointExChanges]
    ADD DEFAULT '0' FOR [MemberGrades];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_PointExChanges]
    ADD DEFAULT '0' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_PointExChanges]
    ADD DEFAULT '0' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_PointExChanges]
    ADD DEFAULT 0 FOR [ProductNumber];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_Products]
    ADD DEFAULT 0 FOR [ProductNumber];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_Products]
    ADD DEFAULT 0 FOR [PointNumber];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_Products]
    ADD DEFAULT 0 FOR [ChangedNumber];
GO
ALTER TABLE [dbo].[Hishop_PointExChange_Products]
    ADD DEFAULT 0 FOR [eachMaxNumber];
GO
ALTER TABLE [dbo].[Hishop_PrizesDeliveryRecord]
    ADD DEFAULT 0 FOR [status];
GO
ALTER TABLE [dbo].[Hishop_PrizesDeliveryRecord]
    ADD DEFAULT 0 FOR [Pid];
GO
ALTER TABLE [dbo].[Hishop_PrizesDeliveryRecord]
    ADD DEFAULT 0 FOR [RecordType];
GO
ALTER TABLE [dbo].[Hishop_ProductReviews]
    ADD DEFAULT 0 FOR [OrderItemID];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_CubicMeter] DEFAULT (0) FOR [CubicMeter];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_DisplaySequence] DEFAULT (0) FOR [DisplaySequence];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_FirstCommission] DEFAULT (0) FOR [FirstCommission];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_FreightTemplateId] DEFAULT (0) FOR [FreightTemplateId];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_FreightWeight] DEFAULT (0) FOR [FreightWeight];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_IsSetCommission] DEFAULT (0) FOR [IsSetCommission];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_MaxShowPrice] DEFAULT (0) FOR [MaxShowPrice];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_MinShowPrice] DEFAULT (0) FOR [MinShowPrice];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_SaleCounts] DEFAULT (0) FOR [SaleCounts];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_SecondCommission] DEFAULT (0) FOR [SecondCommission];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_ShowSaleCounts] DEFAULT (0) FOR [ShowSaleCounts];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_ThirdCommission] DEFAULT (0) FOR [ThirdCommission];
GO
ALTER TABLE [dbo].[Hishop_Products]
    ADD CONSTRAINT [DF_Hishop_Products_VistiCounts] DEFAULT (0) FOR [VistiCounts];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT 0 FOR [LimitEveryDay];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT 0 FOR [MaximumDailyLimit];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT 0 FOR [PrizeRate];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT 0 FOR [MemberCheck];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT '0' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD DEFAULT '0' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD CONSTRAINT [DF_Hishop_PromotionGame_GivePoint] DEFAULT ((0)) FOR [GivePoint];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD CONSTRAINT [DF_Hishop_PromotionGame_NeedPoint] DEFAULT ((0)) FOR [NeedPoint];
GO
ALTER TABLE [dbo].[Hishop_PromotionGame]
    ADD CONSTRAINT [DF_Hishop_PromotionGame_OnlyGiveNotPrizeMember] DEFAULT ((0)) FOR [OnlyGiveNotPrizeMember];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD DEFAULT '????????????' FOR [PrizeName];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD DEFAULT '????????????' FOR [Prize];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD DEFAULT 0 FOR [IsLogistics];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD DEFAULT '/utility/pics/lipin30.png' FOR [PrizeImage];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD CONSTRAINT [DF_Hishop_PromotionGamePrizes_GivePoint] DEFAULT ((0)) FOR [GivePoint];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD CONSTRAINT [DF_Hishop_PromotionGamePrizes_PrizeCount] DEFAULT ((0)) FOR [PrizeCount];
GO
ALTER TABLE [dbo].[Hishop_PromotionGamePrizes]
    ADD CONSTRAINT [DF_Hishop_PromotionGamePrizes_PrizeRate] DEFAULT ((0)) FOR [PrizeRate];
GO
ALTER TABLE [dbo].[Hishop_PromotionGameResultMembersLog]
    ADD CONSTRAINT [DF_Hishop_PromotionGameResultMembersLog_IsUsed] DEFAULT ((0)) FOR [IsUsed];
GO
ALTER TABLE [dbo].[Hishop_PromotionGameResultMembersLog]
    ADD CONSTRAINT [DF_Hishop_PromotionGameResultMembersLog_PlayTime] DEFAULT (getdate()) FOR [PlayTime];
GO
ALTER TABLE [dbo].[Hishop_PromotionGameResultMembersLog]
    ADD CONSTRAINT [DF_Hishop_PromotionGameResultMembersLog_PrizeId] DEFAULT ((0)) FOR [PrizeId];
GO
ALTER TABLE [dbo].[Hishop_ShareActivity]
    ADD DEFAULT 1 FOR [CouponNumber];
GO
ALTER TABLE [dbo].[Hishop_Shippers]
    ADD CONSTRAINT [DF_Hishop_Shippers_DistributorUserId] DEFAULT (0) FOR [DistributorUserId];
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD DEFAULT 0 FOR [LimitedTimeDiscountId];
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD CONSTRAINT [DF_Hishop_ShoppingCarts_AddTime] DEFAULT (GETDATE()) FOR [AddTime];
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD CONSTRAINT [DF_Hishop_ShoppingCarts_CategoryId] DEFAULT ((0)) FOR [CategoryId];
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD CONSTRAINT [DF_Hishop_ShoppingCarts_Templateid] DEFAULT ((0)) FOR [Templateid];
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD CONSTRAINT [DF_Hishop_ShoppingCarts_Type] DEFAULT ((0)) FOR [Type];
GO
ALTER TABLE [dbo].[Hishop_UserGroupSet]
    ADD DEFAULT 1 FOR [ActiveDay];
GO
ALTER TABLE [dbo].[Hishop_UserShippingAddresses]
    ADD DEFAULT (0) FOR [IsDefault];
GO
ALTER TABLE [dbo].[Hishop_Votes]
    ADD DEFAULT '-1' FOR [MemberGrades];
GO
ALTER TABLE [dbo].[Hishop_Votes]
    ADD DEFAULT '-1' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Hishop_Votes]
    ADD DEFAULT '-1' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[vshop_AliFuwuReply]
    ADD CONSTRAINT [vshop_AliFuwuReply_ArticleID] DEFAULT (0) FOR [ArticleID];
GO
ALTER TABLE [dbo].[vshop_AlipayActiveOpendId]
    ADD DEFAULT getdate() FOR [PubTime];
GO
ALTER TABLE [dbo].[vshop_Article]
    ADD DEFAULT (getdate()) FOR [PubTime];
GO
ALTER TABLE [dbo].[vshop_Article]
    ADD DEFAULT 1 FOR [IsShare];
GO
ALTER TABLE [dbo].[vshop_Article]
    ADD CONSTRAINT [DF_vshop_Article_ArticleType] DEFAULT (0) FOR [ArticleType];
GO
ALTER TABLE [dbo].[vshop_Article]
    ADD CONSTRAINT [DF_vshop_Article_LinkType] DEFAULT (0) FOR [LinkType];
GO
ALTER TABLE [dbo].[vshop_ArticleItems]
    ADD CONSTRAINT [DF_vshop_ArticleItems_ArticleId] DEFAULT (0) FOR [ArticleId];
GO
ALTER TABLE [dbo].[vshop_ArticleItems]
    ADD CONSTRAINT [DF_vshop_ArticleItems_LinkType] DEFAULT (0) FOR [LinkType];
GO
ALTER TABLE [dbo].[vshop_ArticleItems]
    ADD CONSTRAINT [DF_vshop_ArticleItems_PubTime] DEFAULT (getdate()) FOR [PubTime];
GO
ALTER TABLE [dbo].[Vshop_CustomGrouping]
    ADD DEFAULT 0 FOR [UserCount];
GO
ALTER TABLE [dbo].[Vshop_CustomGrouping]
    ADD DEFAULT getdate() FOR [UpdateTime];
GO
ALTER TABLE [dbo].[Vshop_CustomGroupingUser]
    ADD DEFAULT getdate() FOR [UpdateTime];
GO
ALTER TABLE [dbo].[vshop_IntegralDetail]
    ADD CONSTRAINT [DF_TrateTime] DEFAULT (getdate()) FOR [TrateTime];
GO
ALTER TABLE [dbo].[vshop_IntegralDetail]
    ADD CONSTRAINT [DF_vshop_IntegralDetail_IntegralStatus] DEFAULT ((0)) FOR [IntegralStatus];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 1 FOR [IsOn];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT '-1' FOR [FitMember];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT '-1' FOR [DefualtGroup];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT '-1' FOR [CustomGroup];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 0 FOR [FinishedNum];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 0 FOR [IsEnd];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 0 FOR [IsAllRefund];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 0 FOR [HasCalculate];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_Detail]
    ADD DEFAULT 0 FOR [IsSuccess];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [BuyNum];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [IsPay];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [SkuId];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [ProductPrice];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [IsRefund];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [RefundErr];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_ParticipantMember]
    ADD DEFAULT 0 FOR [IsWin];
GO
ALTER TABLE [dbo].[Vshop_OneyuanTao_WinningRecord]
    ADD DEFAULT 0 FOR [IsWin];
GO
ALTER TABLE [dbo].[vshop_OrderSplit]
    ADD DEFAULT getdate() FOR [UpdateTime];
GO
ALTER TABLE [dbo].[vshop_OrderSplit]
    ADD DEFAULT 0 FOR [AdjustedFreight];
GO
ALTER TABLE [dbo].[vshop_Reply]
    ADD CONSTRAINT [DF_vshop_Reply_ArticleID] DEFAULT (0) FOR [ArticleID];
GO
ALTER TABLE [dbo].[Vshop_ScanSceneInfos]
    ADD DEFAULT '???????????????' FOR [DescInfo];
GO
ALTER TABLE [dbo].[Vshop_ScanSceneInfos]
    ADD DEFAULT 0 FOR [type];
GO
ALTER TABLE [dbo].[vshop_SendRedpackRecord]
    ADD DEFAULT (0) FOR [IsSend];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [CreatTime];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image1];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image2];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image3];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image4];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image5];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image6];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image7];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image8];
GO
ALTER TABLE [dbo].[Vshop_ShareMaterial_NineImages]
    ADD DEFAULT '' FOR [image9];
GO
ALTER TABLE [dbo].[vshop_Statistics_Distributors]
    ADD CONSTRAINT [DF_vshop_Statistics_Distributors_BuyerAvgPrice] DEFAULT ((0)) FOR [BuyerAvgPrice];
GO
ALTER TABLE [dbo].[vshop_Statistics_Distributors]
    ADD CONSTRAINT [DF_vshop_Statistics_Distributors_BuyerNumber] DEFAULT ((0)) FOR [BuyerNumber];
GO
ALTER TABLE [dbo].[vshop_Statistics_Distributors]
    ADD CONSTRAINT [DF_vshop_Statistics_Distributors_CommissionAmountFee] DEFAULT ((0)) FOR [CommissionAmountFee];
GO
ALTER TABLE [dbo].[vshop_Statistics_Distributors]
    ADD CONSTRAINT [DF_vshop_Statistics_Distributors_OrderNumber] DEFAULT ((0)) FOR [OrderNumber];
GO
ALTER TABLE [dbo].[vshop_Statistics_Distributors]
    ADD CONSTRAINT [DF_vshop_Statistics_Distributors_SaleAmountFee] DEFAULT ((0)) FOR [SaleAmountFee];
GO
ALTER TABLE [dbo].[vshop_Statistics_Globals]
    ADD DEFAULT 0 FOR [FinishedDrawCommissionFee];
GO
ALTER TABLE [dbo].[vshop_Statistics_Globals]
    ADD DEFAULT 0 FOR [WaitDrawCommissionFee];
GO
ALTER TABLE [dbo].[vshop_Statistics_Log]
    ADD CONSTRAINT [DF_vshop_Statistics_Log_IsSuccess] DEFAULT ((0)) FOR [IsSuccess];
GO
ALTER TABLE [dbo].[vshop_Statistics_Products]
    ADD CONSTRAINT [DF_vshop_Statistics_Goods_BuyerNumber] DEFAULT ((0)) FOR [BuyerNumber];
GO
ALTER TABLE [dbo].[vshop_Statistics_Products]
    ADD CONSTRAINT [DF_vshop_Statistics_Goods_ConversionRate] DEFAULT ((0)) FOR [ConversionRate];
GO
ALTER TABLE [dbo].[vshop_Statistics_Products]
    ADD CONSTRAINT [DF_vshop_Statistics_Goods_SaleAmountFee] DEFAULT ((0)) FOR [SaleAmountFee];
GO
ALTER TABLE [dbo].[vshop_Statistics_Products]
    ADD CONSTRAINT [DF_vshop_Statistics_Goods_SaleQty] DEFAULT ((0)) FOR [SaleQty];
GO
ALTER TABLE [dbo].[vshop_Statistics_Products]
    ADD CONSTRAINT [DF_vshop_Statistics_Goods_TotalVisits] DEFAULT ((0)) FOR [TotalVisits];
GO
ALTER TABLE [dbo].[vshop_Statistics_ProductsVisits]
    ADD CONSTRAINT [DF_vshop_Statistics_GoodsVisits_TotalVisits] DEFAULT ((0)) FOR [TotalVisits];
GO
ALTER TABLE [dbo].[WeiXin_RecentOpenID]
    ADD DEFAULT getdate() FOR [PubTime];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD DEFAULT getdate() FOR [SendTime];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD DEFAULT 0 FOR [SendCount];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD DEFAULT 0 FOR [TotalCount];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD DEFAULT 0 FOR [platform];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD CONSTRAINT [DF_WeiXin_SendAll_ArticleID] DEFAULT (0) FOR [ArticleID];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD CONSTRAINT [DF_WeiXin_SendAll_MessageType] DEFAULT (0) FOR [MessageType];
GO
ALTER TABLE [dbo].[WeiXin_SendAll]
    ADD CONSTRAINT [DF_WeiXin_SendAll_SendState] DEFAULT (0) FOR [SendState];
GO
ALTER TABLE [dbo].[aspnet_RolePermissions]
    ADD CONSTRAINT [FK_aspnet_RolePermissions_aspnet_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]);
GO
ALTER TABLE [dbo].[Hishop_Attributes]
    ADD CONSTRAINT [FK_Hishop_Attributes_ProductTypes] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[Hishop_ProductTypes] ([TypeId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_AttributeValues]
    ADD CONSTRAINT [FK_Hishop_AttributeValues_Attributes] FOREIGN KEY ([AttributeId]) REFERENCES [dbo].[Hishop_Attributes] ([AttributeId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_CouponItems]
    ADD CONSTRAINT [FK_Hishop_CouponItems__Coupons] FOREIGN KEY ([CouponId]) REFERENCES [dbo].[Hishop_Coupons] ([CouponId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_OrderDebitNote]
    ADD CONSTRAINT [FK_Hishop_OrderDebitNote_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Hishop_Orders] ([OrderId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_OrderRefund]
    ADD CONSTRAINT [FK_Hishop_OrderRefund_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Hishop_Orders] ([OrderId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_OrderReplace]
    ADD CONSTRAINT [FK_Hishop_OrderReplace_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Hishop_Orders] ([OrderId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_OrderReturns]
    ADD CONSTRAINT [FK_Hishop_OrderReturns_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Hishop_Orders] ([OrderId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_OrderSendNote]
    ADD CONSTRAINT [FK_Hishop_OrderSendNote_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Hishop_Orders] ([OrderId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_ProductAttributes]
    ADD CONSTRAINT [FK_Hishop_ProductAttributes_Attributes] FOREIGN KEY ([AttributeId]) REFERENCES [dbo].[Hishop_Attributes] ([AttributeId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_ProductAttributes]
    ADD CONSTRAINT [FK_Hishop_ProductAttributes_Products] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Hishop_Products] ([ProductId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_ProductTag]
    ADD CONSTRAINT [FK_Hishop_ProductTag_Hishop_Products] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Hishop_Products] ([ProductId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_ProductTypeBrands]
    ADD CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Hishop_BrandCategories] ([BrandId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_ProductTypeBrands]
    ADD CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[Hishop_ProductTypes] ([TypeId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_PromotionGameResultMembersLog]
    ADD CONSTRAINT [FK_Hishop_PromotionGameResultMembersLog_Hishop_PromotionGame] FOREIGN KEY ([GameId]) REFERENCES [dbo].[Hishop_PromotionGame] ([GameId]);
GO
ALTER TABLE [dbo].[Hishop_ShoppingCarts]
    ADD CONSTRAINT [FK_Hishop_ShoppingCarts_aspnet_Members] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Members] ([UserId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_SKUItems]
    ADD CONSTRAINT [FK_Hishop_SKUItems_SKUs] FOREIGN KEY ([SkuId]) REFERENCES [dbo].[Hishop_SKUs] ([SkuId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_SKUMemberPrice]
    ADD CONSTRAINT [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades] FOREIGN KEY ([GradeId]) REFERENCES [dbo].[aspnet_MemberGrades] ([GradeId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_SKUMemberPrice]
    ADD CONSTRAINT [FK_Hishop_SKUMemberPrice_SKUs] FOREIGN KEY ([SkuId]) REFERENCES [dbo].[Hishop_SKUs] ([SkuId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_SKUs]
    ADD CONSTRAINT [FK_Hishop_SKUs_Products] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Hishop_Products] ([ProductId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_UserShippingAddresses]
    ADD CONSTRAINT [FK_Hishop_UserShippingAddresses_aspnet_Memberss] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Members] ([UserId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Hishop_VoteItems]
    ADD CONSTRAINT [FK_Hishop_VoteItems_Votes] FOREIGN KEY ([VoteId]) REFERENCES [dbo].[Hishop_Votes] ([VoteId]) ON DELETE CASCADE;
GO
ALTER TABLE [dbo].[Taobao_Products]
    ADD CONSTRAINT [FK_Taobao_Products_Hishop_Products] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Hishop_Products] ([ProductId]) ON DELETE CASCADE;
GO
CREATE TRIGGER [T_Hishop_AttributeValues_Delete]
    ON Hishop_AttributeValues FOR DELETE                          
    AS       
        DELETE Hishop_ProductAttributes 
		FROM Hishop_ProductAttributes at, Deleted d  
        WHERE at.ValueID=d.ValueID
GO
Create   Trigger   T_Hishop_Categories_Delete ON Hishop_Categories FOR Delete AS
BEGIN
	DECLARE @ParentCategoryId INT
	SELECT @ParentCategoryId= ParentCategoryId FROM deleted;

	IF @ParentCategoryId = 0 OR @ParentCategoryId IS NULL
		RETURN
		
	IF EXISTS(SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @ParentCategoryId)
	BEGIN
		-- ?????????????????????????????????????????????????????????????????????????????????????????????HasChildren?????????0
		IF (SELECT COUNT(CategoryId) FROM Hishop_Categories WHERE ParentCategoryId = @ParentCategoryId) = 0
			UPDATE Hishop_Categories SET HasChildren = 0 WHERE CategoryId = @ParentCategoryId
	END
END
GO
Create   Trigger   T_Hishop_Categories_Insert ON Hishop_Categories FOR Insert AS
BEGIN
	DECLARE @ParentCategoryId INT
	SELECT @ParentCategoryId= ParentCategoryId FROM inserted;

	IF @ParentCategoryId = 0 OR @ParentCategoryId IS NULL
		RETURN

	IF EXISTS(SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @ParentCategoryId AND HasChildren = 0)
	BEGIN
		-- ???????????????????????????????????????????????????????????????????????????????????????HasChildren?????????1
		UPDATE Hishop_Categories SET HasChildren = 1 WHERE CategoryId = @ParentCategoryId
	END
END
GO
create TRIGGER T_Hishop_CouponItems_Update
ON hishop_CouponItems
FOR update
AS 
BEGIN
	DECLARE @CouponId INT
	declare @CouponStatus int
	SELECT @CouponId= CouponId,@CouponStatus=CouponStatus FROM inserted;
	if @CouponStatus=1
	begin
		UPDATE hishop_Coupons SET UsedCount =(select COUNT(CouponId) from dbo.Hishop_CouponItems  WHERE CouponStatus = 1 and CouponId = @CouponId )where CouponId = @CouponId
	end
END
GO
CREATE TRIGGER T_Templates_Delete
	ON Hishop_FreightTemplate_Templates 
	FOR DELETE
	AS
	BEGIN
DECLARE @Did decimal(18, 0)
select @Did =TemplateId from DELETED
delete from Hishop_FreightTemplate_SpecifyRegionGroups where TemplateId=@Did
delete from Hishop_FreightTemplate_FreeShipping where TemplateId=@Did
delete from Hishop_FreightTemplate_FreeShippingRegions where TemplateId=@Did
delete from Hishop_FreightTemplate_SpecifyRegions where TemplateId=@Did
END
GO
CREATE FUNCTION [dbo].[F_SplitToInt]
(
	@str nvarchar(4000), 
	@spliter nvarchar(2)
)
RETURNS @returntable TABLE (UnitInt INT)
AS
BEGIN
	WHILE(CHARINDEX(@spliter,@str)<>0)  
	BEGIN  
		INSERT INTO @returntable(UnitInt) SELECT CAST (SUBSTRING(@str,1,CHARINDEX(@spliter,@str)-1) AS INT)
		SET @str = STUFF(@str,1,CHARINDEX(@spliter,@str),'')  
	END
	
	INSERT INTO @returntable(UnitInt) SELECT CAST (@str AS INT) 
      
	RETURN 
END
GO
CREATE FUNCTION [dbo].[F_SplitToString]
(
	@str nvarchar(4000), 
	@spliter nvarchar(2)
)
RETURNS @returntable TABLE (UnitString nvarchar(50))
AS
BEGIN
	WHILE(CHARINDEX(@spliter,@str)<>0)  
	BEGIN  
		INSERT INTO @returntable(UnitString) VALUES (SUBSTRING(@str,1,CHARINDEX(@spliter,@str)-1))  
		SET @str = STUFF(@str,1,CHARINDEX(@spliter,@str),'')  
	END
	
	INSERT INTO @returntable(UnitString) VALUES (@str) 
      
	RETURN 
END
GO
CREATE view [dbo].[vw_BuyerMember]
as

select a.* from aspnet_Members a
	left join aspnet_Distributors D on a.UserId= D.UserId
	where  1=1
	and D.UserId is null
GO
CREATE VIEW [dbo].[vw_Hishop_Activities_Detail]
AS
SELECT     d.Id, d.ActivitiesId, d.MeetMoney, d.ReductionMoney, d.bFreeShipping, d.Integral, d.CouponId, d.MeetNumber, a.ActivitiesName, a.MemberGrades,a.CustomGroup,a.DefualtGroup, a.StartTime, 
                      a.EndTIme, a.isAllProduct
FROM         dbo.Hishop_Activities_Detail AS d LEFT OUTER JOIN
                      dbo.Hishop_Activities AS a ON a.ActivitiesId = d.ActivitiesId
GO
CREATE VIEW [dbo].[vw_Hishop_BalanceDrawRequesDistributors]
AS
SELECT     dbo.Hishop_BalanceDrawRequest.SerialID, dbo.Hishop_BalanceDrawRequest.UserId, dbo.Hishop_BalanceDrawRequest.RequestType, 
                      dbo.Hishop_BalanceDrawRequest.UserName, dbo.Hishop_BalanceDrawRequest.RequestTime, dbo.Hishop_BalanceDrawRequest.Amount, 
                      dbo.Hishop_BalanceDrawRequest.AccountName, dbo.Hishop_BalanceDrawRequest.CellPhone, dbo.Hishop_BalanceDrawRequest.MerchantCode, 
                      dbo.Hishop_BalanceDrawRequest.Remark, dbo.Hishop_BalanceDrawRequest.RedpackRecordNum, dbo.Hishop_BalanceDrawRequest.IsCheck, 
                      dbo.Hishop_BalanceDrawRequest.CheckTime, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.ReferralBlance, dbo.Hishop_BalanceDrawRequest.bankName
FROM         dbo.aspnet_Distributors INNER JOIN
                      dbo.Hishop_BalanceDrawRequest ON dbo.aspnet_Distributors.UserId = dbo.Hishop_BalanceDrawRequest.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_BargainList]
	AS select a.ProductName,a.MarketPrice,a.ThumbnailUrl60,a.SaleStatus, (SELECT   MIN(SalePrice) AS Expr1
                     FROM      dbo.Hishop_SKUs
                     WHERE   (ProductId = b.ProductId)) AS SalePrice,CASE WHEN BeginDate <GETDATE() and GETDATE()<EndDate  THEN '?????????'
WHEN BeginDate >GETDATE()  THEN '?????????'
WHEN EndDate < GETDATE()  THEN '?????????'
ELSE NULL END bargainstatus,b.*  from Hishop_Products a join Hishop_Bargain b on a.ProductId=b.ProductId
GO
CREATE VIEW [dbo].[vw_Hishop_BrandTypeAndBrandCategories]
AS
SELECT     dbo.Hishop_BrandCategories.*, dbo.Hishop_ProductTypeBrands.ProductTypeId
FROM         dbo.Hishop_BrandCategories INNER JOIN
                      dbo.Hishop_ProductTypeBrands ON dbo.Hishop_BrandCategories.BrandId = dbo.Hishop_ProductTypeBrands.BrandId
GO
CREATE VIEW [dbo].[vw_Hishop_BrowseProductImgList]
AS


SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,SaleStatus,MainCategoryPath,ExtendCategoryPath,AddedDate,ImageUrl1 as img FROM Hishop_Products where ImageUrl1!=''
union 
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,SaleStatus,MainCategoryPath,ExtendCategoryPath,AddedDate,ImageUrl2 as img FROM Hishop_Products where ImageUrl2!=''
union 
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,SaleStatus,MainCategoryPath,ExtendCategoryPath,AddedDate,ImageUrl3 as img FROM Hishop_Products where ImageUrl3!=''
union 
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,SaleStatus,MainCategoryPath,ExtendCategoryPath,AddedDate,ImageUrl4 as img FROM Hishop_Products where ImageUrl4!=''
union 
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,SaleStatus,MainCategoryPath,ExtendCategoryPath,AddedDate,ImageUrl5 as img FROM Hishop_Products where ImageUrl5!=''
GO
CREATE VIEW [dbo].[vw_Hishop_BrowseProductList]
AS
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,ProductShortName,ProductCode,ShortDescription,MarketPrice,
ThumbnailUrl40,ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160, ThumbnailUrl180, ThumbnailUrl220,ThumbnailUrl310,
 SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, SaleCounts, ShowSaleCounts, AddedDate, VistiCounts, MaxShowPrice,

MinShowPrice AS SalePrice,
(SELECT TOP 1 SkuId FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS SkuId,
(SELECT SUM(Stock) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS Stock,
(SELECT TOP 1 [Weight] FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS [Weight],
(SELECT COUNT(*) FROM Taobao_Products WHERE ProductId = p.ProductId) AS IsMakeTaobao
FROM Hishop_Products p
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionDistributors]
AS
SELECT     dbo.Hishop_Commissions.CommId, dbo.Hishop_Commissions.UserId, dbo.Hishop_Commissions.ReferralUserId, dbo.Hishop_Commissions.OrderId, 
                      dbo.Hishop_Commissions.TradeTime, dbo.Hishop_Commissions.OrderTotal, dbo.Hishop_Commissions.CommTotal, dbo.Hishop_Commissions.CommType, 
                      dbo.Hishop_Commissions.CommRemark, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance,dbo.aspnet_Distributors.GradeId,dbo.Hishop_Commissions.State

FROM         dbo.Hishop_Commissions INNER JOIN 
                      dbo.aspnet_Distributors ON dbo.Hishop_Commissions.UserId = dbo.aspnet_Distributors.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionDistributorsAddFromStore]
AS
SELECT     dbo.Hishop_Commissions.CommId, dbo.Hishop_Commissions.UserId, dbo.Hishop_Commissions.ReferralUserId, dbo.Hishop_Commissions.OrderId, 
                      dbo.Hishop_Commissions.TradeTime, dbo.Hishop_Commissions.OrderTotal, dbo.Hishop_Commissions.CommTotal, dbo.Hishop_Commissions.CommType, 
                      dbo.Hishop_Commissions.CommRemark, dbo.aspnet_Distributors.StoreName AS fromStoreName, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.GradeId, dbo.Hishop_Commissions.State, dbo.aspnet_Distributors.ReferralPath, 
                      dbo.Hishop_Orders.RealName, dbo.Hishop_Orders.Username, aspnet_Distributors_1.StoreName
FROM         dbo.Hishop_Commissions INNER JOIN
                      dbo.aspnet_Distributors ON dbo.Hishop_Commissions.ReferralUserId = dbo.aspnet_Distributors.UserId LEFT JOIN
                      dbo.Hishop_Orders ON dbo.Hishop_Commissions.OrderId = dbo.Hishop_Orders.OrderId INNER JOIN
                      dbo.aspnet_Distributors AS aspnet_Distributors_1 ON dbo.Hishop_Commissions.UserId = aspnet_Distributors_1.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionDistributorsOnlyForStoreName]
AS
SELECT     dbo.Hishop_Commissions.CommId, dbo.Hishop_Commissions.UserId, dbo.Hishop_Commissions.ReferralUserId, dbo.Hishop_Commissions.OrderId, 
                      dbo.Hishop_Commissions.TradeTime, dbo.Hishop_Commissions.OrderTotal, dbo.Hishop_Commissions.CommTotal, dbo.Hishop_Commissions.CommType, 
                      dbo.Hishop_Commissions.CommRemark, dbo.aspnet_Distributors.StoreName AS fromStoreName, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.GradeId, dbo.Hishop_Commissions.State, dbo.aspnet_Distributors.ReferralPath, 
                      dbo.Hishop_Orders.RealName, dbo.Hishop_Orders.Username, aspnet_Distributors.StoreName
FROM         dbo.Hishop_Commissions left JOIN
                      dbo.aspnet_Distributors ON dbo.Hishop_Commissions.UserID = dbo.aspnet_Distributors.UserId LEFT JOIN
                      dbo.Hishop_Orders ON dbo.Hishop_Commissions.OrderId = dbo.Hishop_Orders.OrderId
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionRanking]
	AS 
	SELECT     d.StoreName, d.ReferralBlance, d.ReferralRequestBalance, d.GradeId, d.ReferralPath, d.Logo, c.CommId, d.UserId, ISNULL(c.ReferralUserId, d.UserId) 
                      AS ReferralUserId, c.OrderId, c.TradeTime, ISNULL(c.OrderTotal, 0) AS OrderTotal, ISNULL(c.CommTotal, 0) AS CommTotal, c.CommType, c.CommRemark, c.State, 
                      ISNULL(o.UserId, 0) AS BuyUserId, o.Username AS BuyUsername
FROM         dbo.aspnet_Distributors AS d LEFT OUTER JOIN
                      dbo.Hishop_Commissions AS c ON d.UserId = c.UserId LEFT OUTER JOIN
                      dbo.Hishop_Orders AS o ON o.OrderId = c.OrderId
 UNION
SELECT     d .StoreName, d .ReferralBlance, d .ReferralRequestBalance, d .GradeId, d .ReferralPath, d .Logo, c.CommId, d .UserId, d .UserId AS ReferralUserId, c.OrderId, 
                      c.TradeTime, ISNULL(c.OrderTotal, 0) AS OrderTotal, ISNULL(c.CommTotal, 0) AS CommTotal, c.CommType, c.CommRemark, c.State, ISNULL(c.UserId, 0) 
                      AS BuyUserId, c.Username AS BuyUsername
FROM         dbo.aspnet_Distributors AS d LEFT OUTER JOIN
                          (SELECT     0 AS UserId, NULL AS OrderId, NULL AS TradeTime, 0 AS OrderTotal, 0 AS CommTotal, NULL AS CommType, NULL AS CommRemark, NULL AS State, 
                                                   0 AS BuyUserId, NULL AS BuyUsername, NULL AS Username, NULL AS CommId) c ON d .UserId = c.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionWithBuyUserId]
AS
SELECT     dbo.Hishop_Commissions.CommId, dbo.Hishop_Commissions.UserId, dbo.Hishop_Commissions.ReferralUserId, dbo.Hishop_Commissions.OrderId, 
                      dbo.Hishop_Commissions.TradeTime, dbo.Hishop_Commissions.OrderTotal, dbo.Hishop_Commissions.CommTotal, dbo.Hishop_Commissions.CommType, 
                      dbo.Hishop_Commissions.CommRemark, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.GradeId, dbo.Hishop_Commissions.State, dbo.Hishop_Orders.UserId AS BuyUserId, 
                      dbo.Hishop_Orders.Username AS BuyUsername, dbo.aspnet_Distributors.ReferralPath, dbo.aspnet_Distributors.Logo
FROM         dbo.Hishop_Commissions INNER JOIN
                      dbo.aspnet_Distributors ON dbo.Hishop_Commissions.UserId = dbo.aspnet_Distributors.UserId AND dbo.aspnet_Distributors.ReferralStatus = 0 Left JOIN
                      dbo.Hishop_Orders ON dbo.Hishop_Orders.OrderId = dbo.Hishop_Commissions.OrderId
GO
CREATE VIEW [dbo].[vw_Hishop_CommissionWithReferralPath]
	AS 
	SELECT     c.UserId AS CUserId, d .StoreName, d .ReferralBlance, d .ReferralRequestBalance, d .GradeId, d .ReferralPath, d .Logo, c.CommId, d .UserId, ISNULL(c.ReferralUserId, 
                      d .UserId) AS ReferralUserId, c.OrderId, c.TradeTime, ISNULL(c.OrderTotal, 0) AS OrderTotal, ISNULL(c.CommTotal, 0) AS CommTotal, c.CommType, c.CommRemark, 
                      c.State, ISNULL(o.UserId, 0) AS BuyUserId, o.Username AS BuyUsername
FROM         dbo.aspnet_Distributors AS d LEFT OUTER JOIN
                      dbo.Hishop_Commissions AS c ON d .UserId = c.ReferralUserId LEFT OUTER JOIN
                      dbo.Hishop_Orders AS o ON o.OrderId = c.OrderId
UNION
SELECT     c.UserId AS CUserId, d .StoreName, d .ReferralBlance, d .ReferralRequestBalance, d .GradeId, d .ReferralPath, d .Logo, c.CommId, d .UserId, 
                      d .UserId AS ReferralUserId, c.OrderId, c.TradeTime, ISNULL(c.OrderTotal, 0) AS OrderTotal, ISNULL(c.CommTotal, 0) AS CommTotal, c.CommType, c.CommRemark, 
                      c.State, ISNULL(c.UserId, 0) AS BuyUserId, c.Username AS BuyUsername
FROM         dbo.aspnet_Distributors AS d LEFT OUTER JOIN
                          (SELECT     0 AS UserId, NULL AS OrderId, NULL AS TradeTime, 0 AS OrderTotal, 0 AS CommTotal, NULL AS CommType, NULL AS CommRemark, NULL AS State, 
                                                   0 AS BuyUserId, NULL AS BuyUsername, NULL AS Username, NULL AS CommId) c ON d .UserId = c.UserId
GO
CREATE VIEW dbo.vw_Hishop_CouponInfo
	AS 
	SELECT     dbo.Hishop_CouponItems.LotNumber, dbo.Hishop_CouponItems.ClaimCode, dbo.Hishop_CouponItems.UserId, dbo.Hishop_CouponItems.UserName, 
                      dbo.Hishop_CouponItems.EmailAddress, dbo.Hishop_CouponItems.GenerateTime, dbo.Hishop_CouponItems.CouponStatus, dbo.Hishop_CouponItems.UsedTime, 
                      dbo.Hishop_CouponItems.OrderId, dbo.Hishop_CouponItems.CouponId, dbo.Hishop_Coupons.Name,dbo.Hishop_Coupons.ClosingTime
FROM         dbo.Hishop_CouponItems INNER JOIN
                      dbo.Hishop_Coupons ON dbo.Hishop_CouponItems.CouponId = dbo.Hishop_Coupons.CouponId
GO
CREATE VIEW [dbo].[vw_hishop_DiscountList]
	AS   select *,(select count(*) from Hishop_LimitedTimeDiscountProduct where LimitedTimeDiscountId=dis.LimitedTimeDiscountId and Status!=2) as productCount from Hishop_LimitedTimeDiscount as dis where dis.Status!=2
GO
CREATE VIEW [dbo].[vw_Hishop_DiscountProducted]
AS 
 select  CategoryId, TypeId,BrandId,ProductName,ProductShortName,ProductCode,ShortDescription,MarketPrice,ThumbnailUrl40,ThumbnailUrl60, 
         SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, SaleCounts, ShowSaleCounts, AddedDate, VistiCounts, MaxShowPrice,
		 (SELECT MIN(SalePrice) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS SalePrice,l.*
  from Hishop_LimitedTimeDiscount d 
  join Hishop_LimitedTimeDiscountProduct l on d.LimitedTimeDiscountId=l.LimitedTimeDiscountId
  join Hishop_Products p on l.ProductId=p.ProductId
GO
CREATE VIEW [dbo].[vw_Hishop_DiscountProductList]
	AS 
SELECT CategoryId, TypeId,BrandId,ProductName,ProductShortName,ProductCode,ShortDescription,MarketPrice,
ThumbnailUrl40,ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160, ThumbnailUrl180, ThumbnailUrl220,ThumbnailUrl310,
SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, SaleCounts, ShowSaleCounts, AddedDate, VistiCounts, MinShowPrice, MaxShowPrice,p.ProductId as productws,
(SELECT MIN(SalePrice) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS SalePrice,
(SELECT COUNT(SkuId)  FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS SkuNum,
(SELECT TOP 1 SkuId FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS SkuId,
(SELECT SUM(Stock) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS Stock,
(SELECT TOP 1 [Weight] FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS [Weight],
(SELECT COUNT(*) FROM Taobao_Products WHERE ProductId = p.ProductId) AS IsMakeTaobao,
(select ActivityName from Hishop_LimitedTimeDiscount WHERE LimitedTimeDiscountId=d.LimitedTimeDiscountId and status!=2 and d.Status<>2) as ActivityName,
d.*
FROM Hishop_Products p left join Hishop_LimitedTimeDiscountProduct d on p.ProductId=d.ProductId
GO
CREATE VIEW vw_Hishop_DistributorGradeCommission
	AS SELECT a.Id,a.UserId,a.Commission,a.PubTime,a.OperAdmin,a.Memo,a.OrderID,a.OldCommissionTotal,b.StoreName FROM Hishop_DistributorGradeCommission a left join aspnet_Distributors b 
	on a.UserID=b.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_DistributorsMembers]
AS
SELECT     dbo.aspnet_Distributors.UserId, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.Logo, dbo.aspnet_Distributors.BackImage, 
                      dbo.aspnet_Distributors.RequestAccount, dbo.aspnet_Distributors.AccountTime, dbo.aspnet_Distributors.GradeId, dbo.aspnet_Distributors.ReferralUserId, 
                      dbo.aspnet_Distributors.ReferralPath, dbo.aspnet_Distributors.OrdersTotal, dbo.aspnet_Distributors.ReferralOrders, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.CreateTime, dbo.aspnet_Distributors.ReferralStatus, 
                      dbo.aspnet_Distributors.StoreDescription, dbo.aspnet_Distributors.DistributorGradeId, dbo.aspnet_Members.QQ, dbo.aspnet_Members.CellPhone, 
                      dbo.aspnet_Members.MicroSignal, dbo.aspnet_Members.RealName, dbo.aspnet_Members.UserHead, dbo.aspnet_Members.UserName, 
                      dbo.aspnet_DistributorGrade.Name
FROM         dbo.aspnet_Distributors INNER JOIN

                      dbo.aspnet_Members ON dbo.aspnet_Distributors.UserId = dbo.aspnet_Members.UserId LEFT JOIN
                      dbo.aspnet_DistributorGrade ON dbo.aspnet_Distributors.DistributorGradeId = dbo.aspnet_DistributorGrade.GradeId
GO
CREATE VIEW [dbo].[vw_Hishop_FreightTemplate_FreeShippingRegions]
AS
SELECT A.FreeId,
(SELECT cast(RegionId AS varchar(10))+',' FROM Hishop_FreightTemplate_FreeShippingRegions WHERE FreeId=A.FreeId ORDER BY FreeId FOR XML PATH('')) AS RegionIds
FROM Hishop_FreightTemplate_FreeShippingRegions A 
GROUP BY A.FreeId
GO
CREATE VIEW [dbo].[vw_Hishop_FreightTemplate_SpecifyRegions]
	AS
SELECT A.GroupId,
(SELECT cast(RegionId AS varchar(10))+',' FROM Hishop_FreightTemplate_SpecifyRegions WHERE GroupId=A.GroupId ORDER BY GroupId FOR XML PATH('')) AS RegionIds
FROM Hishop_FreightTemplate_SpecifyRegions A 
GROUP BY A.GroupId
GO
CREATE VIEW [dbo].[vw_Hishop_MyBargainList]
	AS select * from (select a.ProductName,a.MarketPrice,a.ThumbnailUrl60, (SELECT   MIN(SalePrice) AS Expr1
                     FROM      dbo.Hishop_SKUs
                     WHERE   (ProductId = b.ProductId)) AS SalePrice,CASE WHEN BeginDate <GETDATE() and GETDATE()<EndDate  THEN '?????????'
WHEN BeginDate >GETDATE()  THEN '?????????'
WHEN EndDate < GETDATE()  THEN '?????????'
ELSE NULL END bargainstatus,b.*,c.UserId,c.Price,c.id as bargainDetialID,((b.InitialPrice-c.Price)/(b.InitialPrice-b.FloorPrice))*100 as process
,(DATEDIFF(hh, GETDATE(),EndDate))   AS hou
from Hishop_Products a join Hishop_Bargain b on a.ProductId=b.ProductId join Hishop_BargainDetial c on b.id=c.BargainId) as w
GO
CREATE VIEW [dbo].[vw_Hishop_Notice]
AS
SELECT     ID,Title,Author,IsPub,AddTime,PubTime,SendType,SendTo,0 as UserId 
FROM         Hishop_Notice  where SendTo=0
union 
SELECT     ID,Title,Author,IsPub,AddTime,PubTime,SendType,SendTo,0 as UserId
FROM         Hishop_Notice where SendTo=1

union

SELECT     ID,Title,Author,IsPub,AddTime,PubTime,SendType,SendTo,b.UserId
FROM        Hishop_NoticeUser b left Join Hishop_Notice a on b.NoticeId=a.id
GO
CREATE VIEW [dbo].[vw_Hishop_Order]
	AS 

	SELECT     o.OrderId, o.Remark, o.ManagerMark, o.ManagerRemark, o.AdjustedDiscount, o.OrderStatus, o.CloseReason, o.OrderDate, o.PayDate, o.ShippingDate, o.FinishDate, 
                      o.UserId, o.Username, o.EmailAddress, o.RealName, o.QQ, o.Wangwang, o.MSN, o.ShippingRegion, o.Address, o.ZipCode, o.ShipTo, o.TelPhone, o.CellPhone, 
                      o.ShipToDate, o.ShippingModeId, o.ModeName, o.RealShippingModeId, o.RealModeName, o.RegionId, o.Freight, o.AdjustedFreight, o.ShipOrderNumber, o.Weight, 
                      o.ExpressCompanyName, o.ExpressCompanyAbb, o.PaymentTypeId, o.PaymentType, o.PayCharge, o.RefundStatus, o.RefundAmount, o.RefundRemark, o.Gateway, 
                      o.OrderTotal, o.OrderPoint, o.OrderCostPrice, o.OrderProfit, o.ActualFreight, o.OtherCost, o.OptionPrice, o.Amount, o.DiscountAmount, o.ReducedPromotionId, 
                      o.ReducedPromotionName, o.ReducedPromotionAmount, o.IsReduced, o.SentTimesPointPromotionId, o.SentTimesPointPromotionName, o.TimesPoint, 
                      o.IsSendTimesPoint, o.FreightFreePromotionId, o.FreightFreePromotionName, o.IsFreightFree, o.CouponName, o.CouponCode, o.CouponAmount, o.CouponValue, 
                      o.GroupBuyId, o.NeedPrice, o.GroupBuyStatus, o.CountDownBuyId, o.BundlingId, o.BundlingNum, o.BundlingPrice, o.GatewayOrderId, o.IsPrinted, o.Tax, 
                      o.InvoiceTitle, o.Sender, o.ReferralUserId,o.SplitState,o.DeleteBeforeState,o.BargainDetialId, d.StoreName
FROM         dbo.aspnet_Distributors AS d RIGHT OUTER JOIN
                      dbo.Hishop_Orders AS o ON d.UserId = o.ReferralUserId
GO
CREATE VIEW [dbo].[vw_Hishop_OrderDebitNote]
as
select a.NoteId,a.OrderId,b.Username,b.OrderTotal,b.PayCharge,b.PaymentType,a.Operator,b.PayDate,a.Remark
from Hishop_OrderDebitNote a inner join Hishop_Orders b on a.OrderId=b.OrderId
GO
CREATE VIEW [dbo].[vw_Hishop_OrderItem]
AS
select top 100 percent items.*,orders.PayDate,orders.Username,orders.ShipTo from dbo.Hishop_OrderItems as items
left join Hishop_Orders orders on items.OrderId=orders.OrderId where orders.OrderStatus!=1 and orders.OrderStatus!=4
order by orders.PayDate desc
GO
CREATE VIEW [dbo].[vw_Hishop_OrderRefund]
AS
SELECT a.RefundId,a.OrderId,a.Operator,a.RefundRemark,b.Username,b.OrderTotal,a.ApplyForTime,a.HandleTime,
a.AdminRemark,a.HandleStatus,b.OrderStatus,b.UserId,CASE a.RefundType WHEN 1 THEN '?????????' ELSE '????????????' END AS RefundType
FROM Hishop_OrderRefund a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;
GO
CREATE VIEW [dbo].[vw_Hishop_OrderReplace]
AS
SELECT a.ReplaceId,a.OrderId,b.Username,b.OrderTotal,a.ApplyForTime,a.Comments,a.HandleStatus,b.OrderStatus,b.UserId,a.HandleTime, a.AdminRemark
FROM Hishop_OrderReplace a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;
GO
CREATE VIEW [dbo].[vw_Hishop_OrderReturns]
AS
SELECT a.ReturnsId,a.OrderId,a.Operator,b.Username,a.RefundMoney,a.ApplyForTime,a.AdminRemark,a.Comments,a.HandleStatus, OrderStatus,b.UserId,
CASE a.RefundType WHEN 1 THEN '?????????' ELSE '????????????' END AS RefundType, a.HandleTime
FROM Hishop_OrderReturns a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;
GO
CREATE VIEW [dbo].[vw_Hishop_OrderSendNote]
as
select a.NoteId,b.OrderTotal,a.OrderId,b.PaymentType,b.ShippingDate,b.ExpressCompanyName,b.ZipCode,b.TelPhone,b.CellPhone,
b.ShipOrderNumber,b.ShipTo,b.ShippingRegion,a.Operator,b.Username,a.Remark
from Hishop_OrderSendNote a inner join Hishop_Orders b on a.OrderId=b.OrderId
GO
CREATE VIEW [dbo].[vw_Hishop_PointExchange_Products]
AS
SELECT     dbo.Hishop_Products.ProductName, dbo.Hishop_PointExChange_Products.exChangeId, dbo.Hishop_PointExChange_Products.ProductId, 
                      dbo.Hishop_PointExChange_Products.status, dbo.Hishop_PointExChange_Products.ProductNumber, dbo.Hishop_PointExChange_Products.PointNumber, 
                      dbo.Hishop_PointExChange_Products.ChangedNumber, dbo.Hishop_PointExChange_Products.eachMaxNumber, dbo.Hishop_Products.ImageUrl1, 
                      dbo.Hishop_Products.ImageUrl2, dbo.Hishop_Products.ImageUrl3, dbo.Hishop_Products.ImageUrl4, dbo.Hishop_Products.ImageUrl5, 
                      dbo.Hishop_Products.ThumbnailUrl40, dbo.Hishop_Products.ThumbnailUrl60, dbo.Hishop_Products.ThumbnailUrl100, dbo.Hishop_Products.ThumbnailUrl160, 
                      dbo.Hishop_Products.ThumbnailUrl180, dbo.Hishop_Products.ThumbnailUrl220, dbo.Hishop_Products.ThumbnailUrl310, dbo.Hishop_Products.ThumbnailUrl410, 
                      dbo.Hishop_Products.MarketPrice, dbo.Hishop_Products.CategoryId, dbo.Hishop_Products.TypeId, dbo.Hishop_Products.ProductCode, 
                      dbo.Hishop_Products.ShortDescription, dbo.Hishop_Products.Unit, dbo.Hishop_Products.Description, dbo.Hishop_Products.SaleStatus, 
                      dbo.Hishop_Products.AddedDate, dbo.Hishop_Products.VistiCounts, dbo.Hishop_Products.SaleCounts, dbo.Hishop_Products.ShowSaleCounts, 
                      dbo.Hishop_Products.DisplaySequence, dbo.Hishop_Products.BrandId, dbo.Hishop_Products.MainCategoryPath, dbo.Hishop_Products.ExtendCategoryPath, 
                      dbo.Hishop_Products.HasSKU, dbo.Hishop_Products.IsfreeShipping, dbo.Hishop_Products.TaobaoProductId, dbo.Hishop_Products.Source, 
                      dbo.Hishop_Products.MinShowPrice, dbo.Hishop_Products.MaxShowPrice, dbo.Hishop_Products.FreightTemplateId, dbo.Hishop_Products.FirstCommission, 
                      dbo.Hishop_Products.SecondCommission, dbo.Hishop_Products.ThirdCommission, dbo.Hishop_Products.IsSetCommission, dbo.Hishop_Products.CubicMeter, 
                      dbo.Hishop_Products.FreightWeight, dbo.Hishop_Products.ProductShortName,dbo.Hishop_PointExChange_PointExChanges.MemberGrades
FROM         dbo.Hishop_Products INNER JOIN
                      dbo.Hishop_PointExChange_Products ON dbo.Hishop_Products.ProductId = dbo.Hishop_PointExChange_Products.ProductId INNER JOIN
					   dbo.Hishop_PointExChange_PointExChanges ON 
                dbo.Hishop_PointExChange_PointExChanges.Id = dbo.Hishop_PointExChange_Products.exChangeId
GO
--????????????????????????
CREATE VIEW [dbo].[vw_Hishop_PrizesDeliveryRecord]
AS
SELECT     p.PrizeId, g.GameId, m.LogId, r.Receiver, r.Tel, CASE p.PrizeType WHEN 2  THEN ISNULL(r.status, 0) WHEN 3  THEN ISNULL(r.status, 0) ELSE 4 END AS status, r.DeliveryTime, r.ReceiveTime, 
                      r.ExpressName, r.CourierNumber, r.ReggionPath, r.Address, m.UserId, m.PlayTime, m.IsUsed, g.GameType, g.GameTitle, g.BeginTime, g.EndTime, g.ApplyMembers, 
                      g.OnlyGiveNotPrizeMember, g.PlayType, g.NotPrzeDescription, g.GameUrl, g.GameQRCodeAddress, p.PrizeGrade, p.PrizeType, p.GiveCouponId, p.GiveShopBookId,p.Prize,p.IsLogistics, 
                      p.GriveShopBookPicUrl, p.PrizeCount, p.PrizeRate, u.UserName, u.RealName, u.CellPhone, u.Address AS UAddress, ps.ProductId, ps.ProductName, 
                      ps.ThumbnailUrl100, ISNULL(r.Id, 0) AS Id, p.GivePoint
FROM         dbo.Hishop_PromotionGameResultMembersLog AS m INNER JOIN
                      dbo.Hishop_PromotionGamePrizes AS p ON m.PrizeId = p.PrizeId INNER JOIN
                      dbo.Hishop_PromotionGame AS g ON m.GameId = g.GameId INNER JOIN
                      dbo.aspnet_Members AS u ON m.UserId = u.UserId LEFT OUTER JOIN
                      dbo.Hishop_Products AS ps ON p.GiveShopBookId = ps.ProductId LEFT OUTER JOIN
                      dbo.Hishop_PrizesDeliveryRecord AS r ON m.LogId = r.LogId
GO
CREATE VIEW [dbo].[vw_Hishop_PrizesRecord]
	AS 
SELECT	 
l.LogId,l.PlayTime,
l.UserId,m.UserName,
p.PrizeGrade,p.PrizeType,
p.GivePoint,p.GiveCouponId,
p.GiveShopBookId,l.GameId,l.IsUsed,p.Prize,l.PrizeId,p.IsLogistics
From Hishop_PromotionGameResultMembersLog as l inner join
 Hishop_PromotionGamePrizes as p on l.PrizeId=p.PrizeId 
left join aspnet_Members as m on l.UserId=m.UserId
GO
CREATE VIEW [dbo].[vw_Hishop_ProductConsultations]
AS
SELECT
	  p.[ProductId]
      ,p.[ProductName]     
	  ,p.[ProductCode]
      ,p.[ThumbnailUrl40]
      ,p.[ThumbnailUrl60]  
	  ,p.[CategoryId]
      ,c.[ConsultationId]
	  ,c.[ConsultationText]
      ,c.[ConsultationDate]
      ,c.[ReplyText]
      ,c.[UserName]
      ,c.[ReplyUserId]
      ,c.[Userid]
	  ,c.[ReplyDate]
FROM Hishop_Products p inner join Hishop_ProductConsultations c ON p.productId=c.ProductId
GO
CREATE VIEW [dbo].[vw_Hishop_ProductReviews]
AS
SELECT
	p.[ProductId]
	,p.ProductCode
	,p.[ProductName]
	,p.[CategoryId]
	,p.[ThumbnailUrl60]
    ,r.ReviewId
    ,r.ReviewText
    ,r.ReviewDate
    ,r.UserId
    ,r.UserName
FROM 
	Hishop_Products p (nolock)inner join Hishop_ProductReviews r on (r.productId=p.ProductId)
GO
CREATE VIEW [dbo].[vw_Hishop_ProductSkuList]
AS
SELECT CategoryId, BrandId,ProductName,ProductCode,MarketPrice,ThumbnailUrl40, ThumbnailUrl60,
 SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, AddedDate, VistiCounts, s.*
FROM Hishop_Products p JOIN Hishop_SKUs s ON p.ProductId = s.ProductId
GO
CREATE VIEW [dbo].[vw_Hishop_PromotionGame]
as
select g.GameID,g.GameType,g.GameTitle,g.BeginTime,g.EndTime,g.PlayType,g.GameUrl,g.GameQRCodeAddress,g.Status,isnull(v1.TotalCount,0) as TotalCount,
isnull(v2.PrizeCount,0) as PrizeCount, g.LimitEveryDay,g.MaximumDailyLimit
from Hishop_PromotionGame as g left join(
select GameId, COUNT(UserId) as TotalCount  from Hishop_PromotionGameResultMembersLog group by GameId
)as v1 on g.GameId= v1.GameId left join (
select GameId, COUNT(UserId) as PrizeCount  from Hishop_PromotionGameResultMembersLog where PrizeId>=1 group by GameId 
) as v2 on g.GameId=v2.GameId
GO
CREATE VIEW [dbo].[vw_Hishop_ReplyKeysReply]
AS
SELECT     dbo.Weibo_Reply.Id, dbo.Weibo_Reply.ReplyKeyId, dbo.Weibo_Reply.IsDisable, dbo.Weibo_Reply.EditDate, dbo.Weibo_Reply.[Content], dbo.Weibo_Reply.Type, 
                      dbo.Weibo_Reply.ReceiverType, dbo.Weibo_Reply.Displayname AS Display_name, dbo.Weibo_Reply.Summary, dbo.Weibo_Reply.Image, dbo.Weibo_Reply.Url, 
                      dbo.Weibo_Reply.ArticleId, dbo.Weibo_ReplyKeys.Matching, dbo.Weibo_ReplyKeys.Keys
FROM         dbo.Weibo_Reply INNER JOIN
                      dbo.Weibo_ReplyKeys ON dbo.Weibo_Reply.ReplyKeyId = dbo.Weibo_ReplyKeys.Id
GO
CREATE VIEW [dbo].[vw_Hishop_SaleDetails]
AS
SELECT oi.OrderId, oi.ItemDescription AS ProductName, oi.Quantity, oi.ItemAdjustedPrice, o.orderDate, o.OrderStatus 
FROM Hishop_OrderItems oi join Hishop_orders o on oi.OrderId = o.OrderId
GO
CREATE view [dbo].[vw_OrderMmemberComment]
as
 select a.*,c.UserId from Hishop_OrderItems a 
 left join Hishop_ProductReviews b on a.skuid= b.skuid and a.orderid=b.orderid 
 left join Hishop_Orders c on a.orderid=c.orderid 
 where   b.orderid is null
GO
CREATE view [dbo].[vw_UserOrderByPage]
as

SELECT UserId,ThumbnailsUrl, ItemDescription, SKUContent, SKU,OrderItemsStatus, ProductId,Quantity,ReturnMoney,SkuID,o.OrderId,OrderMarking, OrderDate, OrderStatus,PaymentTypeId, OrderTotal,   Gateway,(SELECT count(0) FROM vshop_OrderRedPager WHERE OrderId = o.OrderId and ExpiryDays<getdate() and AlreadyGetTimes<MaxGetTimes) as HasRedPage,(SELECT SUM(Quantity) FROM Hishop_OrderItems WHERE OrderId = o.OrderId) as ProductSum 
FROM Hishop_Orders o join Hishop_OrderItems b on o.OrderId=b.OrderId
GO

CREATE view [dbo].[vw_VShop_FinishOrder_Detail]
as
/*
????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????

select * from vw_VShop_FinishOrder_Detail

*/
SELECT     a.OrderStatus, a.Gateway, a.OrderDate, a.PayDate, a.ReferralUserId, a.UserId, b.Id, b.OrderId, b.SkuId, b.ProductId, b.SKU, b.Quantity, b.ShipmentQuantity, 
                      b.CostPrice, b.ItemListPrice, b.ItemAdjustedPrice, b.ItemAdjustedCommssion, b.ItemDescription, b.ThumbnailsUrl, b.Weight, b.SKUContent, b.PromotionId, 
                      b.PromotionName, b.OrderItemsStatus, b.ItemsCommission, b.SecondItemsCommission, b.ThirdItemsCommission, b.PointNumber, b.Type, b.IsHandled, 
                      b.ReturnMoney, b.DiscountAverage, b.IsAdminModify
FROM         dbo.Hishop_OrderItems AS b INNER JOIN
                      dbo.Hishop_Orders AS a ON a.OrderId = b.OrderId
WHERE     (a.OrderStatus <> 4) AND (a.OrderStatus <> 1) AND (a.Gateway <> 'hishop.plugins.payment.podrequest') OR
                      (a.OrderStatus <> 4) AND (a.Gateway = 'hishop.plugins.payment.podrequest')
GO
create view [dbo].[vw_VShop_FinishOrder_Detail_All]
as
/*
??????????????????  2=?????????  3=??????????????????  5=?????????

select * from vw_VShop_FinishOrder_Detail

*/
	select a.PayDate, a.ReferralUserId, a.UserId,a.OrderStatus, b.*
				from Hishop_OrderItems b
				left join Hishop_Orders a on a.OrderId= b.OrderId 
				where 1=1
GO
create view [dbo].[vw_VShop_FinishOrder_Main]
as
SELECT     a.OrderId, a.OrderStatus, a.UserId, a.Gateway, a.Username, a.ReferralUserId, a.OrderDate, a.PayDate, a.OrderTotal AS ValidOrderTotal, ISNULL(T1.SumCommission, 
                      0) AS SumCommission
FROM         dbo.Hishop_Orders AS a LEFT OUTER JOIN
                          (SELECT     OrderId AS OrderId_Item, SUM(ItemsCommission + SecondItemsCommission + ThirdItemsCommission) AS SumCommission
                            FROM          dbo.Hishop_OrderItems AS b
                            WHERE      (OrderItemsStatus <> 4)
                            GROUP BY OrderId) AS T1 ON a.OrderId = T1.OrderId_Item
WHERE     (a.OrderStatus <> 4) AND(a.OrderStatus <> 12) AND (a.OrderStatus <> 1) AND (a.Gateway <> 'hishop.plugins.payment.podrequest') OR
                      (a.OrderStatus <> 4) AND (a.Gateway = 'hishop.plugins.payment.podrequest')
					  --?????????(a.OrderStatus <> 12)???????????????????????????????????????????????????
GO
create view [dbo].[vw_VShop_FinishOrder_Main_Payed]
as
/*
?????????????????????????????????????????????????????????????????????????????????2=??????????????????  3=??????????????????  5=????????????
select * from [vw_VShop_FinishOrder_Main_Payed]

select * from vw_VShop_FinishOrder_Detail

--update Hishop_Orders set paydate= finishDate where paydate is null
sp_refreshview   [vw_VShop_FinishOrder_Main]

alter table  Hishop_OrderItems add ReturnMoney money default 0


*/

--select  * from Hishop_OrderItems


		select  a.OrderId, a.UserId,a.Username, a.ReferralUserId, a.PayDate, 
				--T1.SumItemAmountFee - isnull(r.RefundMoney,0)  as ValidOrderTotal
				
				--a.OrderTotal - isnull(r.RefundMoney,0)  as ValidOrderTotal ,
				a.OrderTotal  as  OrderTotal ,
				--a.OrderTotal - isnull(T1.ReturnMoney,0)  as ValidOrderTotal ,
				a.OrderTotal    as ValidOrderTotal ,   --2015-9-19???????????????????????????????????????????????????????????????????????????????????????OrderTotal????????????????????????
				 isnull(T1.ReturnMoney,0)  as ReturnMoney ,
				
				isnull(T1.SumCommission,0) as SumCommission
				from Hishop_Orders a 
				left join 
				(
					select  OrderId as OrderId_Item, 
					   SUM( (ItemsCommission + SecondItemsCommission + ThirdItemsCommission))  as SumCommission,
					   sum(isnull(ReturnMoney,0)) as ReturnMoney
						from Hishop_OrderItems b  
						where 
						1=1 
						and ( OrderItemsStatus =2 or OrderItemsStatus = 3   or OrderItemsStatus =5)
						group by OrderId
				) T1  on a.OrderId = T1.OrderId_Item				
				where 1=1
				and ( OrderStatus =2 or OrderStatus = 3   or OrderStatus =5)
GO
CREATE view [dbo].[vw_VShop_FinishOrder_Main_PayedAndNoClosed]
as
/*
?????????????????????????????????????????????????????????????????????????????????2=??????????????????  3=??????????????????  5=????????????

select * from [vw_VShop_FinishOrder_Main_PayedAndNoClosed]
select  ItemAdjustedPrice * Quantity - DiscountAverage - ReturnMoney,
select * from Hishop_OrderItems where orderid='201509199691596'

select  * from Hishop_Orders where orderid='201509199691596'
 
 select * from Hishop_OrderItems where orderid in 
( select  orderid from Hishop_Orders where  Gateway='hishop.plugins.payment.podrequest'  )

201509223162229

*/

--select  * from Hishop_OrderItems
-- select  * from Hishop_Orders where orderid='201509199691596'


		select  a.OrderId, a.UserId,a.Username, a.ReferralUserId, 
				case
					when ( Gateway='hishop.plugins.payment.podrequest' and PayDate is null ) then OrderDate
					else PayDate
				end as PayDate, --a.PayDate, 
				a.OrderTotal  as  OrderTotal ,
				--a.OrderTotal    as ValidOrderTotal ,   --2015-9-19???????????????????????????????????????????????????????????????????????????????????????OrderTotal???????????????????????? 20151023????????????????????????OrderTotal???????????????
				isnull(ItemTotal,0) as  ValidOrderTotal,
				isnull(T1.ReturnMoney,0)  as ReturnMoney ,			
				isnull(T1.SumCommission,0) as SumCommission,
				a.OrderStatus
				from Hishop_Orders a 
				left join 
				(
					select  b.OrderId as OrderId_Item, 
					   sum(ItemAdjustedPrice * Quantity - DiscountAverage - ReturnMoney) as ItemTotal,
					   
					   SUM( (ItemsCommission + SecondItemsCommission + ThirdItemsCommission))  as SumCommission,
					   sum(isnull(ReturnMoney,0)) as ReturnMoney
						from Hishop_OrderItems b  
						left join Hishop_Orders m on b.OrderId=m.OrderId
						where 1=1 
						and ( OrderItemsStatus<>1 or m.Gateway='hishop.plugins.payment.podrequest' )
						and  OrderItemsStatus<>4 and OrderItemsStatus<>9 and OrderItemsStatus<>10
						group by b.OrderId
				) T1  on a.OrderId = T1.OrderId_Item				
				where 1=1
				and  ( OrderStatus<>1 or Gateway='hishop.plugins.payment.podrequest')
				and   OrderStatus<>4 and OrderStatus<>9 and OrderStatus<>10
GO
CREATE VIEW [dbo].[vw_Vshop_OneyuanPartInList]
AS
SELECT     dbo.Vshop_OneyuanTao_ParticipantMember.Pid, dbo.Vshop_OneyuanTao_ParticipantMember.UserId, dbo.Vshop_OneyuanTao_ParticipantMember.BuyTime, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.BuyNum, dbo.Vshop_OneyuanTao_ParticipantMember.IsPay, dbo.Vshop_OneyuanTao_ParticipantMember.ActivityId, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.SkuId, dbo.Vshop_OneyuanTao_ParticipantMember.SkuIdStr, dbo.Vshop_OneyuanTao_ParticipantMember.ProductPrice, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.PayTime, dbo.Vshop_OneyuanTao_ParticipantMember.PayWay, dbo.Vshop_OneyuanTao_ParticipantMember.PayNum, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.Remark, dbo.Vshop_OneyuanTao_ParticipantMember.TotalPrice, dbo.Vshop_OneyuanTao_ParticipantMember.IsRefund, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.RefundNum, dbo.Vshop_OneyuanTao_ParticipantMember.RefundTime, dbo.aspnet_MemberGrades.Name, 
                      dbo.aspnet_Members.UserName, dbo.Vshop_OneyuanTao_Detail.IsOn, dbo.Vshop_OneyuanTao_Detail.Title, dbo.Vshop_OneyuanTao_Detail.StartTime, 
                      dbo.Vshop_OneyuanTao_Detail.EndTime, dbo.Vshop_OneyuanTao_Detail.HeadImgage, dbo.Vshop_OneyuanTao_Detail.ReachType, 
                      dbo.Vshop_OneyuanTao_Detail.ActivityDec, dbo.Vshop_OneyuanTao_Detail.IsEnd, dbo.Vshop_OneyuanTao_Detail.FinishedNum, dbo.aspnet_Members.UserHead, 
                      dbo.Vshop_OneyuanTao_Detail.ProductImg, dbo.Vshop_OneyuanTao_Detail.ProductTitle, dbo.Vshop_OneyuanTao_Detail.PrizeNumber, 
                      dbo.Vshop_OneyuanTao_ParticipantMember.IsWin, dbo.Vshop_OneyuanTao_ParticipantMember.WinIds, dbo.Vshop_OneyuanTao_ParticipantMember.WinTime, 
                      dbo.Vshop_OneyuanTao_Detail.PrizeTime, dbo.aspnet_Members.CellPhone, dbo.Vshop_OneyuanTao_Detail.HasCalculate, 
                      dbo.Vshop_OneyuanTao_Detail.IsSuccess, dbo.Vshop_OneyuanTao_ParticipantMember.RefundErr, dbo.Vshop_OneyuanTao_Detail.ReachNum


FROM         dbo.aspnet_Members INNER JOIN
                      dbo.Vshop_OneyuanTao_ParticipantMember ON dbo.aspnet_Members.UserId = dbo.Vshop_OneyuanTao_ParticipantMember.UserId INNER JOIN
                      dbo.Vshop_OneyuanTao_Detail ON dbo.Vshop_OneyuanTao_Detail.ActivityId = dbo.Vshop_OneyuanTao_ParticipantMember.ActivityId LEFT OUTER JOIN
                      dbo.aspnet_MemberGrades ON dbo.aspnet_Members.GradeId = dbo.aspnet_MemberGrades.GradeId
GO
CREATE VIEW [dbo].[vw_Vshop_OneyuanWinnerList]
AS
SELECT     A.Pid,A.ActivityId,A.UserId,
                          (SELECT     cast(PrizeNum AS varchar(10)) + ','
                            FROM          Vshop_OneyuanTao_WinningRecord
                            WHERE      Pid = A.Pid and IsWin=1
                            ORDER BY Pid,ActivityId,UserId FOR XML PATH('')) AS PrizeNums
FROM         Vshop_OneyuanTao_WinningRecord A where A.IsWin=1
GROUP BY A.Pid,A.ActivityId,UserId
GO
CREATE view [dbo].[vw_VShop_Order_Detail_PayedAndNoClosed]
as
/*
??????????????????????????????????????????????????????????????????????????????
???????????????????????????????????????????????????

select * from vw_VShop_Order_Detail_PayedAndNoClosed

*/
	select --a.PayDate, 
				case
					when ( Gateway='hishop.plugins.payment.podrequest' and PayDate is null ) then OrderDate
					else PayDate
				end as PayDate,
					
			a.ReferralUserId, a.UserId, b.*
				from Hishop_OrderItems b
				left join Hishop_Orders a on a.OrderId= b.OrderId 
						where 1=1 
						and ( OrderItemsStatus<>1 or a.Gateway='hishop.plugins.payment.podrequest' )
						and  OrderItemsStatus<>4 and OrderItemsStatus<>9 and OrderItemsStatus<>10
GO

 


 CREATE VIEW [dbo].[vw_Vshop_ProductPrizeLIst]
AS
SELECT  '' AS PrizeNums,p.PrizeGrade,g.GameType,  0 as Ptype, m.LogId,'0' as Pid,PlayTime as WinTime,g.GameTitle as Title,ps.ProductName,' ' as SkuIdStr,p.GriveShopBookPicUrl as ThumbnailUrl100 ,p.IsLogistics,p.PrizeType
FROM         dbo.Hishop_PromotionGameResultMembersLog AS m INNER JOIN
                      dbo.Hishop_PromotionGamePrizes AS p ON m.PrizeId = p.PrizeId INNER JOIN
                      dbo.Hishop_PromotionGame AS g ON m.GameId = g.GameId INNER JOIN
                      dbo.Hishop_Products AS ps ON p.GiveShopBookId = ps.ProductId  and p.PrizeType=2      
Union 
SELECT   w.PrizeNums,5 as PrizeGrade, 5 as GameType,  1 as Ptype,  0 as LogId,w.Pid,d.PrizeTime as WinTime,d.Title,d.ProductTitle,p.SkuIdStr,d.ProductImg  as ThumbnailUrl100, '0' as IsLogistics,'0' as PrizeType FROM  vw_Vshop_OneyuanWinnerList  w, 
 dbo.Vshop_OneyuanTao_ParticipantMember p ,Vshop_OneyuanTao_Detail D 
 where  w.Pid = p.Pid and w.ActivityId=d.ActivityId 
 Union 
 SELECT  '' AS PrizeNums,p.PrizeGrade,g.GameType,  0 as Ptype, m.LogId,'0' as Pid,PlayTime as WinTime,g.GameTitle as Title,p.Prize as ProductName,' ' as SkuIdStr,p.PrizeImage as ThumbnailUrl100 ,p.IsLogistics,p.PrizeType
FROM         dbo.Hishop_PromotionGameResultMembersLog AS m INNER JOIN
                      dbo.Hishop_PromotionGamePrizes AS p ON m.PrizeId = p.PrizeId INNER JOIN
                      dbo.Hishop_PromotionGame AS g ON m.GameId = g.GameId   and  p.PrizeType =3 and p.IsLogistics=1
GO
CREATE VIEW [dbo].[vw_Vshop_ProductPrizeLIst_WithDelievelyInfo]
	AS 
SELECT v.*,Isnull(r.Id,0) as Id,Receiver,r.Tel,Isnull(r.status,0) as status,r.DeliveryTime,r.ReceiveTime,r.ExpressName,r.CourierNumber,r.ReggionPath,r.Address,r.RecordType
FROM vw_Vshop_ProductPrizeLIst v left join 
Hishop_PrizesDeliveryRecord r on (v.LogId = r.LogId and v.LogId!=0)  or  (v.LogId=0 and v.Pid=r.Pid)
GO
-- =============================================
-- Author:		?????????
-- Description:	?????????????????????
-- =============================================
CREATE PROCEDURE cp_AddIntegralDetail
	@IntegralSourceType int,
	@IntegralSource varchar(100),
	@IntegralChange int,
	@Remark varchar(500),
	@Userid int,
	@GoToUrl varchar(100),
	@IntegralStatus int
AS
BEGIN
	if @IntegralChange <>0
	Begin
		Insert into vshop_IntegralDetail(IntegralSourceType,IntegralSource,IntegralChange,Remark,Userid,GoToUrl,TrateTime,IntegralStatus) 
		values(@IntegralSourceType,@IntegralSource,@IntegralChange,@Remark,@Userid,@GoToUrl,GETDATE(),@IntegralStatus);
	End
END
GO
CREATE PROCEDURE [dbo].[cp_Category_Create]
	(
		@IconUrl NVARCHAR(255) = NULL,
		@Name NVARCHAR(100) = NULL,
		@DisplaySequence INT = NULL,
		@Meta_Title NVARCHAR(1000)=NULL,
		@Meta_Description NVARCHAR(1000) = NULL,
		@Meta_Keywords NVARCHAR(1000) = NULL,
		@ParentCategoryId INT = NULL,
		@RewriteName NVARCHAR(50) = NULL,
		@SKUPrefix NVARCHAR(10) = NULL,
		@AssociatedProductType INT = NULL,
		@Notes1 NTEXT = NULL,
		@Notes2 NTEXT = NULL,
		@Notes3 NTEXT = NULL,
		@Notes4 NTEXT = NULL,
		@Notes5 NTEXT = NULL,
		@FirstCommission NVARCHAR(50),
		@SecondCommission NVARCHAR(50),
		@ThirdCommission NVARCHAR(50),
		@CategoryId INT OUTPUT
	)
AS
Declare @Err As int
SELECT @Err=0

SET XACT_ABORT ON
Begin Tran
	
IF @ParentCategoryId IS NULL OR @ParentCategoryId < 0
	SET @ParentCategoryId = 0
	
--??????????????????????????????ID


Select @CategoryId = ISNULL(Max(CategoryId),0) From Hishop_Categories
IF @CategoryId Is Not Null
	Set @CategoryId = @CategoryId+1
Else
	Set @CategoryId = 1

--???????????????????????????????????????Path???Depth
Declare @Depth As int
Declare @Path As nvarchar(4000)

IF @ParentCategoryId = 0
Begin
	Select @DisplaySequence = ISNULL(MAX(DisplaySequence),0) + 1 from Hishop_Categories where ParentCategoryId = 0
	Set @Path =Ltrim(RTRIM(Str(@CategoryId)))
	Set @Depth = 1
End
Else
Begin
	--?????????????????????????????????
	Select @Path = [Path] ,@Depth = Depth From Hishop_Categories Where CategoryId=@ParentCategoryId
	Select @DisplaySequence = ISNULL(MAX(DisplaySequence),0) + 1 from Hishop_Categories where ParentCategoryId = @ParentCategoryId
	IF @Path Is Null
	Begin
		Set @Err = 1
		Goto theEnd
	End
	
	Set @Path = @Path + '|' + Ltrim(RTRIM(Str(@CategoryId)))
	Set @Depth = @Depth+1
End

Insert Into Hishop_Categories(
	CategoryId, [Name], DisplaySequence,IconUrl,Meta_Title, Meta_Description, Meta_Keywords, SKUPrefix,AssociatedProductType,
	ParentCategoryId, Depth, Path, RewriteName, Notes1, Notes2, Notes3, Notes4, Notes5,FirstCommission,SecondCommission,ThirdCommission
) 
Values(
	@CategoryId, @Name, @DisplaySequence,@IconUrl,@Meta_Title, @Meta_Description, @Meta_Keywords, @SKUPrefix,@AssociatedProductType,
	@ParentCategoryId, @Depth, @Path, @RewriteName, @Notes1, @Notes2, @Notes3, @Notes4, @Notes5,@FirstCommission,@SecondCommission,@ThirdCommission
)

IF @@Error<>0 
Begin
	Set @Err=1
	Goto theEnd
End

theEnd:
IF @Err=0
Begin
	Commit Tran
	Return @CategoryId
End
Else
Begin
    Rollback Tran
	Return 0
End
GO
CREATE PROCEDURE [dbo].[cp_Category_Delete]
(
	@CategoryId INT
)
AS
Declare @Err As int, @Count INT, @DisplaySequence INT
DECLARE @Path nvarchar(4000)

SET XACT_ABORT ON
Begin Tran

CREATE TABLE #tempTable (CategoryId INT)

SELECT @Err = 0, @Path = Path, @DisplaySequence = DisplaySequence FROM Hishop_Categories WHERE CategoryId = @CategoryId
INSERT INTO #tempTable SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @CategoryId OR Path LIKE '' + @Path + '|%'

SET @Count = @@ROWCOUNT

-- ??????????????????????????????
DELETE From Hishop_Categories Where CategoryId IN (SELECT CategoryId FROM #tempTable)

-- ??????????????????????????????0??????????????????
UPDATE Hishop_Products SET CategoryId = 0, MainCategoryPath = null WHERE CategoryId IN (SELECT CategoryId FROM #tempTable)


DROP TABLE #tempTable

  Commit Tran
GO
CREATE PROCEDURE [dbo].[cp_ClaimCode_Create]
	(
		@row int,
        @CouponId int,
        @UserId int,
        @EmailAddress nvarchar(255),
		@UserName nvarchar(256),
        @ReturnLotNumber nvarchar(300) OUTPUT
	)
AS
declare @LotNumber uniqueidentifier
set  @LotNumber=newid()
 WHILE(@row>0)
BEGIN
SET ROWCOUNT @row
    INSERT Hishop_CouponItems SELECT
         CouponId=@CouponId,
         LotNumber=@LotNumber,
        ClaimCode =SUBSTRING(REPLACE(newid(),'-',''),1,15),
        UserId=@UserId,UserName=@UserName,EmailAddress=@EmailAddress,GenerateTime=getdate(),CouponStatus=0,UsedTime=null,OrderId=null
    FROM syscolumns c1, syscolumns c2   
 SET @row = @row - @@ROWCOUNT
END
SET @ReturnLotNumber=CONVERT(NVARCHAR(300),@LotNumber)
GO
CREATE PROCEDURE cp_IsCanPrize
	@GameId int,
	@UserId int,
	@Result int output
AS
BEGIN
	set @Result=0;
	--????????????????????????
	Declare @Count int;
	Declare @EveryDayCount int;
	Declare @PayCount int;
	Set @Count=0;
	Set @EveryDayCount=0;
	Set @PayCount=0;
	Select @EveryDayCount=LimitEveryDay,@PayCount=MaximumDailyLimit from Hishop_PromotionGame Where GameId=@GameId And Status=0;
	Select @Count=COUNT(*) From Hishop_PromotionGame where GameId=@GameId And Status=0;
	if @Count<=0
	Begin
		set @Result=7;--???????????????????????????
		return;
	End
	Select @Count=COUNT(*) From Hishop_PromotionGame where GameId=@GameId And Status=0 And BeginTime<=GETDATE();
	if @Count<=0
	Begin
		set @Result=8;--??????????????????????????????
		return;
	End
	Select @Count=COUNT(*) From Hishop_PromotionGame where GameId=@GameId And BeginTime<=GETDATE() And EndTime>=GETDATE();
	if @Count<=0
	Begin
		set @Result=7;--???????????????????????????
		return;
	End
	--??????????????????????????????????????????????????????
	Declare @PlayType int;
	Declare @NeedPoint int;
	Select @PlayType=PlayType,@NeedPoint=NeedPoint from Hishop_PromotionGame Where GameId=@GameId;
	 
	--??????????????????????????????
	if @NeedPoint >0
	Begin
		Declare @UserPoint int;
		select @UserPoint=Points from dbo.aspnet_Members where UserId=@UserId;
		if @UserPoint < @NeedPoint
		Begin
			set @Result=2;--??????????????????????????????
			return;
		End
	End
	--?????????????????????????????????
	Set @Count=0;
	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId And PlayTime>=CONVERT(varchar(100), GETDATE(), 23)
	if  @Count >=@EveryDayCount and @EveryDayCount>0
	Begin
	   set @Result=3;--????????????????????????????????????
	   return;
	End
	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId
	if @Count >=@PayCount and @PayCount>0
	Begin
	   set @Result=4;--??????????????????????????????
	   return;
	End
	--if @PlayType=0 --????????????
	--Begin
	--	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId And PlayTime>=CONVERT(varchar(100), GETDATE(), 23)
	--	if @Count>=1
	--	Begin
	--		set @Result=3;--????????????????????????????????????
	--		return;
	--	End
	--End 
	--else if @PlayType=1 --????????????
	--Begin
	--	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId ;
	--	if @Count>=1
	--	Begin
	--		set @Result=4;--?????????????????????????????????
	--		return;
	--	End
	--End
	--else if @PlayType=2 --????????????
	--Begin
	--	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId And PlayTime>=CONVERT(varchar(100), GETDATE(), 23)
	--	if @Count>=2
	--	Begin
	--		set @Result=5;--??????????????????????????????????????????
	--		return;
	--	End
	--End
	--else if @PlayType=3 --????????????
	--Begin
	--	select @Count=COUNT(*) from Hishop_PromotionGameResultMembersLog where UserId=@UserId AND GameId=@GameId ;
	--	if @Count>=2
	--	Begin
	--		set @Result=6;--?????????????????????????????????
	--		return;
	--	End
	--End
END
GO
--?????????
--??????????????????????????????????????????
CREATE PROCEDURE cp_MemberCanReceiveCoupon
	@CouponsId int,
	@UserId int,
	@Result int output
AS
Begin
	Declare @Count int;
	Set @Count=0;
	Select @Count=COUNT(*) From Hishop_Coupon_Coupons Where Finished=0 And EndDate>=GETDATE() And CouponId=@CouponsId;
	if @Count >0
	Begin
		Declare @MaxReceivNum int;
		Declare @StockNum int;
		Declare @ReceiveNum int;
		Declare @MemberGrades varchar(100);
		Set @MaxReceivNum=0;
		Set @StockNum=0;
		Set @ReceiveNum=0;
		Select @MaxReceivNum=maxReceivNum,@StockNum=StockNum,@ReceiveNum=ReceiveNum,@MemberGrades=MemberGrades From Hishop_Coupon_Coupons Where  CouponId=@CouponsId;

		--????????????????????????????????????
		--if @MemberGrades!='0'
		--	Begin
		--	Declare @UserGrade varchar(50);
		--	select @UserGrade=GradeId from dbo.aspnet_Members where UserId=@UserId;
		--	Set @MemberGrades=@MemberGrades+',';
		--   if charindex(@UserGrade+',',@MemberGrades+',')<1
		--   Begin	
		--		set @Result=2;--???????????????????????????????????????????????????
		--		return;
		--   End
		--End
		
		--?????????????????????
		if @ReceiveNum+1>@StockNum
		Begin
			set @Result=3;--????????????????????????
			return;
		End
		
		--???????????????????????????
		Set @Count=0;
		Select @Count=COUNT(*) From Hishop_Coupon_MemberCoupons where MemberId=@UserId And CouponId=@CouponsId;
		if @Count>=@MaxReceivNum
		Begin
			set @Result=4;--??????????????????????????????????????????
			return;
		End
		
	End
	Else
	Begin
		Set @Result=1;--????????????????????????
		Return;
	End
	Set @Result=0;
End
GO
CREATE PROCEDURE [dbo].[cp_MemberStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		UserName nvarchar(256) NOT NULL,
		UserId int,
		SaleTotals money default(0),
		OrderCount int default(0)
	)	

	INSERT INTO #PageIndexForProductSales(UserId, UserName, SaleTotals, OrderCount)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT S.IndexId,
		S.Username, ISNULL(S.SaleTotals, 0) as SaleTotals , ISNULL(S.OrderCount, 0) as OrderCount
	FROM   #PageIndexForProductSales S
	WHERE 
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END
GO
CREATE PROCEDURE [dbo].[cp_Menu_SwapDisplaySequence]
	(
		@MenuId INT,
		@ZIndex INT
	)
AS
	
	DECLARE @ParentMenuId INT, @DisplaySequence INT
	DECLARE @swap_MenuId INT, @swap_DisplaySequence INT
	
	SELECT @ParentMenuId = ParentMenuId, @DisplaySequence = DisplaySequence FROM vshop_Menu WHERE MenuId = @MenuId

	IF @ZIndex = 0
		SELECT TOP 1 @swap_MenuId = MenuId, @swap_DisplaySequence = DisplaySequence FROM vshop_Menu WHERE ParentMenuId = @ParentMenuId AND DisplaySequence < @DisplaySequence ORDER BY DisplaySequence DESC
	ELSE
		SELECT TOP 1 @swap_MenuId = MenuId, @swap_DisplaySequence = DisplaySequence FROM vshop_Menu WHERE ParentMenuId = @ParentMenuId AND DisplaySequence > @DisplaySequence ORDER BY DisplaySequence ASC
	
	IF @swap_MenuId IS NULL
		RETURN;

	SET XACT_ABORT ON
	BEGIN TRAN
	
	UPDATE vshop_Menu SET DisplaySequence = @swap_DisplaySequence WHERE MenuId = @MenuId
	UPDATE vshop_Menu SET DisplaySequence = @DisplaySequence WHERE MenuId = @swap_MenuId
	
	COMMIT TRAN
GO
Create PROCEDURE [dbo].[cp_OrderStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalUserOrders int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForUserOrders
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		OrderId nvarchar(50)
	)	

	INSERT INTO #PageIndexForUserOrders(OrderId)
	Exec sp_executesql @sqlPopulate

	SET @TotalUserOrders = @@rowcount
	
	SELECT O.OrderId, OrderDate, Isnull(OrderTotal,0) as Total, Username, ShipTo,Isnull(OrderProfit,0) As Profits
	FROM Hishop_Orders O, #PageIndexForUserOrders UO 
	WHERE 
			O.OrderId = UO.OrderId AND
			UO.IndexId > @PageLowerBound AND
			UO.IndexId < @PageUpperBound
	ORDER BY UO.IndexId 
    ------------------------------------------------------------
    -- ?????????????????????????????,???????????,????????????
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- ???????????
        Isnull(SUM(OrderProfit),0) AS Profits --????????????
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId and
       #PageIndexForUserOrders.IndexId > @PageLowerBound and  
	   #PageIndexForUserOrders.IndexId < @PageUpperBound
   
    -- ?????????????????????????????????,???????????,????????????
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- ???????????
        Isnull(SUM(OrderProfit),0) AS Profits --????????????
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId  
      
    drop table #PageIndexForUserOrders
END
GO
CREATE PROCEDURE [dbo].[cp_OrderStatisticsNoPage_Get]
(
	@sqlPopulate ntext,
	@TotalUserOrders int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN

	CREATE TABLE #PageIndexForUserOrders
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		OrderId nvarchar(50)
	)	

	INSERT INTO #PageIndexForUserOrders(OrderId)
	Exec sp_executesql @sqlPopulate

	SET @TotalUserOrders = @@rowcount
	
	SELECT O.OrderId, OrderDate, Isnull(OrderTotal,0) as Total, Username, ShipTo, Isnull(OrderProfit,0) As Profits
	FROM Hishop_Orders O, #PageIndexForUserOrders UO 
	WHERE 
			O.OrderId = UO.OrderId
	ORDER BY UO.IndexId 
    ------------------------------------------------------------
    -- ??????????????????,?????????,??????
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- ?????????
        Isnull(SUM(OrderProfit),0) AS Profits --??????
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId
   drop table #PageIndexForUserOrders
END
GO
Create PROCEDURE [dbo].[cp_PaymentType_CreateUpdateDelete]
(
@ModeId INT = NULL OUTPUT,
@Name NVARCHAR(100) = null,
@Description NVARCHAR(4000) = NULL,
@Gateway NVARCHAR(200) = NULL,
@IsUseInpour BIT = NULL,
@IsUseInDistributor BIT = NULL,
@Charge MONEY = NULL,
@IsPercent BIT = NULL,
@Settings NTEXT = NULL,
@Action INT,
@Status INT OUTPUT
)
AS

DECLARE @DisplaySequence INT

SET @Status = 99

IF @Action = 2 -- ??????
BEGIN
DELETE FROM Hishop_PaymentTypes WHERE ModeId = @ModeId
IF @@ROWCOUNT = 1
BEGIN
SET @Status = 0
END

RETURN
END

IF @Action = 0 -- ??????
BEGIN

--??????????????????????????? ???????????????????????????1
IF (Select Max(DisplaySequence) From Hishop_PaymentTypes) IS NULL
SET @DisplaySequence=1
-- ????????????????????? ?????????????????????????????????????????????1
ELSE
SELECT @DisplaySequence = MAX(DisplaySequence)+1 FROM Hishop_PaymentTypes

INSERT INTO
Hishop_PaymentTypes([Name], Description, Gateway, DisplaySequence, IsUseInpour,IsUseInDistributor, Charge, IsPercent, Settings)
VALUES
(@Name, @Description, @Gateway, @DisplaySequence, @IsUseInpour, @IsUseInDistributor,@Charge, @IsPercent, @Settings)

SELECT @ModeId = @@IDENTITY
IF @@ROWCOUNT = 1
SET @Status = 0

RETURN
END

IF @Action = 1 -- ??????
BEGIN

UPDATE
Hishop_PaymentTypes
SET
[Name] = @Name,
Description = @Description,
IsUseInpour = @IsUseInpour,
IsUseInDistributor = @IsUseInDistributor,
Charge = @Charge,
IsPercent = @IsPercent,
Settings = @Settings
WHERE ModeId = @ModeId
IF @@ROWCOUNT = 1
SET @Status = 0

RETURN
END
GO
CREATE PROCEDURE [dbo].[cp_Product_Create]
(
@CategoryId INT,
@MainCategoryPath NVARCHAR(256),
@TypeId INT = NULL,
@ProductName NVARCHAR(200),
@ProductShortName NVARCHAR(50),
@ProductCode [nvarchar] (50),
@ShortDescription NVARCHAR(2000) = NULL,
@Unit NVARCHAR(10) = NULL,
@Description NTEXT = NULL,
@Title NVARCHAR(100) = NULL,
@Meta_Description NVARCHAR(1000) = NULL,
@Meta_Keywords NVARCHAR(1000) = NULL,
@SaleStatus INT,
@AddedDate DATETIME,
@ImageUrl1 [nvarchar] (255) = NULL,
@ImageUrl2 [nvarchar] (255) = NULL,
@ImageUrl3 [nvarchar] (255) = NULL,
@ImageUrl4 [nvarchar] (255) = NULL,
@ImageUrl5 [nvarchar] (255) = NULL,
@ThumbnailUrl40 [nvarchar] (255) = NULL,
@ThumbnailUrl60 [nvarchar] (255) = NULL,
@ThumbnailUrl100 [nvarchar] (255) = NULL,
@ThumbnailUrl160 [nvarchar] (255) = NULL,
@ThumbnailUrl180 [nvarchar] (255) = NULL,
@ThumbnailUrl220 [nvarchar] (255) = NULL,
@ThumbnailUrl310 [nvarchar] (255) = NULL,
@ThumbnailUrl410 [nvarchar] (255) = NULL,
@MarketPrice MONEY = NULL,
@BrandId [int],
@HasSKU [BIT],
@IsfreeShipping [bit],
@TaobaoProductId [bigint],
@ShowSaleCounts int,

@MinShowPrice MONEY =0,
@MaxShowPrice MONEY =0,
@FreightTemplateId INT =0,
@FirstCommission DECIMAL(8,2) =0,
@SecondCommission DECIMAL(8,2) =0,
@ThirdCommission DECIMAL(8,2) =0,
@IsSetCommission BIT=0,
@CubicMeter DECIMAL(8,2)=0,
@FreightWeight  DECIMAL(8,2)=0,


@ProductId INT OUTPUT
)
AS

SET @ProductId = 0

--??????????????????????????????????????????1
DECLARE @DisplaySequence INT
SELECT @DisplaySequence = MAX(DisplaySequence) + 1 FROM  Hishop_Products
if @DisplaySequence is null
 	set @DisplaySequence = 1

INSERT INTO Hishop_Products
(CategoryId, MainCategoryPath, TypeId, ProductName,ProductShortName, ProductCode, ShortDescription, Unit, [Description], SaleStatus, AddedDate, DisplaySequence,
ImageUrl1, ImageUrl2, ImageUrl3, ImageUrl4, ImageUrl5, ThumbnailUrl40, ThumbnailUrl60, ThumbnailUrl100, ThumbnailUrl160, ThumbnailUrl180,
ThumbnailUrl220, ThumbnailUrl310, ThumbnailUrl410,
MarketPrice, BrandId, HasSKU,IsfreeShipping,TaobaoProductId,MinShowPrice,MaxShowPrice,FreightTemplateId,FirstCommission,SecondCommission,ThirdCommission,IsSetCommission,CubicMeter,FreightWeight,ShowSaleCounts)
Values
(@CategoryId, @MainCategoryPath, @TypeId, @ProductName,@ProductShortName, @ProductCode, @ShortDescription, @Unit,  @Description,@SaleStatus, @AddedDate, @DisplaySequence,
@ImageUrl1, @ImageUrl2, @ImageUrl3, @ImageUrl4, @ImageUrl5, @ThumbnailUrl40, @ThumbnailUrl60, @ThumbnailUrl100, @ThumbnailUrl160, @ThumbnailUrl180,
@ThumbnailUrl220, @ThumbnailUrl310, @ThumbnailUrl410,
@MarketPrice, @BrandId, @HasSKU,@IsfreeShipping,@TaobaoProductId,@MinShowPrice,@MaxShowPrice,@FreightTemplateId,@FirstCommission,@SecondCommission,@ThirdCommission,@IsSetCommission,@CubicMeter,@FreightWeight,@ShowSaleCounts)
SET @ProductId = @@IDENTITY;
GO
CREATE PROCEDURE [dbo].[cp_Product_GetExportList]
	@sqlPopulate ntext
AS
	CREATE TABLE #Products
	(
		[ProductId] int,
		[TypeId] int,
		[ProductName] [nvarchar] (200),
		[ProductCode] [nvarchar] (50),
		[ShortDescription] [nvarchar] (2000),
		[Unit] [nvarchar] (50),
		[Description] [ntext],		
		[SaleStatus] [int],
		[ImageUrl1] [nvarchar] (255),
		[ImageUrl2] [nvarchar] (255),
		[ImageUrl3] [nvarchar] (255),
		[ImageUrl4] [nvarchar] (255),
		[ImageUrl5] [nvarchar] (255),
		[MarketPrice] [money],
		[HasSKU] [BIT]
	)

	-- ??????
	INSERT INTO #Products ([ProductId], [TypeId], [ProductName], [ProductCode], [ShortDescription], [Unit], [Description],
		[SaleStatus], [ImageUrl1], [ImageUrl2], [ImageUrl3], [ImageUrl4], [ImageUrl5], [MarketPrice], [HasSKU]) 
    Exec sp_executesql @sqlPopulate
	-- ??????
	SELECT TypeId, TypeName, Remark INTO  #Types FROM Hishop_ProductTypes WHERE TypeId IN (SELECT DISTINCT([TypeId]) FROM #Products WHERE #Products.TypeId IS NOT NULL)
	-- ??????
	SELECT [SkuId], [ProductId], [SKU], [Weight], [Stock], [CostPrice], [SalePrice] INTO #Skus
		FROM Hishop_SKUs WHERE ProductId IN (SELECT ProductId FROM #Products)
	-- ?????????
	SELECT [SkuId], [AttributeId], [ValueId] INTO #SKUItems FROM Hishop_SKUItems WHERE SkuId IN (SELECT SkuId FROM #Skus)
	-- ????????????
	SELECT [ProductId], [AttributeId], [ValueId] INTO #ProductAttributes FROM Hishop_ProductAttributes WHERE ProductId IN (SELECT ProductId FROM #Products)
	-- ??????
	SELECT [AttributeId], [AttributeName], [DisplaySequence], [TypeId], [UsageMode], [UseAttributeImage] INTO #Attributes 
		FROM Hishop_Attributes WHERE [AttributeId] IN (SELECT DISTINCT([AttributeId]) FROM #SKUItems UNION SELECT DISTINCT([AttributeId]) FROM #ProductAttributes)
	-- ?????????
	SELECT [ValueId], [AttributeId], [DisplaySequence], [ValueStr], [ImageUrl] INTO #Values 
		FROM Hishop_AttributeValues WHERE [ValueId] IN (SELECT DISTINCT([ValueId]) FROM #SKUItems UNION SELECT DISTINCT([ValueId]) FROM #ProductAttributes)
		
	---???????????????
	SELECT  *
		INTO #TaoBaoSKU FROM dbo.Taobao_Products WHERE [ProductId] IN (SELECT ProductId FROM #Products) 


	-- ??????????????????
	SELECT * FROM #Types
	-- ?????????????????????
	SELECT * FROM #Attributes
	--???????????????
	SELECT * FROM #Values
	--??????????????????
	SELECT * FROM #Products
	-- ????????????????????????
	SELECT * FROM #Skus
	-- ??????????????????????????????
	SELECT * FROM #SKUItems
	-- ??????????????????
	SELECT * FROM #ProductAttributes
	-- ?????????????????????
	SELECT * FROM #TaoBaoSKU

	DROP TABLE #Types
	DROP TABLE #Attributes
	DROP TABLE #Values
	DROP TABLE #Products
	DROP TABLE #Skus
	DROP TABLE #SKUItems
	DROP TABLE #ProductAttributes
	DROP TABLE #TaoBaoSKU
GO
CREATE PROCEDURE [dbo].[cp_Product_Update]
(
@CategoryId INT,
@MainCategoryPath NVARCHAR(256),
@TypeId INT = NULL,
@ProductName NVARCHAR(200),
@ProductShortName NVARCHAR(50),
@ProductCode [nvarchar] (50),
@ShortDescription NVARCHAR(2000) = NULL,
@Unit NVARCHAR(10) = NULL,
@Description NTEXT = NULL,
@SaleStatus INT,
@DisplaySequence INT,
@ImageUrl1 [nvarchar] (255) = NULL,
@ImageUrl2 [nvarchar] (255) = NULL,
@ImageUrl3 [nvarchar] (255) = NULL,
@ImageUrl4 [nvarchar] (255) = NULL,
@ImageUrl5 [nvarchar] (255) = NULL,
@ThumbnailUrl40 [nvarchar] (255) = NULL,
@ThumbnailUrl60 [nvarchar] (255) = NULL,
@ThumbnailUrl100 [nvarchar] (255) = NULL,
@ThumbnailUrl160 [nvarchar] (255) = NULL,
@ThumbnailUrl180 [nvarchar] (255) = NULL,
@ThumbnailUrl220 [nvarchar] (255) = NULL,
@ThumbnailUrl310 [nvarchar] (255) = NULL,
@ThumbnailUrl410 [nvarchar] (255) = NULL,
@MarketPrice MONEY = NULL,
@BrandId INT,
@HasSKU BIT,
@IsfreeShipping [bit],
@SaleCounts INT,
@ShowSaleCounts INT,
@ProductId INT,
@MinShowPrice MONEY =0,
@MaxShowPrice MONEY =0,
@FreightTemplateId INT =0,
@FirstCommission DECIMAL(8,2) =0,
@SecondCommission DECIMAL(8,2) =0,
@ThirdCommission DECIMAL(8,2)=0,
@IsSetCommission BIT=0,
@CubicMeter DECIMAL(8,2)=0,
@FreightWeight  DECIMAL(8,2)=0
)
AS

--???????????????????????????????????????????????????????????????????????????
IF (SELECT DisplaySequence FROM Hishop_Products WHERE ProductId = @ProductId) != @DisplaySequence AND EXISTS(SELECT ProductId FROM Hishop_Products WHERE DisplaySequence = @DisplaySequence)
UPDATE Hishop_Products SET DisplaySequence = DisplaySequence + 1 WHERE DisplaySequence >= @DisplaySequence

UPDATE Hishop_Products SET
CategoryId = @CategoryId, MainCategoryPath = @MainCategoryPath, TypeId = @TypeId, ProductName = @ProductName,ProductShortName=@ProductShortName, ProductCode = @ProductCode,
ShortDescription = @ShortDescription, Unit = @Unit, [Description] = @Description, MarketPrice = @MarketPrice, SaleStatus = @SaleStatus, DisplaySequence = @DisplaySequence,
ImageUrl1 = @ImageUrl1, ImageUrl2 = @ImageUrl2, ImageUrl3 = @ImageUrl3, ImageUrl4 = @ImageUrl4, ImageUrl5 = @ImageUrl5,
ThumbnailUrl40 = @ThumbnailUrl40, ThumbnailUrl60 = @ThumbnailUrl60, ThumbnailUrl100 = @ThumbnailUrl100, ThumbnailUrl160 = @ThumbnailUrl160, ThumbnailUrl180 = @ThumbnailUrl180,
ThumbnailUrl220 = @ThumbnailUrl220, ThumbnailUrl310 = @ThumbnailUrl310, ThumbnailUrl410 = @ThumbnailUrl410, 
BrandId = @BrandId, HasSKU = @HasSKU,IsfreeShipping=@IsfreeShipping,SaleCounts = @SaleCounts, ShowSaleCounts = @ShowSaleCounts,
MinShowPrice=@MinShowPrice,MaxShowPrice=@MaxShowPrice,FreightTemplateId=@FreightTemplateId,FirstCommission=@FirstCommission,SecondCommission=@SecondCommission,ThirdCommission=@ThirdCommission,IsSetCommission=@IsSetCommission,CubicMeter=@CubicMeter,FreightWeight=@FreightWeight
WHERE ProductId = @ProductId
GO
Create PROCEDURE [dbo].[cp_ProductSales_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		ProductSaleCounts int,
		ProductSaleTotals money,
		ProductProfitsTotals money
	)	

	INSERT INTO #PageIndexForProductSales(ProductId, ProductSaleCounts, ProductSaleTotals, ProductProfitsTotals)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT IDOfSaleTotals=(select count(1)+1 from #PageIndexForProductSales where ProductSaleCounts>s.ProductSaleCounts),
		P.ProductName,P.ProductCode as SKU,
		case when S.ProductSaleCounts is null then 0 else S.ProductSaleCounts end as ProductSaleCounts , 
		case when S.ProductSaleTotals is null then 0 else S.ProductSaleTotals end as ProductSaleTotals , 
		case when S.ProductProfitsTotals is null then 0 else S.ProductProfitsTotals end as ProductProfitsTotals
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId AND
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END
GO
CREATE PROCEDURE [dbo].[cp_ProductSalesNoPage_Get]
(
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		ProductSaleCounts int,
		ProductSaleTotals money,
		ProductProfitsTotals money
	)	

	INSERT INTO #PageIndexForProductSales(ProductId, ProductSaleCounts, ProductSaleTotals, ProductProfitsTotals)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT IDOfSaleTotals=(select count(1)+1 from #PageIndexForProductSales where ProductSaleCounts>s.ProductSaleCounts),
		P.ProductName,P.ProductCode as SKU,
		case when S.ProductSaleCounts is null then 0 else S.ProductSaleCounts end as ProductSaleCounts , 
		case when S.ProductSaleTotals is null then 0 else S.ProductSaleTotals end as ProductSaleTotals , 
		case when S.ProductProfitsTotals is null then 0 else S.ProductProfitsTotals end as ProductProfitsTotals
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId
	ORDER BY S.IndexId
END
GO
Create PROCEDURE [dbo].[cp_ProductVisitAndBuyStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		BuyPercentage decimal(18, 0)		
	)	

	INSERT INTO #PageIndexForProductSales(ProductId,BuyPercentage)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT S.IndexId,P.ProductName,P.VistiCounts,P.SaleCounts as BuyCount ,S.BuyPercentage    
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId AND
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END
GO
Create PROCEDURE [dbo].[cp_RegionsUsers_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalRegionsUsers int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForRegionsUsers
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		RegionId int,
		RegionName char(100),
		UserCounts int,
		AllUserCounts int
	)	

	INSERT INTO #PageIndexForRegionsUsers(RegionId, RegionName, UserCounts, AllUserCounts)
	Exec sp_executesql @sqlPopulate

	SET @TotalRegionsUsers = @@rowcount
	
	SELECT RU.RegionId, RU.RegionName, RU.UserCounts, RU.AllUserCounts
	FROM   #PageIndexForRegionsUsers RU
	WHERE 
			RU.IndexId > @PageLowerBound AND
			RU.IndexId < @PageUpperBound
	ORDER BY RU.IndexId
	
	drop table #PageIndexForRegionsUsers
END
GO
--?????????
--????????????????????????
CREATE PROCEDURE cp_SendCouponToMember
	@CouponsId int,
	@UserId int,
	@Result int output
AS
BEGIN
	--??????????????????????????????
	Set @Result=0;
	Exec cp_MemberCanReceiveCoupon @CouponsId,@UserId,@Result output;
	if @Result>0
	Begin
		return;
	End
	--????????????????????????????????????
	Insert into Hishop_Coupon_MemberCoupons(CouponId,MemberId,ReceiveDate,[Status],CouponName,ConditionValue,BeginDate,EndDate,CouponValue)
	select CouponId,@UserId as MemberId,GETDATE() as ReceiveDate,0 as [Status], CouponName,ConditionValue,BeginDate,EndDate,CouponValue
	from Hishop_Coupon_Coupons where CouponId=@CouponsId;
	--???????????????????????????
	Update Hishop_Coupon_Coupons set ReceiveNum=ReceiveNum+1 where CouponId=@CouponsId;
END
GO
CREATE PROCEDURE cp_SendCouponUser
	@GradeIds varchar(50),
	@ReferralUserId varchar(20),
	@BeginCreateDate varchar(50),
	@EndCreateDate varchar(50),
	@UserType int,
	@CustomGroupIds varchar(50),
	@AdminId int,
	@Count int output
AS
BEGIN
	Declare @Where varchar(4000);
	Set @Where=' 1=1 ';
	if @ReferralUserId !=''
	Begin
		Set @Where=@Where+' And ReferralUserId='+@ReferralUserId
	End
	if @BeginCreateDate !=''
	Begin
		Set @Where=@Where+' And CreateDate >= '''+@BeginCreateDate+''' '
	End
	if @EndCreateDate !=''
	Begin
		Declare @TempD DateTime;
		Set @TempD = DATEADD(d,1,@EndCreateDate);
		set @EndCreateDate= Convert(varchar(10),@TempD,120);
		Set @Where=@Where+' And CreateDate < '''+@EndCreateDate+''' '
	End
	--???????????????????????????????????????
	Delete From Hishop_TempSendCouponUserLists where AdminId=@AdminId;
	--?????????????????????????????? ???????????????
	Declare @UserBySelect table(UserId int);
	Insert into @UserBySelect(UserId)
	Exec('select UserId from dbo.aspnet_Members where '+@Where);
	
	--??????????????????????????????
	Declare @TypeUser table(UserId int);
	Declare @dates int;
	Declare @SelectDate datetime;
	Declare @ActivyUser table(Userid int);--???????????????????????????
	Declare @SleepUser table(UserId int);--???????????????????????????
	set @dates=0;
	if @UserType=1 --?????????
	Begin
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u left join
		(SELECT UserId FROM  dbo.Hishop_Orders group by UserId) as v
		on u.Userid = v.UserId where v.UserId is null
	End
	if @UserType=2 --????????????
	Begin
		select top 1 @dates = -1*isnull(ActiveDay,1) from Hishop_UserGroupSet;
		set @SelectDate = DATEADD(d,@dates,Convert(varchar(10),getdate(),120));
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join
		(select a.UserId from vw_VShop_FinishOrder_Main as a 
		where PayDate>=@SelectDate group by UserId) as v
		on u.Userid = v.UserId;
	End
	if @UserType=3 --????????????
	Begin
		--????????????
		select top 1 @dates = -1*isnull(ActiveDay,1) from Hishop_UserGroupSet;
		set @SelectDate = DATEADD(d,@dates,Convert(varchar(10),getdate(),120));
		Insert into @ActivyUser(Userid)
		select a.UserId from vw_VShop_FinishOrder_Main as a 
		where PayDate>=@SelectDate group by UserId;

		--????????????
		with allSaleCustomer
		as(
		select a.UserId from vw_VShop_FinishOrder_Main as a group by UserId)
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join(
		select us.UserId from allSaleCustomer us left join @ActivyUser as au
		on us.UserId = au.Userid
		where au.Userid is null) as v
		on u.Userid = v.UserId;
	End
	if @UserType=12 --????????????????????????
	Begin
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u left join
		(SELECT UserId FROM  dbo.Hishop_Orders group by UserId) as v
		on u.Userid = v.UserId where v.UserId is null;
		
		select top 1 @dates = -1*isnull(ActiveDay,1) from Hishop_UserGroupSet;
		set @SelectDate = DATEADD(d,@dates,Convert(varchar(10),getdate(),120));
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join
		(select a.UserId from vw_VShop_FinishOrder_Main as a 
		where PayDate>=@SelectDate group by UserId) as v
		on u.Userid = v.UserId where v.UserId is null;
		
	End
	if @UserType=13 --????????????????????????
	Begin
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u left join
		(SELECT UserId FROM  dbo.Hishop_Orders group by UserId) as v
		on u.Userid = v.UserId where v.UserId is null;
		
		--????????????
		select top 1 @dates = -1*isnull(ActiveDay,1) from Hishop_UserGroupSet;
		set @SelectDate = DATEADD(d,@dates,Convert(varchar(10),getdate(),120));
		Insert into @ActivyUser(Userid)
		select a.UserId from vw_VShop_FinishOrder_Main as a 
		where PayDate>=@SelectDate group by UserId;

		--????????????
		with allSaleCustomer
		as(
		select a.UserId from vw_VShop_FinishOrder_Main as a group by UserId)
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join(
		select us.UserId from allSaleCustomer us left join @ActivyUser as au
		on us.UserId = au.Userid
		where au.Userid is null) as v
		on u.Userid = v.UserId;
		
	End
	if @UserType=23 --???????????????????????????
	Begin
		--????????????
		select top 1 @dates = -1*isnull(ActiveDay,1) from Hishop_UserGroupSet;
		set @SelectDate = DATEADD(d,@dates,Convert(varchar(10),getdate(),120));
		Insert into @ActivyUser(Userid)
		select a.UserId from vw_VShop_FinishOrder_Main as a 
		where PayDate>=@SelectDate group by UserId;
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join
		@ActivyUser as v
		on u.Userid = v.UserId;
		
		--????????????
		with allSaleCustomer
		as(
		select a.UserId from vw_VShop_FinishOrder_Main as a group by UserId)
		Insert into @TypeUser(UserId)
		Select u.UserId From @UserBySelect as u inner join(
		select us.UserId from allSaleCustomer us left join @ActivyUser as au
		on us.UserId = au.Userid
		where au.Userid is null) as v
		on u.Userid = v.UserId;
	End
	
	--?????????????????????????????????
	Declare @CustomGroupUser table(UserId int);
	if @CustomGroupIds !='0'--???????????????
	Begin
		Declare @GroupUser table(UserId int);
		Insert into @GroupUser
		Exec('select UserId from dbo.Vshop_CustomGroupingUser where GroupId in('+@CustomGroupIds+')');

		Insert into @CustomGroupUser(UserId)
		Select u.UserId From @UserBySelect as u inner join
		(SELECT UserId FROM @GroupUser group by UserId) as v on u.Userid = v.UserId
	End

	if @GradeIds='0'
	Begin
		if @UserType=0
		Begin
			if @CustomGroupIds='0'
			Begin--??????????????????????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				Select UserId,@AdminId From @UserBySelect;
			End
			else
			Begin--?????????????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				Select UserId,@AdminId From @CustomGroupUser;
			End
		End
		else
		Begin
			if @CustomGroupIds='0'
			Begin--????????????????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				Select UserId,@AdminId From @TypeUser;
			End
			else
			Begin--???????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				select UserId,@AdminId from(
				Select UserId From @TypeUser
				union
				Select UserId From @CustomGroupUser) as v group by v.UserId;
			End
		End
	End
	Else
	Begin--????????????????????????
		Declare @GradeUser table(UserId int);
		Insert into @GradeUser
		Exec('select UserId from dbo.aspnet_Members where '+@Where+' and GradeId in('+@GradeIds+')');
		if @UserType=0 --??????????????????
		Begin
			if @CustomGroupIds='0'
			Begin--????????????????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				Select UserId,@AdminId From @GradeUser group by UserId;
			End
			else
			Begin--???????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				select UserId,@AdminId from(
				Select UserId From @GradeUser
				union
				Select UserId From @CustomGroupUser) as v group by v.UserId;
			End
		End
		else
		Begin
			if @CustomGroupIds='0'
			Begin--??????????????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				select UserId,@AdminId from(
				Select UserId From @GradeUser
				union
				Select UserId From @TypeUser) as v group by v.UserId;
			End
			else
			Begin--?????????????????????????????????????????????
				Insert Into Hishop_TempSendCouponUserLists(UserId,AdminId)
				select UserId,@AdminId from(
				Select UserId From @GradeUser
				union
				Select UserId From @TypeUser
				union
				Select UserId From @CustomGroupUser) as v group by v.UserId;
			End
		End
	End

	Select @Count=COUNT(*) From Hishop_TempSendCouponUserLists where AdminId=@AdminId;
END
GO
Create Procedure [dbo].[cp_ShippingMode_Create]
(
 @ModeId int output,
 @Name nvarchar(100),
 @TemplateId int,	
 @Description nvarchar(4000)=null,
 @Status int Output
)
as 
DECLARE @DisplaySequence INT
SET @Status = 99
BEGIN TRAN
--??????????????????????????? ???????????????????????????1
   IF  (Select Max(DisplaySequence) From Hishop_ShippingTypes) IS NUll
      SET @DisplaySequence = 1
   -- ????????????????????? ?????????????????????????????????????????????1
   ELSE
      SET @DisplaySequence = (Select Max(DisplaySequence) From Hishop_ShippingTypes) + 1
 INSERT INTO Hishop_ShippingTypes ([Name],TemplateId,[Description],DisplaySequence)
 VALUES (@Name,@TemplateId,@Description,@DisplaySequence)
  SET @ModeId = @@IDENTITY
     IF @@ROWCOUNT = 1
	   SET @Status = 0
	 
COMMIT
GO
Create Procedure [dbo].[cp_ShippingMode_Update]
(
 @ModeId INT =null,
 @Name nvarchar(100),
 @TemplateId INT,
 @Description nvarchar(4000)=null,
 @Status INT Output
)
as 
DECLARE @DisplaySequence INT
DECLARE @intErrorCode INT
	SELECT @Status = 99, @intErrorCode = 0
BEGIN TRAN
  --???????????????????????????   
   SET @DisplaySequence = (Select DisplaySequence  From Hishop_ShippingTypes where ModeId=@ModeId)
     
   Update Hishop_ShippingTypes 
   SET [Name]=@Name,TemplateId=@TemplateId , Description =@Description
   Where ModeId=@ModeId
   SET @intErrorCode = @intErrorCode + @@ERROR
      
   IF @intErrorCode = 0
    BEGIN
       DELETE FROM Hishop_TemplateRelatedShipping Where ModeId=@ModeId
   END
  IF @intErrorCode = 0
	BEGIN
		COMMIT TRAN
		SET @Status = 0
	END
	ELSE
		ROLLBACK TRAN
GO
CREATE PROCEDURE [dbo].[cp_Votes_Create]
	(
		@VoteName NVARCHAR(100),
		@IsBackup BIT,
		@MaxCheck INT,
		@ImageUrl NVARCHAR(255),
		@StartDate DateTime,
		@EndDate DateTime,
		@Keys NVARCHAR(200),
		@VoteId int OUTPUT
	)
AS

IF @IsBackup = 1
	BEGIN
		UPDATE Hishop_Votes SET IsBackup = 0
	END

INSERT INTO Hishop_Votes (VoteName, IsBackup, MaxCheck, ImageUrl, StartDate, EndDate)
 VALUES (@VoteName, @IsBackup, @MaxCheck, @ImageUrl, @StartDate, @EndDate)
SET @VoteId = @@IDENTITY ;
GO
create proc [dbo].[sp_Statistics_Member]
as
begin
/*
exec sp_Statistics_Member

????????????????????????????????????????????????????????????????????????

?????????????????????????????????,??????????????????????????????????????????????????????		

*/
    --select 
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'ActiveUserQty',  
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'SleepUserQty',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'SuccessTradeUserQty',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'SuccessTradeUserQty_Yesterday',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'PotentialUserQty',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'PotentialUserQty_Yesterday',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'CollectUserQty',
    --(select COUNT(*) from  vw_BuyerMember where 1=1) as 'CartUserQty',
    --(select COUNT(*) from  aspnet_Members where 1=1) as 'MemberQty'
                    
        
     
        
    declare 
			@NewUserQty int, --?????????
			@ActiveUserQty int,
			@SleepUserQty int,
			
			@SuccessTradeUserQty int,  --?????????????????????????????????
			@SuccessTradeUserQty_Yesterday int	,
			
			@PotentialUserQty	int,  --????????????(????????????)
			@PotentialUserQty_Yesterday int,
			
			@CollectUserQty int , --???????????????
			@CartUserQty int, --??????????????????
			
			@MemberQty int  --????????????
			
	select @ActiveUserQty=0, @SleepUserQty=0
                   

	declare @ActiveDay int,
			@StartTime datetime, @EndTime datetime
			


	--??????????????? ?????????  ?????????
	select top 1 @ActiveDay= ActiveDay  from Hishop_UserGroupSet 
	set @ActiveDay=ISNULL(@ActiveDay,1)			
	

	 
	 /*
	 ????????????????????????????????????
	 ?????????????????????*????????????????????????
	 ?????????????????????*?????????????????????????????????????????????????????????
	 
	 */
	 
	--?????????
	select @MemberQty=COUNT(*) from aspnet_Members where Status=1
			
	--?????????
	select @NewUserQty=COUNT(*) from aspnet_Members
		where  OrderNumber=0 and   Status=1
	
	--????????????(???)??? ????????????????????????(??????????????????????????????)
	select @SuccessTradeUserQty = count(*)
	from 
	(
		select a.UserID from vw_VShop_FinishOrder_Main	 a
			inner join aspnet_Members b on a.UserId= b.UserId 
			where b.Status=1
			group by a.UserId			
	) T1
		
					
	--????????????
	select @ActiveUserQty=COUNT(*)
	from 
	(
	select a.UserId
		from vw_VShop_FinishOrder_Main	 a
		inner join aspnet_Members b on a.UserId= b.UserId 
		where b.Status=1
		and 
		(
		(CONVERT(varchar(10), PayDate + @ActiveDay , 120 ) >= CONVERT(varchar(10), GETDATE() , 120 )
		 and Gateway<>'hishop.plugins.payment.podrequest'
		 )
		 or(
		 Gateway='hishop.plugins.payment.podrequest' and
		 CONVERT(varchar(10), OrderDate+ @ActiveDay , 120 ) = CONVERT(varchar(10), GETDATE() , 120 )
		 )
		)
		group by a.UserId  
	) T1
	
	set @SleepUserQty=@SuccessTradeUserQty - @ActiveUserQty
	set @SleepUserQty=ISNULL(@SleepUserQty,0)
	 
	

	
	--?????????????????????????????????????????????????????????????????????????????????
    select @SuccessTradeUserQty_Yesterday=count(c1.UserId) from  (
    select distinct UserId from
		vw_VShop_FinishOrder_Main  where
		 (CONVERT(varchar(10), PayDate , 120 ) = CONVERT(varchar(10), GETDATE()-1 , 120 )
		 and Gateway<>'hishop.plugins.payment.podrequest'
		 )
		 or(
		 Gateway='hishop.plugins.payment.podrequest' and
		 CONVERT(varchar(10), OrderDate , 120 ) = CONVERT(varchar(10), GETDATE()-1 , 120 )
		 )
     ) as c1
    where 
    c1.UserId not in (select distinct UserId from
		vw_VShop_FinishOrder_Main  where
		 (CONVERT(varchar(10), PayDate , 120 ) < CONVERT(varchar(10), GETDATE()-1 , 120 )
		 and Gateway<>'hishop.plugins.payment.podrequest'
		 )
		 or(
		 Gateway='hishop.plugins.payment.podrequest' and
		 CONVERT(varchar(10), OrderDate , 120 ) < CONVERT(varchar(10), GETDATE()-1 , 120 )
		 )
		 )
    
  
	--???????????????(????????????????????????????????????)
	select @PotentialUserQty = COUNT(*)
		from aspnet_Members 
		where OrderNumber=0 and Status=1
	
	--??????????????????
    select @PotentialUserQty_Yesterday = COUNT(*) from aspnet_Members a
		where  CONVERT(varchar(10), CreateDate , 120 ) = CONVERT(varchar(10), GETDATE()-1 , 120 )
		and Status=1 and UserId not in(select UserId from
		vw_VShop_FinishOrder_Main  where
		 (CONVERT(varchar(10), PayDate , 120 ) >= CONVERT(varchar(10), GETDATE()-1 , 120 )
		 and Gateway<>'hishop.plugins.payment.podrequest'
		 )
		 or(
		 Gateway='hishop.plugins.payment.podrequest' and
		 CONVERT(varchar(10), OrderDate , 120 ) >= CONVERT(varchar(10), GETDATE()-1 , 120 )
		 )
		 )
		

	--???????????????
	--select  @CollectUserQty = COUNT(*) from (select UserId from Hishop_Favorite group by UserId ) T1
	select  @CollectUserQty = COUNT(*) from (
		select a.UserID from Hishop_Favorite	 a
			left join aspnet_Members b on a.UserId= b.UserId 
			where b.Status=1
			group by a.UserId	
	) T1	
	
			
	
	--??????????????????
	--select @CartUserQty = COUNT(*)
	--from
	--(
	--	select userid
	--	from Hishop_ShoppingCarts
	--	group by UserId
	--) t1
	select @CartUserQty = COUNT(*)
	from
	(
		select a.UserID from Hishop_ShoppingCarts	 a
			left join aspnet_Members b on a.UserId= b.UserId 
			where b.Status=1
			group by a.UserId	
	) t1	
	
 
	
 
	
    select 
		@NewUserQty as 'NewUserQty', 
		@ActiveUserQty as 'ActiveUserQty',  
		@SleepUserQty as 'SleepUserQty',
		@SuccessTradeUserQty as 'SuccessTradeUserQty',
		@SuccessTradeUserQty_Yesterday as 'SuccessTradeUserQty_Yesterday',
		@PotentialUserQty as 'PotentialUserQty',
		@PotentialUserQty_Yesterday as 'PotentialUserQty_Yesterday',
		@CollectUserQty as 'CollectUserQty',
		@CartUserQty as 'CartUserQty',
		@MemberQty as 'MemberQty'
    	
	
 
        
end
GO
create proc [dbo].[sp_vshop_Statistics_Daily]
@RecDate datetime=null,
@FuncAction int =999,
@IsUpdateLog int=1,  --???????????????????????? 2015-10-12

@RetCode int output,  --???????????? 1 ?????????????????????
@RetInfo varchar(256) output
as
begin

/*
@FuncAction??????:
  OrderUpdate = 100,
  CommissionsDraw=101,
  MemberUpdate = 200,
  ProductUpdate = 300,
  AllUpdate = 999
  
  
?????????????????????????????????????????????
????????????_??????????????????
????????????_???????????????
????????????_????????????

????????????????????????????????????

????????????
declare @RetCode int 
declare  @RetInfo varchar(256) 
exec sp_vshop_Statistics_Daily '2015-10-28', 999, 0, @RetCode,@RetInfo

sp_refreshview vw_VShop_FinishOrder_Detail

??????????????????
UPDATE  aspnet_Members SET Status=7 WHERE UserId = @UserId

*/
	declare @DEF_IsShowDebugInfo int  --??????????????????????????? 1=???  ??????=???
	set @DEF_IsShowDebugInfo = -1

	select @RetCode = -1, @RetInfo ='???????????????', @FuncAction=isnull(@FuncAction,999)

	if @RecDate is null
		set @RecDate= GETDATE()

	select @RecDate = CONVERT(varchar(10), @RecDate, 120 )


	declare @IsFirstCount int,  --?????????1?????????
			@ErrorStep varchar(256)
	set @IsFirstCount =0
	set @ErrorStep =''
	
	set @IsUpdateLog =ISNULL(@IsUpdateLog,1)
	
	if @IsUpdateLog=1
	begin
		if exists(Select top 1 * from vshop_Statistics_Log where RecDate= @RecDate )
		begin
			Update vshop_Statistics_Log
				set BeginTime= GETDATE(), EndTime=null, IsSuccess= -1, ErrorStep='', LogInfo=''
				where  RecDate= @RecDate
		end
		else
		begin
			insert into vshop_Statistics_Log (
				RecDate, FirstCountTime, BeginTime, EndTime, IsSuccess, ErrorStep, LogInfo
				)
				values (
				@RecDate, GETDATE(),	GETDATE(),  null,	 0,			'',			  ''
				)
			set @IsFirstCount =1
		end
	end
	
	
/*			

??????????????????=1
????????????=2
?????????=3
????????????=5
?????????=4(?????????????????????)
?????????=6
?????????=9
?????????=10
*/	
	
	declare @DEF_Status_RefundFee int,  --???????????????????????????
			@DEF_Status_Finish int  --???????????????????????????
	select @DEF_Status_RefundFee =3,
			@DEF_Status_Finish=5
			
	/*
	??????8.29???????????????
	1??????????????????????????????????????????????????????
	2??????????????????????????????????????????????????????
	3????????????????????????????????????
	4????????????????????????????????????????????????????????????????????????
	*/
		 
	
	begin try
			if @FuncAction in ( 100, 101, 999,99 )
			begin			
					set @ErrorStep ='????????????_??????????????????'
			
					if ( @FuncAction=99 or @FuncAction=999)  and @IsUpdateLog=1
						Update vshop_Statistics_Log
							set  ErrorStep= @ErrorStep
							where  RecDate= @RecDate			
					/*****************************************************
					????????????_?????????????????? vshop_Statistics_Globals
					*****************************************************/
					if exists(Select top 1 * from vshop_Statistics_Globals where RecDate= @RecDate )
						delete from  vshop_Statistics_Globals where RecDate= @RecDate
					 

					declare @OrderNumber int,	
							@SaleAmountFee money,
							@BuyerNumber int,
							@UserAvgPrice money,
							
							@FXOrderNumber int,
							@FXSaleAmountFee money,
							@FXResultPercent numeric(19,3),
							@CommissionFee  money,
							@FinishedDrawCommissionFee  money,  --???????????????
							@WaitDrawCommissionFee  money,		--?????????
							
							@NewMemberNumber int,
							@NewAgentNumber int
							 
						
					select 	@OrderNumber =0,	@SaleAmountFee =0,	@BuyerNumber =0,@UserAvgPrice =0,
							@FXOrderNumber=0,	@FXSaleAmountFee=0, @FXResultPercent=0,@CommissionFee=0,
							@FinishedDrawCommissionFee=0,			@WaitDrawCommissionFee=0,
							
							@NewMemberNumber=0, @NewAgentNumber =0

					--???????????????( ????????????????????????????????????????????????)	??? ????????????(???????????????)
					select @OrderNumber = COUNT(*) , @SaleAmountFee = SUM (  ValidOrderTotal)
						from  vw_VShop_FinishOrder_Main
						where    
						(OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
							or
							( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')
					  
						
					--???????????????(???????????????????????????????????????????????????)
					select @BuyerNumber =  count(*)
					from 
					(
						select  UserName  -- @BuyerNumber =  count(*)  
							from vw_VShop_FinishOrder_Main  a
							where 
							(OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
							or
							( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')
							group by a.Username 
					) T1
					
					--?????????
					set @UserAvgPrice=0
					if @BuyerNumber>0
						set @UserAvgPrice =( @SaleAmountFee * 1.0 / @BuyerNumber )

                    --??????????????????
					select @FXOrderNumber = COUNT(*) 
						from vw_VShop_FinishOrder_Main a
						where ReferralUserId>0 and(
						    (OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
							or
							( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')
							)
				
 				
						
					--????????????????????????(???????????????)
					select @FXSaleAmountFee =  SUM( ValidOrderTotal ) 
						from vw_VShop_FinishOrder_Main a
						where ReferralUserId>0 and(
						    (OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
							or
							( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')
							)		

					--?????????????????????????????????/?????????????????????
					set @FXResultPercent=0
					if @FXSaleAmountFee>0
						set @FXResultPercent = @FXSaleAmountFee  * 1.0 / @SaleAmountFee   * 100
					set @FXSaleAmountFee = ISNULL(@FXSaleAmountFee,0)
						
					
					select @CommissionFee = SUM(ISNULL(SumCommission,0))
						from vw_VShop_FinishOrder_Main a
						where ReferralUserId>0 and(
						    (OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
							or
							( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')
							)							
					set @CommissionFee = ISNULL(@CommissionFee,0)	
					
					--?????????????????????				
					SELECT @FinishedDrawCommissionFee= SUM(Amount) from Hishop_BalanceDrawRequest   
						where isnull(IsCheck,0)=2 and CONVERT( varchar(10), CheckTime, 120) =  CONVERT( varchar(10), @RecDate, 120)
					SELECT @WaitDrawCommissionFee=SUM(Amount) from Hishop_BalanceDrawRequest   
						where isnull(IsCheck,0) in(0,1) and CONVERT( varchar(10), RequestTime, 120) =  CONVERT( varchar(10), @RecDate, 120)
						
				 
					--??????????????????(??????????????????)
					select @NewMemberNumber = COUNT(*)
						from aspnet_Members a
						left join aspnet_Distributors D on a.UserId= D.UserId
						where  CONVERT(varchar(10), CreateDate , 120 ) = @RecDate	
						--and D.UserId is null
						--and Status<>7  --7???????????????
					
					--?????????????????????
					select @NewAgentNumber = COUNT(*)
						from aspnet_Distributors
						where  CONVERT(varchar(10), CreateTime , 120 ) = @RecDate
						
					--??????????????? vshop_Statistics_Globals 
					insert into vshop_Statistics_Globals (
						RecDate, OrderNumber, SaleAmountFee, BuyerNumber, UserAvgPrice, 
						FXOrderNumber, FXSaleAmountFee, FXResultPercent, CommissionFee, NewMemberNumber, NewAgentNumber
						)
						values (
						@RecDate, @OrderNumber, @SaleAmountFee, @BuyerNumber, @UserAvgPrice, 
						@FXOrderNumber, @FXSaleAmountFee, @FXResultPercent, @CommissionFee, @NewMemberNumber, @NewAgentNumber
						)
			end  --100				
			
			select 	@OrderNumber =0,	@SaleAmountFee =0,	@BuyerNumber =0,@UserAvgPrice =0,
					@FXOrderNumber=0,	@FXSaleAmountFee=0, @FXResultPercent=0,@CommissionFee=0,
					
					@NewMemberNumber=0, @NewAgentNumber =0
							
			

			--????????????????????????????????????
			declare  @ProductList_Distribut   table
			(
				ProductId int,
				SaleQty int,
				SaleAmountFee money 
			) 		
 			insert into @ProductList_Distribut( ProductId  , SaleQty , SaleAmountFee  )
				select ProductId , count(*) ,  SUM( b.ItemListPrice * b.ShipmentQuantity )
					from vw_VShop_FinishOrder_Detail b
					where 
					(OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
					or
					( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')	
					group by b.ProductId	
					
				
	
			--200???300???999?????????????????????
			--??????????????????????????????????????????
			--????????????????????????
			declare  @ProductListGroupByUser_Distribut   table
			(
				ProductId int,
				BuyerNumber int
			)
 

			insert into @ProductListGroupByUser_Distribut( ProductId  , BuyerNumber )
				select T1.ProductId ,  count( *)
				from 
				(
				select ProductId ,  count( b.UserId) as UserID_Count
					from vw_VShop_FinishOrder_Detail b
					where
					(OrderStatus<>1 and CONVERT(varchar(10), PayDate , 120 ) = @RecDate	 and Gateway <> 'hishop.plugins.payment.podrequest')
					or
					( CONVERT(varchar(10), OrderDate , 120 ) = @RecDate	 and Gateway = 'hishop.plugins.payment.podrequest')	
					
					group by ProductId, UserId
				) T1
				group by T1.ProductId 
					
			
			/*****************************************************
			????????????_??????????????? vshop_Statistics_Distributors
			*****************************************************/	
			/*		
			AgentID	?????????ID
			OrderNumber	?????????
			SaleAmountFee	?????????
			BuyerNumber	???????????????
			BuyerAvgPrice	?????????
			CommissionAmount	????????????
			*/	
			if @FuncAction in ( 200,999,99 )
			begin			
			
					set @ErrorStep ='????????????_???????????????'
					
					if ( @FuncAction=99 or @FuncAction=999)  and @IsUpdateLog=1		
						Update vshop_Statistics_Log
							set  ErrorStep= @ErrorStep
							where  RecDate= @RecDate
												
					--2.????????????_??????????????? vshop_Statistics_Distributors
					if exists(Select top 1 * from vshop_Statistics_Distributors where RecDate= @RecDate )
						delete from  vshop_Statistics_Distributors where RecDate= @RecDate			
					
					--?????????????????????????????????
					declare  @OrderList_Distribut   table
					(
						OrderId nvarchar(50)
					)
					insert into @OrderList_Distribut( OrderId )
                            select a.OrderId
							from Hishop_Orders a
							  
								where 
								a.ReferralUserId>0 and 
								(
								(a.OrderStatus<>1 and CONVERT(varchar(10), a.PayDate , 120 ) = @RecDate	 and a.Gateway <> 'hishop.plugins.payment.podrequest')
								or(CONVERT(varchar(10),  a.OrderDate  , 120 ) =  @RecDate	and Gateway ='hishop.plugins.payment.podrequest')
								)
							group by a.OrderId
 
 
					--------------????????????????????????????????????????????? #BuffTable 
					if object_id('tempdb..#BuffTable') is not null Begin
						drop table #BuffTable
					End		
						
						
						--//???????????????????????????
					select @RecDate as RecDate , a.ReferralUserId  ,  b.OrderId,
						COUNT(b.OrderId) as OrderNumber_Item ,
						SUM( a.OrderTotal) as OrderTotal,
						sum(isnull(r.RefundMoney,0) ) 'RefundMoney', 
						SUM(a.OrderTotal) as  'ValidOrderTotal',
						a.Username,
						SUM( b.ItemsCommission) 'ItemsCommission' 
					 into #BuffTable
						from Hishop_OrderItems b
						inner join Hishop_Orders a on a.OrderId= b.OrderId 
						inner join   --???????????????????????????????????????
						(
							Select SUM(RefundMoney) as RefundMoney, OrderID as OrderID_Refund
							from Hishop_OrderReturns 
							where HandleStatus=2 					
							group by OrderId
						) r  on r.OrderID_Refund= a.OrderId
						where 
						a.OrderStatus<>4 and a.ReferralUserId>0 and 
						(
						(a.OrderStatus <> 1 and a.Gateway <> 'hishop.plugins.payment.podrequest'  and CONVERT(varchar(10), a.PayDate  , 120 ) = @RecDate	)
						 or(a.Gateway = 'hishop.plugins.payment.podrequest'  and CONVERT(varchar(10), a.OrderDate  , 120 ) = @RecDate	)
						)
						group by ReferralUserId  ,  b.OrderId , a.Username
					
					if @DEF_IsShowDebugInfo	=1
					begin
						select * from #BuffTable
					end

		  
					------------------- ????????????????????? #tb_DiffOrderNumber_ValidOrderTotal 
					--????????????????????????????????????????????????????????????
					if object_id('tempdb..#tb_DiffOrderNumber_ValidOrderTotal') is not null Begin
						drop table #tb_DiffOrderNumber_ValidOrderTotal
					End		
						
					select ReferralUserId, 
						COUNT(*) as DiffOrderNumber ,			--???????????????
						sum(  ValidOrderTotal ) as ValidOrderTotal  --?????????(???????????????)
						into #tb_DiffOrderNumber_ValidOrderTotal
						from  vw_VShop_FinishOrder_Main a
						where 
						(a.Gateway <>'hishop.plugins.payment.podrequest' and CONVERT(varchar(10), a.PayDate  , 120) = @RecDate)	
						or(CONVERT(varchar(10), a.OrderDate  , 120 ) = @RecDate and a.Gateway ='hishop.plugins.payment.podrequest')
						group by a.ReferralUserId  --, OrderId
						
					if @DEF_IsShowDebugInfo	=1
					begin		
						select '????????????????????????????????????????????????????????????'
						select * from #tb_DiffOrderNumber_ValidOrderTotal
					end
					
					
					------------------- ????????????????????? #tb_DiffUserNumber 	
					 --???????????????????????????????????????????????????????????????????????? ??????????????????
					if object_id('tempdb..#tb_DiffUserNumber') is not null Begin
						drop table #tb_DiffUserNumber
					End		
							 
					--select '???????????????: ????????????????????????????????????'
					select   ReferralUserId, COUNT(*) as DiffUserNumber 
					into #tb_DiffUserNumber
					from
					(
					select   a.ReferralUserId, a.UserId -- COUNT(*) as DiffUserNumber 
						from vw_VShop_FinishOrder_Main a
						where 
						(CONVERT(varchar(10), a.PayDate  , 120 ) =@RecDate and Gateway<>'hishop.plugins.payment.podrequest')
						or (Gateway='hishop.plugins.payment.podrequest' and CONVERT(varchar(10), a.OrderDate  , 120 ) = @RecDate)	
						group by a.ReferralUserId,UserId
					) T1
					group by ReferralUserId 
		 
		  
					if @DEF_IsShowDebugInfo	=1
					begin
						select '???????????????: ????????????????????????????????????'
						select * from #tb_DiffUserNumber
					end
					
					 
						 
					--?????????(?????????????????????)???		
					------------------- ????????????????????? #tb_DiffUserNumber 	
					--?????????????????????????????????????????????????????????
					if object_id('tempdb..#Commissions') is not null Begin
						drop table #Commissions
					End		
				 
						select UserID as  ParentUserID,  --ReferralUserId, 
							SUM( CommTotal) as YJAmount 
						into #Commissions
						from  Hishop_Commissions
						where OrderId in (Select OrderId from @OrderList_Distribut )
						group by UserId --, ReferralUserId
						
					if @DEF_IsShowDebugInfo	=1
					begin		
						select '#Commissions' '?????????'
						select * from #Commissions
					end
					
					/*	Hishop_Commissions ???
						????????????????????????????????????????????????  UserID????????????ID??????????????????????????? ??? Ref..ID????????????	
					*/


					--------------????????????
					if object_id('tempdb..#Distributors_01') is not null Begin
						drop table #Distributors_01
					End			
					
					select top 1 * into #Distributors_01
						from vshop_Statistics_Distributors
						where 1=2
				 
				 
					if @DEF_IsShowDebugInfo	=1
					begin 
						select '????????????'  --  ???????????????????????? #Distributors_01 ?????????
					end
					 
					insert into #Distributors_01 (
						RecDate, AgentID, OrderNumber, SaleAmountFee, BuyerNumber, BuyerAvgPrice, 
						CommissionAmountFee
						)
						select  @RecDate as RecDate,  a.ReferralUserId, a.DiffOrderNumber, a.ValidOrderTotal,
						   b.DiffUserNumber, 0 as BuyerAvgPrice ,  isnull(c.YJAmount,0)
						from #tb_DiffOrderNumber_ValidOrderTotal a
						left join #tb_DiffUserNumber b on a.ReferralUserId= b.ReferralUserId
						left join #Commissions c on a.ReferralUserId= c.ParentUserID
						union
						select  @RecDate as RecDate,  c.ParentUserID, 0, 0,  --?????????????????????????????????????????????????????????????????????
						   0, 0 as BuyerAvgPrice , c.YJAmount
						from #tb_DiffOrderNumber_ValidOrderTotal a
						right join #Commissions c on a.ReferralUserId= c.ParentUserID
						where a.ReferralUserId is   null


					--???????????????
					Update #Distributors_01
						set BuyerAvgPrice =
							case 
								when isnull(BuyerNumber,0) =0 then 0
								else SaleAmountFee * 1.0 / BuyerNumber
							end
						where 1=1
					 

					if @DEF_IsShowDebugInfo	=1
					begin
						select * from #Distributors_01 	where RecDate = @RecDate
						select * from @OrderList_Distribut
						select * from @ProductList_Distribut
						select * from @ProductListGroupByUser_Distribut
					end
			
					Insert into vshop_Statistics_Distributors (
						RecDate, AgentID, OrderNumber, SaleAmountFee, BuyerNumber, BuyerAvgPrice, CommissionAmountFee
						)
						select RecDate, AgentID, OrderNumber, SaleAmountFee, BuyerNumber, BuyerAvgPrice, CommissionAmountFee
						from #Distributors_01
			end  --200
					 
			
			
			/*****************************************************
			????????????_???????????? vshop_Statistics_Products
			*****************************************************/			
			if @FuncAction in ( 300 , 999,99)
			begin
					set @ErrorStep ='????????????_????????????'	
					if ( @FuncAction=99 or @FuncAction=999)  and @IsUpdateLog=1
						Update vshop_Statistics_Log
						set  ErrorStep= @ErrorStep
						where  RecDate= @RecDate
												
					--3.????????????_???????????? vshop_Statistics_Products
					--??????????????????????????????????????????????????? vshop_Statistics_ProductsVisits ??????
					if exists(Select top 1 * from vshop_Statistics_Products where RecDate= @RecDate )
					begin
						delete from  vshop_Statistics_Products where RecDate= @RecDate		
					end
					  
					  
					--???????????????????????????????????????????????????????????????(????????????????????????????????????????????????)
					insert into  vshop_Statistics_Products(  Recdate, ProductID,SaleQty, SaleAmountFee, BuyerNumber, TotalVisits , ConversionRate)
						select @Recdate, ProductId,SaleQty, SaleAmountFee, BuyerNumber, TotalVisits,
							case
								when isnull(TotalVisits,0) =0 or  ISNULL( BuyerNumber,0)=0 then 0
								else BuyerNumber * 1.0 / TotalVisits * 100
							end as ConversionRate
						from
						(
						select  a.ProductID, a.SaleQty, a.SaleAmountFee ,
								ISNULL(c.BuyerNumber,0) as BuyerNumber,
								isnull(b.TotalVisits,0) as TotalVisits
							from @ProductList_Distribut a
							left join vshop_Statistics_ProductsVisits b on a.ProductId=b.ProductID and b.RecDate= @RecDate
							left join @ProductListGroupByUser_Distribut c on a.ProductId= c.ProductId
						) T1
			end  --300
						
						 
				 
				 
			set @ErrorStep ='????????????.'		
							 
			if ( @FuncAction=99 or @FuncAction=999)  and @IsUpdateLog=1
				Update vshop_Statistics_Log
				set  EndTime= GETDATE(), IsSuccess=1, ErrorStep='', LogInfo='ok'
				where  RecDate= @RecDate
				
			select @RetCode =  1, @RetInfo ='???????????????'
			
			print 'OK'
	end try
	BEGIN CATCH 
 
			DECLARE @ErrorMessage NVARCHAR(4000); 
			DECLARE @ErrorSeverity INT; 
			DECLARE @ErrorState INT; 

			SELECT 
			@ErrorMessage = ERROR_MESSAGE(), 
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE(); 

		
			select @ErrorState '@ErrorState', @ErrorMessage '@ErrorMessage'
			
			if ( @FuncAction=99 or @FuncAction=999)	  and @IsUpdateLog=1					
				Update vshop_Statistics_Log
					set  EndTime= GETDATE(), IsSuccess= -1, ErrorStep= @ErrorStep, LogInfo= @ErrorMessage
					where  RecDate= @RecDate
	 
			
			select @RetCode =  -1, @RetInfo ='???????????????'

	END CATCH; 
	
	
	/*
	
	
	*/

	
end
GO
create proc [dbo].[sp_vshop_Statistics_Notify]
@CalDate datetime=null,

@FuncAction int =999,
@ActionDesc varchar(255)='',

@RetCode int output,  --???????????? 1 ?????????????????????
@RetInfo varchar(256) output
as
begin

/*
@FuncAction??????:
  OrderUpdate = 100,
  CommissionsDraw=101,
  MemberUpdate = 200,
  ProductUpdate = 300,
  AllUpdate = 999
  
  
?????????????????????????????????????????????
????????????_??????????????????
????????????_???????????????
????????????_????????????

????????????????????????????????????

exec sp_vshop_Statistics_Daily '2015-6-18', 100,1,
	 0, '??????'

sp_refreshview vw_VShop_FinishOrder_Detail

???????????????2015-10-09

*/

	declare @DEF_IsShowDebugInfo int  --??????????????????????????? 1=???  ??????=???
	set @DEF_IsShowDebugInfo = -1

	select @RetCode = -1, @RetInfo ='???????????????', @FuncAction=isnull(@FuncAction,999)

	if @CalDate is null
		set @CalDate= GETDATE()
		
		
	--declare @dDate date
	--set @dDate = GETDATE()
	
	--set @dDate = '2015-08-27 10:18:26.703'
	
	select @CalDate = CONVERT(varchar(10), @CalDate, 120 )
	
	--select @RecDate  '@RecDate'
	
	 
	 

		
		
	if CONVERT(varchar(10), @CalDate, 120) <> CONVERT(varchar(10),  GETDATE() , 120) 
	begin  --2015-10-09
	
		insert into vshop_Statistics_NotifyLog (
			RecDate, TaskTime, FuncAction, ActionDesc
			)
		values (
			CONVERT(varchar(10), @CalDate, 120), GETDATE(), @FuncAction,@ActionDesc
			)
			
			
		exec [sp_vshop_Statistics_Daily]  @CalDate , @FuncAction, 
			1, 
			0, '??????'
		select @RetCode =  1, @RetInfo ='???????????????'	
	end
	else
	begin
		select @RetCode =  1, @RetInfo ='????????????????????????????????????'		
	end
end
GO
CREATE  PROCEDURE [dbo].[ss_CreateOrder]
(
	-- ????????????
    @OrderId nvarchar(50),
    @OrderMarking nvarchar(50),
	@OrderDate	datetime,	
	@UserId	int,
    @UserName nvarchar(50),
    @Wangwang nvarchar(20),
    @RealName nvarchar(50),
    @EmailAddress	nvarchar(255) = null,
    @Remark Nvarchar(4000) =null,
	@ClientShortType int=0,
	@AdjustedDiscount money,
	@OrderStatus int,
	-- ????????????
	@ShippingRegion Nvarchar(300) = null,
	@Address Nvarchar(300) = null,
	@ZipCode Nvarchar(20) = null,
	@ShipTo Nvarchar(50) = null,
	@TelPhone Nvarchar(50) = null,
	@CellPhone Nvarchar(50) = null,
	@ShipToDate Nvarchar(50) = null,
	@ShippingModeId int = null,
	@ModeName Nvarchar(50) = null,
	@RegionId int = null,
	@Freight money = null,
	@AdjustedFreight money = null,
	@ShipOrderNumber Nvarchar(50) = null,	
    @Weight int = null,
	@ExpressCompanyName nvarchar(500),
    @ExpressCompanyAbb nvarchar(500),
    -- ????????????
    @PaymentTypeId INT = null,
    @PaymentType Nvarchar(100) = null,	
    @PayCharge money = null,
    @RefundStatus int,
	@Gateway nvarchar(200)=null,
    -- ????????????
    @OrderTotal money = null,
    @OrderPoint int = null,
    @OrderCostPrice money = null,
    @OrderProfit money = null,
    @OptionPrice money = null,
    @Amount money = null,    
    @DiscountAmount money=null,
	-- ????????????
	@ReducedPromotionId int = null,
	@ReducedPromotionName nvarchar(100) = null,
	@ReducedPromotionAmount money = null,
	@IsReduced bit = null,

	@SentTimesPointPromotionId int = null,
	@SentTimesPointPromotionName nvarchar(100) = null,
	@TimesPoint money = null,
	@IsSendTimesPoint bit = null,

	@FreightFreePromotionId int = null,
	@FreightFreePromotionName nvarchar(100) = null,
	@IsFreightFree bit = null,
    -- ???????????????
    @CouponName nvarchar(100) = null,
	@CouponCode nvarchar(50) = null,
	@CouponAmount money = null,    
	@CouponValue money = null,
    -- ????????????
    @RedPagerActivityName nvarchar(100) = null,
	@RedPagerID int = null,
	@RedPagerOrderAmountCanUse money = null,    
	@RedPagerAmount money = null,
	--??????????????????
	@GroupBuyId int = null,
	@NeedPrice money = null,
	@GroupBuyStatus int = null,
		--??????????????????
	@CountDownBuyId int = null,

	--????????????
	@Bundlingid int=null,
	--????????????
    @BundlingPrice money = null,
	--????????????
	@Tax money=null,
	@InvoiceTitle nvarchar(50),
	@ReferralUserId int,
	@ReferralPath varchar(50),
	@ActivitiesId nvarchar(50)=null,
	@ActivitiesName nvarchar(200)=null,
	@FirstCommission money =null,
	@SecondCommission money=null,
	@ThirdCommission money=null,
	@PointToCash money=null,
	@PointExchange int,
	@BargainDetialId int
	
)
as 
  IF EXISTS (SELECT OrderId  FROM Hishop_Orders WHERE OrderId = @OrderId)
    Return
  ELSE
  BEGIN
  INSERT INTO Hishop_Orders
   (OrderId, OrderDate, UserId, Username,RealName, EmailAddress, Remark,ClientShortType, AdjustedDiscount, OrderStatus,
   ShippingRegion, Address, ZipCode, ShipTo, TelPhone, CellPhone, ShipToDate, ShippingModeId, ModeName, RegionId, Freight, AdjustedFreight, ShipOrderNumber, [Weight], 
   PaymentTypeId,PaymentType, PayCharge, RefundStatus, OrderTotal, OrderPoint, OrderCostPrice, OrderProfit, OptionPrice, Amount, 
   ReducedPromotionId,ReducedPromotionName,ReducedPromotionAmount,IsReduced,SentTimesPointPromotionId,SentTimesPointPromotionName,TimesPoint,IsSendTimesPoint,
   FreightFreePromotionId,FreightFreePromotionName,IsFreightFree,CouponName, CouponCode, CouponAmount, CouponValue,RedPagerActivityName,RedPagerID,RedPagerOrderAmountCanUse,RedPagerAmount,GroupBuyId,NeedPrice,GroupBuyStatus,CountDownBuyId,BundlingId,
   DiscountAmount,ExpressCompanyName,ExpressCompanyAbb,BundlingPrice,Tax,InvoiceTitle,Gateway,ReferralUserId,ReferralPath,ActivitiesId,ActivitiesName,FirstCommission,SecondCommission,ThirdCommission,OrderMarking,PointToCash,PointExchange,BargainDetialId
  )
  VALUES 
  (@OrderId, @OrderDate, @UserId, @Username,@RealName, @EmailAddress, @Remark,@ClientShortType, @AdjustedDiscount, @OrderStatus,
   @ShippingRegion, @Address, @ZipCode, @ShipTo, @TelPhone, @CellPhone, @ShipToDate, @ShippingModeId, @ModeName, @RegionId, @Freight, @AdjustedFreight, @ShipOrderNumber, @Weight, 
   @PaymentTypeId,@PaymentType, @PayCharge, @RefundStatus, @OrderTotal, @OrderPoint, @OrderCostPrice, @OrderProfit, @OptionPrice, @Amount, 
   @ReducedPromotionId,@ReducedPromotionName,@ReducedPromotionAmount,@IsReduced,@SentTimesPointPromotionId,@SentTimesPointPromotionName,@TimesPoint,@IsSendTimesPoint,
   @FreightFreePromotionId,@FreightFreePromotionName,@IsFreightFree,@CouponName, @CouponCode, @CouponAmount, @CouponValue,@RedPagerActivityName,@RedPagerID,@RedPagerOrderAmountCanUse,@RedPagerAmount,@GroupBuyId,@NeedPrice,@GroupBuyStatus,@CountDownBuyId,@Bundlingid,
   @DiscountAmount,@ExpressCompanyName,@ExpressCompanyAbb,@BundlingPrice,@Tax,@InvoiceTitle,@Gateway,@ReferralUserId,@ReferralPath,@ActivitiesId,@ActivitiesName,@FirstCommission,@SecondCommission,@ThirdCommission,@OrderMarking,@PointToCash,@PointExchange,@BargainDetialId
   );
   END
GO
CREATE PROCEDURE [dbo].[ss_ShoppingCart_AddLineItem]
	(
		@UserId INT,
		@SkuId NVARCHAR(100),
		@Quantity INT,
		@CategoryId INT,
		@Type INT,
		@ExchangeId INT,
        @Templateid INT,
		@LimitedTimeDiscountId INT
	)
AS
	IF EXISTS (SELECT [SkuId] FROM Hishop_ShoppingCarts WHERE UserId = @UserId AND SkuId = @SkuId  And [Type]=@Type And [LimitedTimeDiscountId]=@LimitedTimeDiscountId)
	BEGIN
		UPDATE 
				Hishop_ShoppingCarts 
		SET 
				Quantity = Quantity + @Quantity
		WHERE 
				UserId = @UserId AND SkuId = @SkuId And [Type]=@Type And [LimitedTimeDiscountId]=@LimitedTimeDiscountId
	END
	ELSE
	BEGIN
		INSERT INTO Hishop_ShoppingCarts 
			(UserId, SkuId, Quantity,CategoryId,[Type],ExchangeId,Templateid,LimitedTimeDiscountId) 
		VALUES 
			(@UserId, @SkuId, @Quantity,@CategoryId,@Type,@ExchangeId,@Templateid,@LimitedTimeDiscountId)
	END
GO
CREATE PROCEDURE [dbo].[ss_ShoppingCart_GetItemInfo]
(
		@Quantity INT,
		@UserId INT,
		@SkuId NVARCHAR(100),
		@GradeId INT,
		@Type INT
	)
AS

DECLARE @ProductId INT, @Weight INT, @Stock INT, @SalePrice MONEY, @MemberPrice MONEY, @Discount INT, @SKU NVARCHAR(50),@ExChangeId INT 
 
 SELECT @ProductId = ProductId, @SKU = SKU, @Weight = [Weight], @Stock = Stock, @SalePrice = SalePrice FROM Hishop_SKUs WHERE SkuId = @SkuId
-- ????????????
IF @UserId>0 
BEGIN
	SELECT @MemberPrice = MemberSalePrice FROM Hishop_SKUMemberPrice WHERE SkuId = @SkuId AND GradeId = @GradeId
	SELECT @Discount = Discount FROM aspnet_MemberGrades WHERE GradeId = @GradeId		
	SELECT @Quantity=Quantity,@ExChangeId=ExChangeId FROM Hishop_ShoppingCarts WHERE UserId = @UserId AND SkuId = @SkuId And [Type]=@Type
 	IF @MemberPrice IS NOT NULL
		SET @SalePrice = @MemberPrice
	ELSE
		SET @SalePrice = (@SalePrice * @Discount)/100
 END
	
 -- ????????????????????????
SELECT ProductId, SaleStatus, @SKU as SKU, @Stock as Stock, @Quantity as TotalQuantity, ProductName, CategoryId, @Weight AS [Weight], @SalePrice AS SalePrice, 
	ThumbnailUrl40,ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160, ThumbnailUrl180, ThumbnailUrl220,IsfreeShipping,MainCategoryPath,IsSetCommission,ThirdCommission,SecondCommission,FirstCommission,FreightTemplateId,CubicMeter,FreightWeight FROM Hishop_Products WHERE ProductId = @ProductId AND SaleStatus=1
-- ????????????????????????
SELECT s.SkuId, s.SKU, s.ProductId, s.Stock, AttributeName, ValueStr FROM Hishop_SKUs s left join Hishop_SKUItems si on s.SkuId = si.SkuId
left join Hishop_Attributes a on si.AttributeId = a.AttributeId left join Hishop_AttributeValues av on si.ValueId = av.ValueId WHERE s.SkuId = @SkuId
AND s.ProductId IN (SELECT ProductId FROM Hishop_Products WHERE SaleStatus=1)
--????????????????????????
select ProductNumber,PointNumber,ChangedNumber,eachMaxNumber,[status],exChangeId from Hishop_PointExChange_Products where exChangeId=@ExChangeId and ProductId=@ProductId
GO
-- =============================================
-- Author:		?????????
-- Create date: 2015-10-29
-- Description:	????????????????????????????????????????????????????????????sp_vshop_Statistics_Daily????????????
-- =============================================
CREATE TRIGGER [dbo].[UpdateStatic_Daily]
	ON [dbo].[Hishop_Orders] 
	FOR UPDATE
	AS
	BEGIN
--Inserted??????????????????????????????Deleted???????????????????????????
    declare @c bigint
    declare  @v varchar(256) 
    
    declare @NewOrderStatus int
    declare @OldOrderStatus int
    declare @NewOrderTotal money
    declare @OldOrderTotal money
    declare @OrderDate datetime --????????????
    declare @PayDate datetime --????????????
    declare @Gateway nvarchar(200) --???????????? hishop.plugins.payment.podrequest ????????????
    declare @UpDate varchar(10)
    declare @IsUpdate bigint --????????????
    
    --?????????????????????????????????????????????
	if update(OrderTotal) OR update(OrderStatus)
	begin
	select @OrderDate=OrderDate,@PayDate=PayDate,@Gateway=Gateway,@NewOrderTotal= OrderTotal,@NewOrderStatus= OrderStatus from inserted
	select @OldOrderTotal= OrderTotal,@OldOrderStatus= OrderStatus from Deleted
	declare @RetCode int
    declare  @RetInfo varchar(255) 
    --CONVERT(varchar(10),@PayDate , 120 )
    
      if(@Gateway<>'hishop.plugins.payment.podrequest')
        set @UpDate=CONVERT(varchar(10),@PayDate , 120) --?????????????????????????????????????????????
      else
        set @UpDate=CONVERT(varchar(10),@OrderDate , 120) --??????????????????????????????????????????
    
        set @UpDate=ISNULL(@UpDate,'')
        set  @RetCode=0
        set  @RetInfo='step1'
        set  @IsUpdate=0
        
    
        --????????????????????????????????????????????? ,??????????????????
        if(@UpDate<>'' and @UpDate<>CONVERT(varchar(10),GETDATE() , 120))
        begin
             set  @RetInfo='step2??????????????????'
             
             --????????????????????????????????????????????????????????????
             if(@NewOrderTotal<>@OldOrderTotal)
               set @IsUpdate=1
             
             --??????????????????????????????
             if(@NewOrderStatus<>@OldOrderStatus)
             begin
               if @NewOrderTotal in (4,9, 10)
                  set @IsUpdate=1 --???????????????????????????????????????????????????????????????
             end 
               
             if(@IsUpdate=1)
             begin
                exec sp_vshop_Statistics_Daily @UpDate, 999, 0, @RetCode output,@RetInfo  output 
               -- print @RetInfo
             	--set  @v =cast(@RetCode as varchar(10)) + '--' +cast(@NewOrderStatus as varchar(10)) + '^' + cast(@NewOrderTotal as varchar(10))+ '|'+ cast(@OldOrderStatus as varchar(10)) + '^' + cast(@OldOrderTotal as varchar(10))
	           -- insert into test(datet,v)values(GETDATE(), @v)
             end
                     
        end


	end
	
END
GO
CREATE PROCEDURE cp_GamePrize
	@GameId int,
	@PrizeId int,
	@UserId int,
	@Result int output
AS
BEGIN
	Set @Result=0;
	Declare @IsUseD bit;
	Set @IsUseD=1;
	--????????????????????????????????????????????????
	Declare @NeedPoint int;
	Declare @GivePoint int;
	Declare @IsAllGivePoint bit;
	Declare @GameUrl varchar(100);
	Select @NeedPoint=-1*NeedPoint,@GivePoint=GivePoint,@IsAllGivePoint=OnlyGiveNotPrizeMember,@GameUrl=GameUrl from Hishop_PromotionGame Where GameId=@GameId; 
	
	if @PrizeId>0 --??????????????????
	Begin
		Declare @PrizeType int;
		Declare @PrizeGivePoint int;
		Declare @CouponsId varchar(100);
		Select @PrizeType=PrizeType,@PrizeGivePoint=GivePoint,@CouponsId=GiveCouponId From Hishop_PromotionGamePrizes where PrizeId=@PrizeId;
		if @PrizeType=0--????????????
		Begin
			Declare @Point int;
			Set @Point=0;
			if @IsAllGivePoint=0
			Begin
				set @Point=@GivePoint+@NeedPoint;
				exec cp_AddIntegralDetail 1,'????????????',@GivePoint,'',@UserId,@GameUrl,3;
			End
			else
			Begin
				set @Point=@NeedPoint;
			End
			set @Point=@Point+@PrizeGivePoint;
			Update aspnet_Members set Points=Points+@Point where  UserId=@UserId;
			exec cp_AddIntegralDetail 1,'????????????',@PrizeGivePoint,'',@UserId,@GameUrl,3;
		End
		if @PrizeType=1 --???????????????
		Begin
			Declare @Point1 int;
			SET @Point1=0;
			if @IsAllGivePoint=0
			Begin
				set @Point1=@GivePoint+@NeedPoint;
				exec cp_AddIntegralDetail 1,'????????????',@GivePoint,'',@UserId,@GameUrl,3;
			End
			else
			Begin
				set @Point1=@NeedPoint;
			End
			if @Point1 <>0 --??????????????????????????????????????????
			Begin
				Update aspnet_Members set Points=Points+@Point1 where  UserId=@UserId;
			End
			--???????????????????????????
			--????????????????????????
			Declare @ResultTemp int;
			Exec cp_SendCouponToMember @CouponsId,@UserId,@ResultTemp output;
		End
		if @PrizeType=2 or @PrizeType=3  --????????????
		Begin
			Set @IsUseD=0;
			Declare @Point2 int;
			SET @Point2=0;
			if @IsAllGivePoint=0
			Begin
				set @Point2=@GivePoint+@NeedPoint;
				exec cp_AddIntegralDetail 1,'????????????',@GivePoint,'',@UserId,@GameUrl,3;
			End
			else
			Begin
				set @Point2=@NeedPoint;
			End
			if @Point2 <>0 --??????????????????????????????????????????
			Begin
				Update aspnet_Members set Points=Points+@Point2 where  UserId=@UserId;
			End
		End
		--????????????,?????????????????????1
		--Update Hishop_PromotionGamePrizes set PrizeCount=PrizeCount-1 where PrizeId=@PrizeId;
	End
	else
	Begin--?????????????????????
		--??????????????????????????????
		Declare @Point0 int;
		set @Point0=@GivePoint+@NeedPoint;
		if @GivePoint>0
		Begin
			exec cp_AddIntegralDetail 1,'????????????',@GivePoint,'',@UserId,@GameUrl,3;
		End
		if @Point0 <>0
		Begin
			Update aspnet_Members set Points=Points+@Point0 where  UserId=@UserId;
		End
	End
	exec cp_AddIntegralDetail 2,'????????????',@NeedPoint,'',@UserId,@GameUrl,6;
	--????????????(?????????????????????????????????)
	INSERT INTO [Hishop_PromotionGameResultMembersLog]
           ([GameId]
           ,[PrizeId]
           ,[UserId]
           ,[PlayTime]
           ,[IsUsed])
		VALUES(@GameId,@PrizeId,@UserId,GETDATE(),@IsUseD);
	Set @Result=1;	
END
GO
create proc [dbo].[sp_vshop_Statistics_Auto]
@RecDate datetime=null,
@RetCode int output,  --???????????? 1 ?????????????????????
@RetInfo varchar(256) output
as
begin

/*
?????????????????????????????????????????????
????????????_??????????????????
????????????_???????????????
????????????_????????????

????????????????????????????????????

exec [sp_vshop_Statistics_Auto] '2015-10-08', 0, '??????'

???????????????2015-10-09  
??????????????????????????????

*/

	declare @DEF_IsShowDebugInfo int
	set @DEF_IsShowDebugInfo =-1

	select @RetCode = -1, @RetInfo ='???????????????'

	if @RecDate is null
		set @RecDate= GETDATE()
		 
	
	--select @RecDate = CONVERT(varchar(10), @RecDate, 120 )	
	--select @RecDate  '@RecDate'
	
	 
--select 999
	
--insert into dbo.vshop_Statistics_Log(RecDate,FirstCountTime) 
--	values ('2015-01-01'	, getdate() )
		
--	waitfor delay '00:00:25'  
	

--insert into dbo.vshop_Statistics_Log(RecDate,FirstCountTime) 
--	values ('2015-01-02'	, getdate() )
--return

	begin try
			
			declare @i int
			set @i=30
			while @i>=0   --?????????30????????????
			begin
				declare @CountDate datetime
				set @CountDate = CONVERT(varchar(10), @RecDate - @i , 120 )
				
				if 	 @CountDate>= CONVERT(varchar(10),  GETDATE()  , 120 )  --?????????????????????
					break   -- 2015-10-09
									
				if not exists (  
						select top 1 * from vshop_Statistics_Log  
							where IsSuccess= 1	
							and  RecDate= @CountDate
							)
				begin
					print @CountDate
					exec [sp_vshop_Statistics_Daily]  @CountDate , 999,  1, --??????????????????
						0, '??????'
				end
				 
				set @i=@i-1
			end
					


			select @RetCode =  1, @RetInfo ='???????????????'
	 
	end try
	BEGIN CATCH 
 
			DECLARE @ErrorMessage NVARCHAR(4000); 
			DECLARE @ErrorSeverity INT; 
			DECLARE @ErrorState INT; 

			SELECT 
			@ErrorMessage = ERROR_MESSAGE(), 
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE(); 

			--RAISERROR (@ErrorMessage, -- Message text. 
			--@ErrorSeverity, -- Severity. 
			--@ErrorState -- State. 
			--); 
			select @ErrorState '@ErrorState'
		 
	 
			
			select @RetCode =  -1, @RetInfo ='???????????????'
	END CATCH; 
end
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'GradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'CommissionsLimit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'FirstCommissionRise';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'SecondCommissionRise';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'ThirdCommissionRise';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'Ico';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????????????????????????????????????????????????????IsAddCommission?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_DistributorGrade', @level2type = N'COLUMN', @level2name = N'AddCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID????????????ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'StoreName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????LOGO', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'Logo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'BackImage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'RequestAccount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'AccountTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????1???2???3???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'GradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'OrdersTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralOrders';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralBlance';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralRequestBalance';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'CreateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????(0???????????????1????????????,9??????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'ReferralStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'StoreDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Distributors', @level2type = N'COLUMN', @level2name = N'DistributorGradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'RoleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'Password';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Email', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'Email';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Managers', @level2type = N'COLUMN', @level2name = N'CreateDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'GradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'Points';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'Discount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'TranVol';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_MemberGrades', @level2type = N'COLUMN', @level2name = N'TranTimes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'GradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'ReferralUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'CreateDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'OrderNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Expenditure';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Points';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'TopRegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'RealName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Email', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Email';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'QQ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'QQ';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Address';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'VipCardNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'VipCardDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????Openid', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'OpenId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'SessionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'SessionEndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Password';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'MicroSignal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'UserHead';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'UserBindName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????(??????:1 ?????????:7)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'CardID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'LastOrderDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'PayOrderDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'FinishOrderDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'IsAuthorizeWeiXin';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'TotalAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Members', @level2type = N'COLUMN', @level2name = N'AvailableAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_RolePermissions';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_RolePermissions', @level2type = N'COLUMN', @level2name = N'PermissionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????(?????????)ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_RolePermissions', @level2type = N'COLUMN', @level2name = N'RoleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Roles';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Roles', @level2type = N'COLUMN', @level2name = N'RoleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Roles', @level2type = N'COLUMN', @level2name = N'RoleName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Roles', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'aspnet_Roles', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'ActivitiesId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'ActivitiesName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'ActivitiesType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'StartTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'ActivitiesDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'TakeEffect';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'attendTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'attendType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'isAllProduct';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'MeetMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'ReductionMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities', @level2type = N'COLUMN', @level2name = N'MeetType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'ActivitiesId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'MeetMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'ReductionMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'bFreeShipping';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????? ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'Integral';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'CouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Detail', @level2type = N'COLUMN', @level2name = N'MeetNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Product';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Product', @level2type = N'COLUMN', @level2name = N'ActivitiesId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Product', @level2type = N'COLUMN', @level2name = N'ProductID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Activities_Product', @level2type = N'COLUMN', @level2name = N'status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ActivitiesMember';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ActivitiesMember', @level2type = N'COLUMN', @level2name = N'ActivitiesId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ActivitiesMember', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'AttributeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'AttributeName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'TypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'UsageMode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Attributes', @level2type = N'COLUMN', @level2name = N'UseAttributeImage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues', @level2type = N'COLUMN', @level2name = N'ValueId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues', @level2type = N'COLUMN', @level2name = N'AttributeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues', @level2type = N'COLUMN', @level2name = N'ValueStr';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_AttributeValues', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'SerialID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0?????? 1?????????2???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'RequestType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'RequestTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'Amount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'AccountName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'MerchantCode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'RedpackRecordNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????? 0????????? 1????????? 2???????????? -1?????? 3????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'IsCheck';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'CheckTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BalanceDrawRequest', @level2type = N'COLUMN', @level2name = N'bankName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'BannerId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'ShortDesc';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'LocationType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????2????????????????????????1??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Banner', @level2type = N'COLUMN', @level2name = N'IsDisable';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'ActivityCover';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'BeginDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'Remarks';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'CreateDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'ActivityStock';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'PurchaseNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0:????????????  1 :????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'BargainType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'InitialPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: ????????? 1 ?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'IsCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'FloorPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'TranNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1 ?????? 0 ?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Bargain', @level2type = N'COLUMN', @level2name = N'IsDelete';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hishop_Bargain?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'BargainId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'Number';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'Price';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'NumberOfParticipants';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1 ?????? 0 ?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BargainDetial', @level2type = N'COLUMN', @level2name = N'IsDelete';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'BrandId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'BrandName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Logo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'Logo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'CompanyUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'RewriteName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'MetaKeywords';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'MetaDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_BrandCategories', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'CategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'IconUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Meta_Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Meta_Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Meta_Keywords';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'ParentCategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Depth';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Path';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'RewriteName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'SKUPrefix';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'AssociatedProductType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Notes1';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'Theme';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'HasChildren';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'FirstCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'SecondCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Categories', @level2type = N'COLUMN', @level2name = N'ThirdCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'CommId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'ReferralUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'TradeTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'OrderTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'CommTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????(1???????????????2????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'CommType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'State';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Commissions', @level2type = N'COLUMN', @level2name = N'CommRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'CouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'CouponName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'CouponValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'ConditionValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'BeginDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'StockNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'ReceiveNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'UsedNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'ImgUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????????????????0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'ProductNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'Finished';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'IsAllProduct';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'maxReceivNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Coupons', @level2type = N'COLUMN', @level2name = N'CouponTypes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'CouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'MemberId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'ReceiveDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'UsedDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'OrderNo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'CouponName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'ConditionValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'BeginDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_MemberCoupons', @level2type = N'COLUMN', @level2name = N'CouponValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Products';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Products', @level2type = N'COLUMN', @level2name = N'CouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Products', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Coupon_Products', @level2type = N'COLUMN', @level2name = N'status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'UserID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'Commission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'PubTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'OperAdmin';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'Memo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'OrderID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorGradeCommission', @level2type = N'COLUMN', @level2name = N'OldCommissionTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorProducts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorProducts', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_DistributorProducts', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite', @level2type = N'COLUMN', @level2name = N'FavoriteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite', @level2type = N'COLUMN', @level2name = N'Tags';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Favorite', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping', @level2type = N'COLUMN', @level2name = N'TemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????1?????????2EMS???3?????????4??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping', @level2type = N'COLUMN', @level2name = N'ModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????1?????????2?????????3??????+??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping', @level2type = N'COLUMN', @level2name = N'ConditionType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????ConditionType???3??????????????????|?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping', @level2type = N'COLUMN', @level2name = N'ConditionNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShipping', @level2type = N'COLUMN', @level2name = N'FreeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShippingRegions';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShippingRegions', @level2type = N'COLUMN', @level2name = N'TemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShippingRegions', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_FreeShippingRegions', @level2type = N'COLUMN', @level2name = N'FreeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'GroupId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'TemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????1?????????2EMS???3?????????4??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'ModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'FristNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'FristPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'AddNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'AddPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????1??????0???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegionGroups', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegions';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegions', @level2type = N'COLUMN', @level2name = N'TemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegions', @level2type = N'COLUMN', @level2name = N'GroupId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_SpecifyRegions', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates', @level2type = N'COLUMN', @level2name = N'TemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1?????????0?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates', @level2type = N'COLUMN', @level2name = N'FreeShip';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1?????????2????????????3?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates', @level2type = N'COLUMN', @level2name = N'MUnit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????1??????0???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_FreightTemplate_Templates', @level2type = N'COLUMN', @level2name = N'HasFree';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hishop_BargainDetial?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_HelpBargainDetial', @level2type = N'COLUMN', @level2name = N'BargainDetialId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_HelpBargainDetial', @level2type = N'COLUMN', @level2name = N'BargainPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_HelpBargainDetial', @level2type = N'COLUMN', @level2name = N'CreateDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'ActivityName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'BeginTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'LimitNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'ApplyMembers';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'DefualtGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'CustomGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'CreateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscount', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'LimitedTimeDiscountId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'Discount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'Minus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'IsDehorned';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'IsChamferPoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'FinalPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'CreateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'BeginTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_LimitedTimeDiscountProduct', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'LogId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'PageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'AddedTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ip??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'IPAddress';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'Privilege';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Logs', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'PayId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'TradeAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'AvailableAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N' ???????????? 0?????? 1?????? 2???????????? 3???????????? 4????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'TradeType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????? 0???????????? 1????????? 2???????????? 3?????? 4????????? 5????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'TradeWays';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'TradeTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????? 0 ??????????????? 1???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountDetailed', @level2type = N'COLUMN', @level2name = N'State';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'RequestTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'Amount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????? ???????????? = 0,????????? = 1,????????????=2,????????????=3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'RequestType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'AccountCode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'AccountName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'BankName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????? None=-2 ?????????=0 ?????????=1 ?????????=2 ??????=-1 ????????????=3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'State';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'CheckTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberAmountRequest', @level2type = N'COLUMN', @level2name = N'Operator';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1???????????????2???????????????3???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'ClientTypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'StartTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'LastDay';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'ClientChar';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MemberClientSet', @level2type = N'COLUMN', @level2name = N'ClientValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0 or ???????????????????????????1 ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageAdminUserMsgList', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'MessageType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'SendEmail';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'SendSMS';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'SendInnerMessage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'SendWeixin';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'WeixinTemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'TagDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'EmailSubject';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'EmailBody';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'InnerMessageSubject';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'InnerMessageBody';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_MessageTemplates', @level2type = N'COLUMN', @level2name = N'SMSBody';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'Memo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'Author';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'AddTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0????????????1?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'IsPub';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'PubTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0?????????1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'SendType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0??????,1????????????2????????????,???????????????????????????Hishop_NoticeUser???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Notice', @level2type = N'COLUMN', @level2name = N'SendTo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeRead', @level2type = N'COLUMN', @level2name = N'NoticeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????UserID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeRead', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeRead', @level2type = N'COLUMN', @level2name = N'ReadTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????1?????????0??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeRead', @level2type = N'COLUMN', @level2name = N'NoticeIsDel';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeTempUser', @level2type = N'COLUMN', @level2name = N'LoginName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeTempUser', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeUser', @level2type = N'COLUMN', @level2name = N'NoticeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_NoticeUser', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderDebitNote';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderDebitNote', @level2type = N'COLUMN', @level2name = N'NoteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderDebitNote', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderDebitNote', @level2type = N'COLUMN', @level2name = N'Operator';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderDebitNote', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'SKU';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'Quantity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ShipmentQuantity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'CostPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemListPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemAdjustedPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemAdjustedCommssion';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ThumbnailsUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'Weight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'SKUContent';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'PromotionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'PromotionName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'OrderItemsStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemsCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'SecondItemsCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ThirdItemsCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'PointNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0??????????????????1?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'IsHandled';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ReturnMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'DiscountAverage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????1???????????????????????????0?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'IsAdminModify';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'DeleteBeforeState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID???0???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'LimitedTimeDiscountId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'1???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ItemsCommissionScale';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'2???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'SecondItemsCommissionScale';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'3???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'ThirdItemsCommissionScale';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderItems', @level2type = N'COLUMN', @level2name = N'BalancePayMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'RefundId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'ApplyForTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'RefundType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'RefundRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'AdminRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????,0????????????,1????????????,2????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'HandleStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'HandleTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderRefund', @level2type = N'COLUMN', @level2name = N'Operator';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'ReplaceId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'ApplyForTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'Comments';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????,0????????????,1????????????,2????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'HandleStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'HandleTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReplace', @level2type = N'COLUMN', @level2name = N'AdminRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'ReturnsId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'ApplyForTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'RefundType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'RefundMoney';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'Comments';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????,0????????????,1????????????,2????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'HandleStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'HandleTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'AdminRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'Operator';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'Account';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'AuditTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'RefundTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'DeleteBeforeState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderReturns', @level2type = N'COLUMN', @level2name = N'OrderItemID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderMarking';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ManagerMark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ManagerRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'AdjustedDiscount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CloseReason';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PayDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShippingDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'FinishDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Username';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'EmailAddress';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RealName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'QQ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'QQ';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Wangwang';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'MSN', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'MSN';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShippingRegion';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Address';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ZipCode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShipTo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'TelPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShipToDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShippingModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ModeName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RealShippingModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RealModeName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Freight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'AdjustedFreight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ShipOrderNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Weight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ExpressCompanyName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ExpressCompanyAbb';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PaymentTypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PaymentType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PayCharge';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RefundStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RefundAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RefundRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Gateway';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderPoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderCostPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????? - ??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OrderProfit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ActualFreight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OtherCost';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OptionPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Amount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'DiscountAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ActivitiesId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ActivitiesName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ReducedPromotionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ReducedPromotionName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ReducedPromotionAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'IsReduced';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'SentTimesPointPromotionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'SentTimesPointPromotionName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'TimesPoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'IsSendTimesPoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'FreightFreePromotionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'FreightFreePromotionName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'IsFreightFree';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CouponName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CouponCode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CouponAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CouponValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'GroupBuyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'NeedPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'GroupBuyStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'CountDownBuyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BundlingId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BundlingNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BundlingPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'GatewayOrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'IsPrinted';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Tax';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'InvoiceTitle';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'Sender';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ReferralUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'FirstCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'SecondCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ThirdCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RedPagerActivityName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RedPagerID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RedPagerOrderAmountCanUse';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'RedPagerAmount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'OldAddress';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PointToCash';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'PointExchange';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????0????????????1?????????????????????2??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'SplitState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'DeleteBeforeState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????2??????1,?????????????????????????????????0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ClientShortType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????ID???????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'ReferralPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BargainDetialId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BalancePayMoneyTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Orders', @level2type = N'COLUMN', @level2name = N'BalancePayFreightMoneyTotal';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderSendNote';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderSendNote', @level2type = N'COLUMN', @level2name = N'NoteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderSendNote', @level2type = N'COLUMN', @level2name = N'OrderId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_OrderSendNote', @level2type = N'COLUMN', @level2name = N'Operator';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'ModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'Gateway';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'IsUseInpour';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'IsUseInDistributor';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'Charge';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PaymentTypes', @level2type = N'COLUMN', @level2name = N'Settings';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoCategories';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoCategories', @level2type = N'COLUMN', @level2name = N'CategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoCategories', @level2type = N'COLUMN', @level2name = N'CategoryName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoCategories', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0????????????1?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoCategories', @level2type = N'COLUMN', @level2name = N'TypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'PhotoId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'CategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'PhotoName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'PhotoPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'FileSize';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'UploadTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'LastUpdateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0????????????1?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PhotoGallery', @level2type = N'COLUMN', @level2name = N'TypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'exChangeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'exChangeName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'PointNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'Date';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'MemberID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExchange_Changed', @level2type = N'COLUMN', @level2name = N'MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'DefualtGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'CustomGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'BeginDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'ProductNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_PointExChanges', @level2type = N'COLUMN', @level2name = N'ImgUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'exChangeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'ProductNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'PointNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'ChangedNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????0????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PointExChange_Products', @level2type = N'COLUMN', @level2name = N'eachMaxNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrivilegeInRoles';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrivilegeInRoles', @level2type = N'COLUMN', @level2name = N'RoleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrivilegeInRoles', @level2type = N'COLUMN', @level2name = N'Privilege';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'Receiver';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'Tel';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????0???????????????1????????????2????????????3?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'LogId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'DeliveryTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'ReceiveTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'ExpressName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'CourierNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID PATHS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'ReggionPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PrizesDeliveryRecord', @level2type = N'COLUMN', @level2name = N'Address';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductAttributes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductAttributes', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductAttributes', @level2type = N'COLUMN', @level2name = N'AttributeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductAttributes', @level2type = N'COLUMN', @level2name = N'ValueId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ConsultationId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'UserEmail';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ConsultationText';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ConsultationDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ReplyText';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ReplyDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ReplyUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductConsultations', @level2type = N'COLUMN', @level2name = N'ViewDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'ReviewId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'UserEmail';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'ReviewText';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'ReviewDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductReviews', @level2type = N'COLUMN', @level2name = N'OrderItemID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'CategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'TypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ProductName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ProductCode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ShortDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'Unit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'SaleStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'AddedDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'VistiCounts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'SaleCounts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ShowSaleCounts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ImageUrl1';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ImageUrl2';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ImageUrl3';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ImageUrl4';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ImageUrl5';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????40', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl40';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????60', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl60';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????100', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl100';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????160', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl160';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????180', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl180';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????220', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl220';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????310', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl310';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????410', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThumbnailUrl410';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'MarketPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'BrandId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'MainCategoryPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ExtendCategoryPath';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'HasSKU';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'IsfreeShipping';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'TaobaoProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'Source';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'MinShowPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'MaxShowPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'FreightTemplateId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'FirstCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'SecondCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ThirdCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'IsSetCommission';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'CubicMeter';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????kg???,??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'FreightWeight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Products', @level2type = N'COLUMN', @level2name = N'ProductShortName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTag';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTag', @level2type = N'COLUMN', @level2name = N'TagId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTag', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypeBrands';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypeBrands', @level2type = N'COLUMN', @level2name = N'ProductTypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypeBrands', @level2type = N'COLUMN', @level2name = N'BrandId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypes', @level2type = N'COLUMN', @level2name = N'TypeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypes', @level2type = N'COLUMN', @level2name = N'TypeName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ProductTypes', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GameId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GameType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GameTitle';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'BeginTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????(-1???????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'ApplyMembers';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'NeedPoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GivePoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'OnlyGiveNotPrizeMember';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????????????????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'PlayType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'NotPrzeDescription';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????URL??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GameUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'GameQRCodeAddress';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????(0????????????1????????????-1????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'LimitEveryDay';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'MaximumDailyLimit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGame', @level2type = N'COLUMN', @level2name = N'MemberCheck';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'PrizeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'GameId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'PrizeGrade';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'PrizeType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'GivePoint';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'GiveCouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'GiveShopBookId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'GriveShopBookPicUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'PrizeCount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'PrizeRate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGamePrizes', @level2type = N'COLUMN', @level2name = N'IsLogistics';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'LogId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'GameId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???0??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'PrizeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'PlayTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionGameResultMembersLog', @level2type = N'COLUMN', @level2name = N'IsUsed';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionWinningPool', @level2type = N'COLUMN', @level2name = N'GameId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionWinningPool', @level2type = N'COLUMN', @level2name = N'Number';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionWinningPool', @level2type = N'COLUMN', @level2name = N'GamePrizeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_PromotionWinningPool', @level2type = N'COLUMN', @level2name = N'IsReceive';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'CouponId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'BeginDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'MeetValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'CouponNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'CouponName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'ActivityName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'ImgUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'ShareTitle';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity_Record';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity_Record', @level2type = N'COLUMN', @level2name = N'shareId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity_Record', @level2type = N'COLUMN', @level2name = N'shareUser';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShareActivity_Record', @level2type = N'COLUMN', @level2name = N'attendUser';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'ShipperId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID?????????????????????0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'DistributorUserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????1???????????????2???????????????3????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'ShipperTag';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'ShipperName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'Address';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'TelPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'Zipcode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Shippers', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'Quantity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'AddTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'CategoryId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'Templateid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????? 0????????????????????????1??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'ExchangeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID??????0??????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_ShoppingCarts', @level2type = N'COLUMN', @level2name = N'LimitedTimeDiscountId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUItems';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUItems', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUItems', @level2type = N'COLUMN', @level2name = N'AttributeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUItems', @level2type = N'COLUMN', @level2name = N'ValueId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUMemberPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUMemberPrice', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUMemberPrice', @level2type = N'COLUMN', @level2name = N'GradeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUMemberPrice', @level2type = N'COLUMN', @level2name = N'MemberSalePrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'SkuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'SKU';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'Weight';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'Stock';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'CostPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_SKUs', @level2type = N'COLUMN', @level2name = N'SalePrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Tags';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Tags', @level2type = N'COLUMN', @level2name = N'TagID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Tags', @level2type = N'COLUMN', @level2name = N'TagName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TemplateRelatedShipping';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TemplateRelatedShipping', @level2type = N'COLUMN', @level2name = N'ModeId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TemplateRelatedShipping', @level2type = N'COLUMN', @level2name = N'ExpressCompanyName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TempSendCouponUserLists';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TempSendCouponUserLists', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_TempSendCouponUserLists', @level2type = N'COLUMN', @level2name = N'AdminId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserGroupSet';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserGroupSet', @level2type = N'COLUMN', @level2name = N'ActiveDay';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'ShippingId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'ShipTo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'Address';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'Zipcode';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'TelPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'CellPhone';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserShippingAddresses', @level2type = N'COLUMN', @level2name = N'IsDefault';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserSign';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserSign', @level2type = N'COLUMN', @level2name = N'UserID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserSign', @level2type = N'COLUMN', @level2name = N'SignDay';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserSign', @level2type = N'COLUMN', @level2name = N'Continued';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_UserSign', @level2type = N'COLUMN', @level2name = N'Stage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteItems';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteItems', @level2type = N'COLUMN', @level2name = N'VoteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteItems', @level2type = N'COLUMN', @level2name = N'VoteItemId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteItems', @level2type = N'COLUMN', @level2name = N'VoteItemName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteItems', @level2type = N'COLUMN', @level2name = N'ItemCount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteRecord';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteRecord', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_VoteRecord', @level2type = N'COLUMN', @level2name = N'VoteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'VoteId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'VoteName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'StartDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'MemberGrades';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'DefualtGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'CustomGroup';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hishop_Votes', @level2type = N'COLUMN', @level2name = N'IsMultiCheck';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????(???????????????11????????????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'unit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'userver';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'password';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'nickname';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'realname';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'level';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MeiQia_Userver', @level2type = N'COLUMN', @level2name = N'tel';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????id ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'Cid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????new(???)???second(??????)???unused(??????)???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'StuffStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'ProTitle';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'Num';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'LocationState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'LocationCity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????:seller??????????????????,buyer(????????????)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'FreightPayer';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'PostFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'ExpressFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EMS??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'EMSFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'HasInvoice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'HasWarranty';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'HasDiscount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????,?????????:7,14;??????:???;?????????:14 ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'ValidThru';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'ListTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????pid:vid;pid1:vid1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'PropertyAlias';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????ID???,?????????"pid1,pid2,pid3"', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'InputPids';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'InputStr';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SKU??????pid:vid;pid1:vid1,pid:vid;pid:vid', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'SkuProperties';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SKU??????2,3,4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'SkuQuantities';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SKU??????10.00,5.00', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'SkuPrices';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SKU????????????1234,1342', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Taobao_Products', @level2type = N'COLUMN', @level2name = N'SkuOuterIds';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'ActivityId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'StartDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'EndDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'CloseRemark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'Keys';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'MaxValue';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Activity', @level2type = N'COLUMN', @level2name = N'PicUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'ActivitySignUpId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'ActivityId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'UserName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'RealName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ActivitySignUp', @level2type = N'COLUMN', @level2name = N'SignUpDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify', @level2type = N'COLUMN', @level2name = N'AppId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify', @level2type = N'COLUMN', @level2name = N'ErrorType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify', @level2type = N'COLUMN', @level2name = N'AlarmContent';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AlarmNotify', @level2type = N'COLUMN', @level2name = N'TimeStamp';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'ReplyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'Keys';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'MatchType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'ReplyType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'MessageType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'IsDisable';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'LastEditDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'LastEditor';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'ActivityId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_AliFuwuReply', @level2type = N'COLUMN', @level2name = N'ArticleID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'ArticleType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'LinkType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'Memo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'PubTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Article', @level2type = N'COLUMN', @level2name = N'mediaid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'ArticleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'LinkType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'PubTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ArticleItems', @level2type = N'COLUMN', @level2name = N'mediaid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGrouping', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGrouping', @level2type = N'COLUMN', @level2name = N'GroupName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGrouping', @level2type = N'COLUMN', @level2name = N'UserCount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGrouping', @level2type = N'COLUMN', @level2name = N'Memo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGrouping', @level2type = N'COLUMN', @level2name = N'UpdateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGroupingUser', @level2type = N'COLUMN', @level2name = N'GroupId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGroupingUser', @level2type = N'COLUMN', @level2name = N'UserId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_CustomGroupingUser', @level2type = N'COLUMN', @level2name = N'UpdateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'AppId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'TimeStamp';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'OpenId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'MsgType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'FeedBackId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'TransId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'Reason';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'Solution';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????+??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_FeedBackNotify', @level2type = N'COLUMN', @level2name = N'ExtInfo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeProducts';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeProducts', @level2type = N'COLUMN', @level2name = N'ProductId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeProducts', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeTopics';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeTopics', @level2type = N'COLUMN', @level2name = N'TopicId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_HomeTopics', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????1????????????2?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'IntegralSourceType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'IntegralSource';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????-1000???+1000', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'IntegralChange';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'Remark';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'Userid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'GoToUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'TrateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_IntegralDetail', @level2type = N'COLUMN', @level2name = N'IntegralStatus';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'MenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'ParentMenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'ReplyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'Bind';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Menu', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'ReplyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'ImageUrl';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'URL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'Description';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Message', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'MenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'ParentMenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_NavMenu', @level2type = N'COLUMN', @level2name = N'ShopMenuPic';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'OrderID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'RedPagerActivityId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'RedPagerActivityName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'MaxGetTimes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'AlreadyGetTimes';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'ItemAmountLimit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'OrderAmountCanUse';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N' ?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'ExpiryDays';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????ID?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderRedPager', @level2type = N'COLUMN', @level2name = N'UserID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit', @level2type = N'COLUMN', @level2name = N'OrderIDNum';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit', @level2type = N'COLUMN', @level2name = N'OldOrderID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit', @level2type = N'COLUMN', @level2name = N'ItemList';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_OrderSplit', @level2type = N'COLUMN', @level2name = N'UpdateTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_Region';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????ID??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_Region', @level2type = N'COLUMN', @level2name = N'RegionId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VShop_Region', @level2type = N'COLUMN', @level2name = N'RegionName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'ReplyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'Keys';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'MatchType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'ReplyType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'MessageType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'IsDisable';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'LastEditDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'LastEditor';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'ActivityId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Reply', @level2type = N'COLUMN', @level2name = N'ArticleID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ScanOpenID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ScanOpenID', @level2type = N'COLUMN', @level2name = N'ScanDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????OPenID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ScanOpenID', @level2type = N'COLUMN', @level2name = N'AppID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????OpenID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ScanOpenID', @level2type = N'COLUMN', @level2name = N'SCannerUserOpenID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_ScanOpenID', @level2type = N'COLUMN', @level2name = N'SCannerUserNickName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'ID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'BalanceDrawRequestID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'UserID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????OpenID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'OpenId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'Amount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'ActName';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'Wishing';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????IP', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'ClientIP';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'IsSend';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_SendRedpackRecord', @level2type = N'COLUMN', @level2name = N'SendTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'ShareDesc';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'CreatTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image1';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image2';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image3';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image4';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image5';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???6', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image6';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???7', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image7';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???8', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image8';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???9', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Vshop_ShareMaterial_NineImages', @level2type = N'COLUMN', @level2name = N'image9';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors', @level2type = N'COLUMN', @level2name = N'OrderNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors', @level2type = N'COLUMN', @level2name = N'SaleAmountFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors', @level2type = N'COLUMN', @level2name = N'BuyerNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors', @level2type = N'COLUMN', @level2name = N'BuyerAvgPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Distributors', @level2type = N'COLUMN', @level2name = N'CommissionAmountFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'RecDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'OrderNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'SaleAmountFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'BuyerNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'UserAvgPrice';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'FXOrderNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'FXSaleAmountFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'FXResultPercent';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'CommissionFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'NewMemberNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'NewAgentNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'FinishedDrawCommissionFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Globals', @level2type = N'COLUMN', @level2name = N'WaitDrawCommissionFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'RecDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'FirstCountTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'BeginTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'EndTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????   1=??????   ????????????=??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'IsSuccess';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'ErrorStep';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Log', @level2type = N'COLUMN', @level2name = N'LogInfo';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_NotifyLog';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_NotifyLog', @level2type = N'COLUMN', @level2name = N'RecDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_NotifyLog', @level2type = N'COLUMN', @level2name = N'TaskTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_NotifyLog', @level2type = N'COLUMN', @level2name = N'FuncAction';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_NotifyLog', @level2type = N'COLUMN', @level2name = N'ActionDesc';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'RecDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'ProductID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'SaleQty';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'SaleAmountFee';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'TotalVisits';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'BuyerNumber';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_Products', @level2type = N'COLUMN', @level2name = N'ConversionRate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????????????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_ProductsVisits';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_ProductsVisits', @level2type = N'COLUMN', @level2name = N'RecDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_ProductsVisits', @level2type = N'COLUMN', @level2name = N'ProductID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vshop_Statistics_ProductsVisits', @level2type = N'COLUMN', @level2name = N'TotalVisits';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'MenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID???????????????0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'ParentMenuId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'DisplaySequence';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Menu', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'MessageId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Receiver_id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Sender_id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Created_at';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Text';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Vfid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Tovfid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Status';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'SenderMessage';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'SenderDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Display_Name';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Summary';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Image';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'ArticleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Token???', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Message', @level2type = N'COLUMN', @level2name = N'Access_Token';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'ReplyKeyId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'ArticleId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'IsDisable';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'EditDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'ReceiverType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Displayname';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Summary';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Image';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_Reply', @level2type = N'COLUMN', @level2name = N'Url';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_ReplyKeys';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_ReplyKeys', @level2type = N'COLUMN', @level2name = N'Id';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_ReplyKeys', @level2type = N'COLUMN', @level2name = N'Keys';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_ReplyKeys', @level2type = N'COLUMN', @level2name = N'Type';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Weibo_ReplyKeys', @level2type = N'COLUMN', @level2name = N'Matching';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '?????????????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_RecentOpenID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '??????OpenID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_RecentOpenID', @level2type = N'COLUMN', @level2name = N'OpenID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '???????????????????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'Title';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'MessageType';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'ArticleID';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'Content';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'SendState';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'SendTime';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'SendCount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'????????????ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'msgid';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'???????????????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'TotalCount';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'??????Json??????', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'WeiXin_SendAll', @level2type = N'COLUMN', @level2name = N'ReturnJsonData';
GO