USE master
GO
 
--�R���즳��Ʈw
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Finance')
  BEGIN     
     ALTER DATABASE Finance SET  SINGLE_USER WITH ROLLBACK IMMEDIATE 
     DROP DATABASE Finance
   END
GO
--�إ߸�Ʈw
 create database Finance
  Go

 use Finance
 Go

 --�زĤ@�i��ƪ�
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

	--�إ߲Ĥ@�i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�}�L��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_OPEN'
	EXEC  sp_addextendedproperty 'MS_Description', N'�̰���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_HIGH'
	EXEC  sp_addextendedproperty 'MS_Description', N'�̧C��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_LOW'
	EXEC  sp_addextendedproperty 'MS_Description', N'���L��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','P_CLOSE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�X�p����q', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','VOLUME'
	EXEC  sp_addextendedproperty 'MS_Description', N'�����ܶq', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OHLCV', 'COLUMN','O_VOLUME'
	Go

	--�زĤG�i���
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

	--�إ߲ĤG�i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'����', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'��� �h�� �f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'��� �h�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'��� �Ť� �f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'��� �Ť� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SAMT_DAY'					 
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �h�� �f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �h�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_BAMT_TOTAL'					 
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �Ť� �f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �Ť� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_FUTUER_DTAT', 'COLUMN','F_SAMT_TOTAL'	
	GO 
	
	--�زĤT�i���
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

	--�إ߲ĤT�i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'����', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'���R�v �R��f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'���R�v�R�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'���R�v ���f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'���R�v��諴�����B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �R�v �R��f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �R�v �R�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_BAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �R�v ���f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ �R�v ���  �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_CALL_SAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'�����v �R��f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�����v�R�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�����v ���f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SQTY_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�����v��諴�����B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SAMT_DAY'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ ���v �R��f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ ���v �R�� �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_BAMT_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ ���v ���f��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SQTY_TOTAL'
	EXEC  sp_addextendedproperty 'MS_Description', N'������ ���v ���  �������B(�d��)', 'SCHEMA', 'dbo', 'TABLE', 'PROD_OP_DTAT', 'COLUMN','OP_PUT_SAMT_TOTAL'
	Go
	
	--�إ߲ĥ|�i���
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

	--�إ߲ĥ|�i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'���j�R���鳡��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_B_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'���j�R����ʤ���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_B_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'���j����鳡��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','FIVE_S_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'���j�R����ʤ���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','Five_S_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�Q�j�R���鳡��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_B_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�Q�j�R����ʤ���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_B_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�Q�j����鳡��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_S_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�Q�j�R����ʤ���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TEN_S_PERCENTAGE'
	EXEC  sp_addextendedproperty 'MS_Description', N'���������R�P��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_LEGALPERSON_DTAT', 'COLUMN','TOTAl_OPEN_OPSITION_QTY'
	Go

	--�إ߲Ĥ��i���
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

	--�إ߲Ĥ��i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','SYMBOLNAME'
	EXEC  sp_addextendedproperty 'MS_Description', N'����', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','ID'
	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�R�i���B', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','BUY_AMT'
	EXEC  sp_addextendedproperty 'MS_Description', N'��X���B', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_THREE_CORP_DATA', 'COLUMN','SELL_AMT'
	 Go

	 --�إ߲Ĥ��i���
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

	--�إ߲Ĥ��i�y�z
	EXEC  sp_addextendedproperty 'MS_Description', N'�ӫ~�N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','SYMBOLNAME'
 	EXEC  sp_addextendedproperty 'MS_Description', N'���', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','DATE'
	EXEC  sp_addextendedproperty 'MS_Description', N'�R�i', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','BUY_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'��X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','SELL_QTY'
	EXEC  sp_addextendedproperty 'MS_Description', N'�{��(��)�v��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','REPAYMENT'
	EXEC  sp_addextendedproperty 'MS_Description', N'�e��l�B', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','Y_BALANCE'
	EXEC  sp_addextendedproperty 'MS_Description', N'����l�B', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_LEND_BORROW', 'COLUMN','N_BALANCE'
	 Go

	 	 --�زĤC�i���
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

--�إ߲ĤC�i�y�z
EXEC  sp_addextendedproperty  'MS_Description', N'�ӫ~�N�X(TWSE)�T�w','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','SYMBOLNAME'
EXEC  sp_addextendedproperty  'MS_Description', N'���','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','DATE'
EXEC  sp_addextendedproperty  'MS_Description', N'����Ѽ�', 'SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TRADING_VOLUME'
EXEC  sp_addextendedproperty  'MS_Description', N'������B','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TURNOVER_VALUE'
EXEC  sp_addextendedproperty  'MS_Description', N'���浧��','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TRANSACTIONS_NUMBER'
EXEC  sp_addextendedproperty  'MS_Description', N'�o��q�[�v�ѻ�����','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TWSE_CLOSE_PRICE'
EXEC  sp_addextendedproperty  'MS_Description', N'���^�I��','SCHEMA', 'dbo', 'TABLE', 'PROD_TWSE_DATA', 'COLUMN','TWSE_UP_DN_POINT'
GO

--�زĤK�i��ƪ�
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

	--�إ߲ĤK�i�y�z
EXEC  sp_addextendedproperty 'MS_Description', N'�Ѳ��N�X', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKID'
EXEC  sp_addextendedproperty 'MS_Description', N'�Ѳ��W��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKNAME'
EXEC  sp_addextendedproperty 'MS_Description', N'�v��', 'SCHEMA', 'dbo', 'TABLE', 'PROD_STOCK_WEIGHT', 'COLUMN','STOCKWEIGHT'
Go