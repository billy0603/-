USE master
GO
 
--刪除原有資料庫
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Finance')
  BEGIN     
     ALTER DATABASE Finance SET  SINGLE_USER WITH ROLLBACK IMMEDIATE 
     DROP DATABASE Finance
   END
GO
--建立資料庫
 create database Finance
  Go

 use Finance
 Go

 --建第一張資料表
 create table PROD_OHLCV
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null,
	 DATE date not null,
	 P_OPEN float not null,
	 P_HIGH float not null,
	 P_LOW float not null,
     P_CLOSE float not null,
	 VOLUME float not null,
	 O_VOLUME float not null,	
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	)

	--建立第一張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'開盤價', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_OPEN'
	EXEC  sp_addextendedproperty 'MS_Description', N'最高價', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_HIGH'
	EXEC  sp_addextendedproperty 'MS_Description', N'最低價', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_LOW'
	EXEC  sp_addextendedproperty 'MS_Description', N'收盤價', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_CLOSE'
	EXEC  sp_addextendedproperty 'MS_Description', N'合計成交量', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','VOLUME'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉量', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','O_VOLUME'
	Go

	--建第二張表格
	create table PROD_FUTUER_DTAT
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null,
	 ID nvarchar(1) not null,
	 DATE date not null,
	 F_BQTY_DAY  float not null,
	 F_BAMT_DAY float not null,
	 F_SQTY_DAY float not null,
     F_SAMT_DAY float not null,
	 F_BQTY_TOTAL float not null,
 	 F_BAMT_TOTAL float not null,
	 F_SQTY_TOTAL float not null,
	 F_SAMT_TOTAL float not null,
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	 )

	--建立第二張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'身分', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日 多方 口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日 多方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日 空方 口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日 空方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SAMT_DAY'					 
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 多方 口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 多方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BAMT_TOTAL'					 
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 空方 口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 空方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SAMT_TOTAL'	
	GO 
	
	--建第三張表格
	create table PROD_OP_DTAT
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null,
	 ID nvarchar(1) not null,
	 DATE date not null,

	 OP_CALL_BQTY_DAY  float not null,
	 OP_CALL_BAMT_DAY float not null,
	 OP_CALL_SQTY_DAY float not null,
     OP_CALL_SAMT_DAY float not null,
	 OP_CALL_BQTY_TOTAL float not null,
	 OP_CALL_BAMT_TOTAL float not null,
	 OP_CALL_SQTY_TOTAL float not null,
	 OP_CALL_SAMT_TOTAL float not null,
	 OP_PUT_BQTY_DAY float not null,
	 OP_PUT_BAMT_DAY float not null,
	 OP_PUT_SQTY_DAY float not null,
	 OP_PUT_SAMT_DAY float not null,
	 OP_PUT_BQTY_TOTAL float not null,
	 OP_PUT_BAMT_TOTAL float not null,
	 OP_PUT_SQTY_TOTAL float not null,
	 OP_PUT_SAMT_TOTAL float not null,
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	 )

	--建立第三張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'身分', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日買權 買方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日買權買方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日買權 賣方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日買權賣方契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 買權 買方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 買權 買方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 買權 賣方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 買權 賣方  契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日賣權 買方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日賣權買方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日賣權 賣方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'當日賣權賣方契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 賣權 買方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 賣權 買方 契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 賣權 賣方口數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'未平倉 賣權 賣方  契約金額(千元)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SAMT_TOTAL'
	Go
	
	--建立第四張表格
	create table PROD_LEGALPERSON_DTAT
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null,	  
	 DATE date not null,
	 FIVE_B_QTY  float not null,
	 FIVE_B_PERCENTAGE float not null,
	 FIVE_S_QTY float not null,
     Five_S_PERCENTAGE float not null,
	 TEN_B_QTY float not null,
	 TEN_B_PERCENTAGE float not null,
	 TEN_S_QTY float not null,
	 TEN_S_PERCENTAGE float not null,
	 TOTAl_OPEN_OPSITION_QTY float not null,
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	)

	--建立第四張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'五大買方當日部位', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_B_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'五大買方當日百分比', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_B_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'五大賣方當日部位', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_S_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'五大買方當日百分比', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','Five_S_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'十大買方當日部位', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_B_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'十大買方當日百分比', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_B_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'十大賣方當日部位', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_S_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'十大買方當日百分比', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_S_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'全市場未沖銷數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TOTAl_OPEN_OPSITION_QTY'
	Go

	--建立第五張表格
	create table PROD_TWSE_THREE_CORP_DATA
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null default 'TWSE',
	 ID nvarchar(25) not null,
	 DATE date not null,	 
	 BUY_AMT float not null,
	 SELL_AMT float not null,
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	)

	--建立第五張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'身分', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'買進金額', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','BUY_AMT'
	EXEC  sp_addextendedproperty 'MS_Description', N'賣出金額', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','SELL_AMT'
	 Go

	 --建立第六張表格
	create table PROD_STOCK_LEND_BORROW
	(OID uniqueidentifier default NEWID(),
	 SYMBOLNAME nvarchar(25) not null default 'TWSE', 
	 DATE date not null,	 
	 BUY_QTY float not null,
	 SELL_QTY float not null,
	 REPAYMENT float not null,
	 Y_BALANCE float not null,
	 N_BALANCE float not null,
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(OID)
	)

	--建立第六張描述
	EXEC  sp_addextendedproperty 'MS_Description', N'商品代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','SYMBOLNAME'
 	EXEC  sp_addextendedproperty 'MS_Description', N'日期', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'買進', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','BUY_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'賣出', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','SELL_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'現金(券)償還', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','REPAYMENT'
	EXEC  sp_addextendedproperty 'MS_Description', N'前日餘額', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','Y_BALANCE'
	EXEC  sp_addextendedproperty 'MS_Description', N'今日餘額', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','N_BALANCE'
	 Go

	 	 --建第七張表格
create table PROD_TWSE_DATA
(OID uniqueidentifier default NEWID(),
SYMBOLNAME nvarchar(25) not null  default 'TWSE' ,
DATE date not null,
TRADING_VOLUME float not null,
TURNOVER_VALUE float not null,
TRANSACTIONS_NUMBER float not null,
TWSE_CLOSE_PRICE float not null,
TWSE_UP_DN_POINT float not null,
CREATE_DT nvarchar(32),
CREATE_USER_NAME  nvarchar(32),
UPDATE_DT  nvarchar(32),
UPDATE_USER_NAME nvarchar(32),
CORP_USER_IP_ADDR nvarchar(32),
UPDATE_PROG_NAME nvarchar(32),
VER_DT datetime not null default getdate(),
primary key(OID)
)

--建立第七張描述
EXEC  sp_addextendedproperty  'MS_Description', N'商品代碼(TWSE)固定','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','SYMBOLNAME'
EXEC  sp_addextendedproperty  'MS_Description', N'日期','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','DATE'
EXEC  sp_addextendedproperty  'MS_Description', N'成交股數', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TRADING_VOLUME'
EXEC  sp_addextendedproperty  'MS_Description', N'成交金額','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TURNOVER_VALUE'
EXEC  sp_addextendedproperty  'MS_Description', N'成交筆數','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TRANSACTIONS_NUMBER'
EXEC  sp_addextendedproperty  'MS_Description', N'發行量加權股價指數','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TWSE_CLOSE_PRICE'
EXEC  sp_addextendedproperty  'MS_Description', N'漲跌點數','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TWSE_UP_DN_POINT'
GO

--建第八張資料表
 create table PROD_STOCK_WEIGHT
	(STOCKID nvarchar(10),
	 STOCKNAME nvarchar(25) not null,
	 STOCKWEIGHT float not null,
	 LAST_UPDATE_DATE date not null,		
	 CREATE_DT  nvarchar(32),
	 CREATE_USER_NAME nvarchar(32),
	 UPDATE_DT nvarchar(32),
	 UPDATE_USER_NAME nvarchar(32),
	 CORP_USER_IP_ADDR nvarchar(32),
	 UPDATE_PROG_NAME nvarchar(32),
	 VER_DT datetime not null default getdate() ,
	 primary key(STOCKID)
	)

	--建立第八張描述
EXEC  sp_addextendedproperty 'MS_Description', N'股票代碼', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKID'
EXEC  sp_addextendedproperty 'MS_Description', N'股票名稱', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKNAME'
EXEC  sp_addextendedproperty 'MS_Description', N'權重', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKWEIGHT'
Go