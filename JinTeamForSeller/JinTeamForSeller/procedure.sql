-- 인서트 프로시저
CREATE PROCEDURE [dbo].insert_cus
	@cus_ID varchar(30),
	@cus_pwd varchar(128),
	@cus_phone varchar(15),
	@cus_addr nvarchar(max),
	@cus_name nvarchar(30),
	@cus_Nickname nvarchar(40),
	@cus_gender bit,
	@cus_age int
AS
insert into dbo.customers(cus_ID,cus_pwd,cus_phone,cus_addr,cus_name,cus_Nickname,cus_gender,cus_age)
values(@cus_ID,@cus_pwd,@cus_phone,@cus_addr,@cus_name,@cus_Nickname,@cus_gender,@cus_age)
go