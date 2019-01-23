CREATE TABLE [dbo].[category_List] (
    [cat_ID]   VARCHAR (6)   NOT NULL,	-- 카테고리 번호
    [cat_kind] NVARCHAR (20) NOT NULL,	-- 카테고리 종류
    PRIMARY KEY CLUSTERED ([cat_ID] ASC)
);
go


CREATE TABLE [dbo].[customers] (
    [cus_no]       INT           NOT NULL IDENTITY,	-- 고객 번호
    [cus_ID]       VARCHAR (30)  NOT NULL,	-- 고객 아이디
    [cus_pwd]      VARCHAR (128) NOT NULL,	-- 고객 비밀번호
    [cus_phone]    VARCHAR (15)  NOT NULL,	-- 고객 전화번호
    [cus_addr]     NVARCHAR (max) NOT NULL,	-- 고객 주소
    [cus_name]     NVARCHAR (30) NOT NULL,	-- 고객 이름
    [cus_Nickname] NVARCHAR (40) NULL,	-- 고객 별명
    [cus_gender]   bit   NOT NULL,	-- 고객 성별
    [cus_age]      INT           NOT NULL,	-- 고객 나이
    [cus_state]    BIT           DEFAULT ((1)) NOT NULL,	-- 고객 정보 상태
	[cus_count] INT NULL DEFAULT 1,		-- 배송정보 카운트
	 [withdrawal_date] DATETIME NOT NULL,  -- 탈퇴 날짜
    PRIMARY KEY CLUSTERED ([cus_no] ASC),
    UNIQUE NONCLUSTERED ([cus_phone] ASC),
    UNIQUE NONCLUSTERED ([cus_ID] ASC)
);
go

CREATE TABLE [dbo].[image_List] (
    [image_ID]  VARCHAR (30)  NOT NULL,	-- 이미지 번호
    [pro_ID]    VARCHAR (30)  NOT NULL,	-- 상품 번호
    [sub_image] VARCHAR (MAX) NOT NULL,	-- 상품 이미지
    PRIMARY KEY CLUSTERED ([image_ID] ASC)
	-- ,CONSTRAINT [img_pro_FK] FOREIGN KEY ([pro_ID]) REFERENCES [dbo].[products] ([pro_ID]) 
);
go

CREATE TABLE [dbo].[order_List] (
    [order_ID]    VARCHAR (25) NOT NULL,	-- 주문 번호
    [cus_no]      INT          NOT NULL,	-- 고객 번호
    [stock_ID]    VARCHAR (40) NOT NULL,	-- 재고 번호
    [order_count] INT          NOT NULL,	-- 주문 수량
    [order_price] INT          NOT NULL,	-- 주문 가격
	[order_require] NVARCHAR(MAX) NULL,		-- 주문 요구사항 (비고)
    PRIMARY KEY CLUSTERED ([order_ID] ASC)
	-- ,CONSTRAINT [ord_stk_FK] FOREIGN KEY ([stock_ID]) REFERENCES [dbo].[stock_List] ([stock_ID]) 
	-- ,CONSTRAINT [ord_cus_FK] FOREIGN KEY ([cus_no]) REFERENCES [dbo].[customers] ([cus_no]) 
);
go

CREATE TABLE [dbo].[payment_info] (
    [pay_ID]       INT          NOT NULL IDENTITY,	-- 결제 번호
    [order_ID]     VARCHAR (25) NOT NULL,	-- 주문 번호
    [user_ship_ID] VARCHAR (10) NOT NULL,	-- 배송지 번호
    [seller_no]    INT          NOT NULL,	-- 판매자 번호
    [pay_count]    INT          NOT NULL,	-- 결제 수량
    [pay_price]    INT          NOT NULL,	-- 결제 가격
    [waybill_ID]   VARCHAR (13) NULL,	-- 운송장 번호
    PRIMARY KEY CLUSTERED ([pay_ID] ASC)
	-- ,CONSTRAINT [pay_ord_FK] FOREIGN KEY ([order_ID]) REFERENCES [dbo].[order_List] ([order_ID]) 
	-- ,CONSTRAINT [pay_ship_FK] FOREIGN KEY ([user_ship_Id]) REFERENCES [dbo].[user_ship_info] ([user_ship_Id]) 
	-- ,CONSTRAINT [pay_sell_FK] FOREIGN KEY ([seller_no]) REFERENCES [dbo].[seller] ([seller_no]) 
	-- ,CONSTRAINT [pay_tran_FK] FOREIGN KEY ([waybill_ID]) REFERENCES [dbo].[transport_info] ([waybill_ID]) 
);
go

CREATE TABLE [dbo].[products] (
    [pro_ID]       VARCHAR (20)    NOT NULL,	-- 상품번호
    [cat_ID]       VARCHAR (4)     NOT NULL,	-- 카테고리 번호
    [seller_no]    INT             NOT NULL,	-- 판매자 번호
    [pro_name]     NVARCHAR (50)   NOT NULL,	-- 상품 이름
    [pro_price]    INT             NOT NULL,	-- 상품 가격
    [main_comment] VARCHAR (MAX) NULL,	-- 상품 설명
    [sub_comment]  VARCHAR (MAX)   NULL,	-- 상품 보조설명
    [main_image]   VARCHAR (MAX)   NULL,	-- 상품 대표이미지
    [pro_hits]     INT             NULL,	-- 상품 조회수
    [pro_like]     INT             NULL,	-- 상품 좋아요
    [pro_discount] INT             NULL,	-- 상품 할인율
    [pro_gender]   VARBINARY (2)   NOT NULL,	-- 추천 성별
    [pro_state]    BIT             DEFAULT ((1)) NULL,	-- 상품 정보 상태
    PRIMARY KEY CLUSTERED ([pro_ID] ASC)
	-- ,CONSTRAINT [pro_cat_FK] FOREIGN KEY ([cat_ID]) REFERENCES [dbo].[category_List] ([cat_ID])
	-- ,CONSTRAINT [pro_sell_FK] FOREIGN KEY ([seller_no]) REFERENCES [dbo].[seller] ([seller_no])
);
go

CREATE TABLE [dbo].[review] (
    [re_ID]           INT            NOT NULL,	-- 리뷰 번호
    [cus_no]          INT            NOT NULL,	-- 고객 번호
    [pro_ID]          VARCHAR (30)   NOT NULL,	-- 상품 번호
    [re_like]         BIT            DEFAULT ((1)) NOT NULL,	-- 상품 좋아요
    [re_image]        VARCHAR (MAX)  NOT NULL,	-- 리뷰 이미지
    [re_txt]          NVARCHAR (MAX) NOT NULL,	-- 리뷰 내용
    [re_date]         DATETIME       NOT NULL,	-- 리뷰 날짜
    [re_comment]      NVARCHAR (MAX) NULL,	-- 답글 
    [re_comment_date] DATETIME       NULL,	-- 답글 날짜
    PRIMARY KEY CLUSTERED ([re_ID] ASC)
	-- ,CONSTRAINT [re_pro_FK] FOREIGN KEY ([pro_ID]) REFERENCES [dbo].[products] ([pro_ID])
	-- ,CONSTRAINT [re_cus_FK] FOREIGN KEY ([cus_no]) REFERENCES [dbo].[customers] ([cus_no])
);
go

CREATE TABLE [dbo].[seller] (
    [seller_no]     INT            NOT NULL IDENTITY,	-- 판매자 번호
    [seller_ID]     VARCHAR (30)   NOT NULL,	-- 판매자 아이디
    [seller_pwd]    VARCHAR (128)  NOT NULL,	-- 판매자 비밀번호
    [seller_name]   NVARCHAR (30)  NOT NULL,	-- 판매자 이름
    [seller_addr]   NVARCHAR (MAX) NOT NULL,	-- 회사 주소
    [seller_boos]   NVARCHAR (30)  NOT NULL,	-- 회사 대효
    [seller_phone]  VARCHAR (15)   NOT NULL,	-- 판매자 전화번호
    [seller_postal] INT            NOT NULL,	-- 회사 우편번호
    [seller_email]  VARCHAR (50)   NOT NULL,	-- 회사 이메일
    [seller_fax]    INT            NOT NULL,	-- 회사 팩스
    [return_addr]   NVARCHAR (MAX) NOT NULL,	-- 반품지 주소
    [seller_state]  BIT            DEFAULT ((1)) NOT NULL,	-- 판매자 상태 ( 활성화, 비활성화 )
	[corporate_registration_no] INT NOT NULL, -- 사업자 등록번호
	[join_state] BIT NOT NULL DEFAULT 0,	-- 가입 승인 상태
    PRIMARY KEY CLUSTERED ([seller_no] ASC)
);
go

CREATE TABLE [dbo].[stock_List] (
    [stock_ID]    VARCHAR (40) NOT NULL,  -- 재고 번호
    [pro_ID]      VARCHAR (30) NOT NULL,  -- 상품 번호
    [seller_no]   INT          NOT NULL,  -- 판매자 번호
    [stock_size]  NVARCHAR (40) NOT NULL,  -- 재고 사이즈 종류
    [stock_count] INT          NOT NULL,	-- 재고 개수
    PRIMARY KEY CLUSTERED ([stock_ID] ASC)
	-- ,CONSTRAINT [stk_pro_FK] FOREIGN KEY ([pro_ID]) REFERENCES [dbo].[products] ([pro_ID]) 
	-- ,CONSTRAINT [stk_sell_FK] FOREIGN KEY ([seller_no]) REFERENCES [dbo].[seller] ([seller_no]) 
);
go

CREATE TABLE [dbo].[transport_info] (
    [transport_ID]    INT           NOT NULL IDENTITY,	-- 운송 번호
    [seller_no]       INT           NOT NULL,	-- 판매자 번호
    [waybill_ID]      VARCHAR (13)  NOT NULL,	-- 운송장 번호
    [transport_state] NVARCHAR (20) NOT NULL,	-- 배송 상태
    PRIMARY KEY CLUSTERED ([transport_ID] ASC)
	-- ,CONSTRAINT [tran_sell_FK] FOREIGN KEY ([seller_no]) REFERENCES [dbo].[seller] ([seller_no]) 
	-- ,CONSTRAINT [tran_pay_FK] FOREIGN KEY ([pay_ID]) REFERENCES [dbo].[payment_info] ([pay_ID]) 
);
go

CREATE TABLE [dbo].[user_ship_info] (
    [user_ship_Id] VARCHAR (10)   NOT NULL,	-- 배송지 번호
    [cus_no]       INT            NOT NULL,	-- 고객 번호
    [user_name]    NVARCHAR (30)  NOT NULL,	-- 받는이
    [user_addr]    NVARCHAR (MAX) NOT NULL,	-- 배송지
    [postal_code]  INT            NOT NULL,	-- 우편 번호
    [ship_require]      NVARCHAR (MAX) NULL,	-- 요구사항
    PRIMARY KEY CLUSTERED ([user_ship_Id] ASC)
	-- ,CONSTRAINT [ship_cus_FK] FOREIGN KEY ([cus_no]) REFERENCES [dbo].[customers] ([cus_no]) 
);
go

CREATE TABLE [dbo].[wish_List] (
    [wish_ID]    VARCHAR (25) NOT NULL,	-- 장바구니 번호
    [cus_ID]     INT          NOT NULL,	-- 고객 번호
    [stock_ID]   VARCHAR (40) NOT NULL,	-- 재고 번호
    [wish_count] INT          NOT NULL,	-- 장바구니 수량
    [wish_price] INT          NOT NULL,	-- 장바구니 가격
    PRIMARY KEY CLUSTERED ([wish_ID] ASC)
	-- ,CONSTRAINT [wish_stk_FK] FOREIGN KEY ([stock_ID]) REFERENCES [dbo].[stock_List] ([stock_ID]) 
	-- ,CONSTRAINT [wish_cus_FK] FOREIGN KEY ([cus_no]) REFERENCES [dbo].[customers] ([cus_no]) 
);
go






