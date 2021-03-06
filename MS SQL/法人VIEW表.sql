 CREATE VIEW v4
 as
select top 100  PERCENT L.DATE AS '日期'
,OH.P_CLOSE AS '期貨'
,(OH.P_CLOSE-LAG(OH.P_CLOSE) OVER (ORDER BY OH.DATE)) AS '期貨差額'
,ROUND((OH.P_CLOSE-(select TWSE_CLOSE_PRICE from PROD_TWSE_DATA where DATE=OH.DATE)),3) as '期現價差'
,FIVE_B_QTY AS '前五大特法-買'
,(FIVE_B_QTY-LAG(FIVE_B_QTY) OVER (ORDER BY L.DATE)) AS '前五大特法-買/差額'  
,FIVE_S_QTY AS '前五大特法-賣'
,(FIVE_S_QTY-LAG(FIVE_S_QTY) OVER (ORDER BY L.DATE)) AS '前五大特法-賣/差額' 
,TEN_B_QTY AS '前十大特法-買'
,(TEN_B_QTY-LAG(TEN_B_QTY) OVER (ORDER BY L.DATE)) AS '前十大特法-買/差額'  
,TEN_S_QTY AS '前十大特法-賣'
,(TEN_S_QTY-LAG(TEN_S_QTY) OVER (ORDER BY L.DATE)) AS '前十大特法-賣/差額'
,ROUND((TEN_B_QTY/TOTAl_OPEN_OPSITION_QTY),2) AS '前十大特法-買百分比'  
,ROUND((TEN_S_QTY/TOTAl_OPEN_OPSITION_QTY),2) AS '前十大特法-賣百分比' 
,TOTAl_OPEN_OPSITION_QTY AS '全市場'
,(TOTAl_OPEN_OPSITION_QTY-LAG(TOTAl_OPEN_OPSITION_QTY) OVER (ORDER BY L.DATE)) AS '全市場差額'
,(FIVE_B_QTY-FIVE_S_QTY) AS '五大特法淨部位'
,((FIVE_B_QTY-FIVE_S_QTY)-LAG((FIVE_B_QTY-FIVE_S_QTY)) OVER (ORDER BY L.DATE)) AS '五大特法淨部位差額'
,(TEN_B_QTY-TEN_S_QTY) AS '十大特法淨部位'
,((TEN_B_QTY-TEN_S_QTY)-LAG((TEN_B_QTY-TEN_S_QTY)) OVER (ORDER BY L.DATE)) AS '十大特法淨部位差額'
from PROD_LEGALPERSON_DTAT L
join PROD_OHLCV OH
on L.DATE=OH.DATE 
where OH.SYMBOLNAME='TXF'
order by L.DATE desc
 go