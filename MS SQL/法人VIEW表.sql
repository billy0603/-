 CREATE VIEW v4
 as
select top 100  PERCENT L.DATE AS '���'
,OH.P_CLOSE AS '���f'
,(OH.P_CLOSE-LAG(OH.P_CLOSE) OVER (ORDER BY OH.DATE)) AS '���f�t�B'
,ROUND((OH.P_CLOSE-(select TWSE_CLOSE_PRICE from PROD_TWSE_DATA where DATE=OH.DATE)),3) as '���{���t'
,FIVE_B_QTY AS '�e���j�S�k-�R'
,(FIVE_B_QTY-LAG(FIVE_B_QTY) OVER (ORDER BY L.DATE)) AS '�e���j�S�k-�R/�t�B'  
,FIVE_S_QTY AS '�e���j�S�k-��'
,(FIVE_S_QTY-LAG(FIVE_S_QTY) OVER (ORDER BY L.DATE)) AS '�e���j�S�k-��/�t�B' 
,TEN_B_QTY AS '�e�Q�j�S�k-�R'
,(TEN_B_QTY-LAG(TEN_B_QTY) OVER (ORDER BY L.DATE)) AS '�e�Q�j�S�k-�R/�t�B'  
,TEN_S_QTY AS '�e�Q�j�S�k-��'
,(TEN_S_QTY-LAG(TEN_S_QTY) OVER (ORDER BY L.DATE)) AS '�e�Q�j�S�k-��/�t�B'
,ROUND((TEN_B_QTY/TOTAl_OPEN_OPSITION_QTY),2) AS '�e�Q�j�S�k-�R�ʤ���'  
,ROUND((TEN_S_QTY/TOTAl_OPEN_OPSITION_QTY),2) AS '�e�Q�j�S�k-��ʤ���' 
,TOTAl_OPEN_OPSITION_QTY AS '������'
,(TOTAl_OPEN_OPSITION_QTY-LAG(TOTAl_OPEN_OPSITION_QTY) OVER (ORDER BY L.DATE)) AS '�������t�B'
,(FIVE_B_QTY-FIVE_S_QTY) AS '���j�S�k�b����'
,((FIVE_B_QTY-FIVE_S_QTY)-LAG((FIVE_B_QTY-FIVE_S_QTY)) OVER (ORDER BY L.DATE)) AS '���j�S�k�b����t�B'
,(TEN_B_QTY-TEN_S_QTY) AS '�Q�j�S�k�b����'
,((TEN_B_QTY-TEN_S_QTY)-LAG((TEN_B_QTY-TEN_S_QTY)) OVER (ORDER BY L.DATE)) AS '�Q�j�S�k�b����t�B'
from PROD_LEGALPERSON_DTAT L
join PROD_OHLCV OH
on L.DATE=OH.DATE 
where OH.SYMBOLNAME='TXF'
order by L.DATE desc
 go