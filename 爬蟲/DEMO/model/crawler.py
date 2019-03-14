from pyquery import PyQuery as pq
import pandas as pd
import time
import random  
import requests

def crawl(x,beginDt,endDt,website,ID=[],title=[],tour_day=[],beg_date=[],price=[],available_sale=[],total_sale=[]):
    daylist=pd.DataFrame(columns=[ 'prod_no','day_num', 'daylist'])
    for i in range(1,x):
        url='http://www.'+website+'.com.tw/EW/Services/SearchListData.asp'
        values={'displayType': 'G',
                'subCd': '',
                'orderCd': 1,
                'pageALL': x,
                'pageGO': 1,
                'pagePGO': 1,
                'waitData': 'false',
                'waitPage': 'false',
                'mGrupCd':'',
                'SrcCls':'',
                'tabList': '',
                'regmCd': '',
                'regsCd':'',
                'beginDt': '2019/03/08',
                'endDt': '2019/09/07',
                'portCd':'',
                'tdays':'',
                'bjt':'',
                'carr':'',
                'allowJoin': 1,
                'allowWait': 1,
                'ikeyword':'' 
                        }  
        r = requests.post(url, data=values)
        text=r.json()
        print('now is PAGE',i)
        for i in text['All']:
            ID.append(i['GrupCd'])
            title.append(i['GrupSnm'])
            tour_day.append(i['GrupLn'])
            beg_date.append(i['LeavDt'].split('19/')[1])
            price.append(i['SaleAm'])
            available_sale.append(i['SaleYqt'])
            total_sale.append(i['EstmYqt'])
            print('http://www.'+website+'.com.tw/'+i['Url'])
            #抓取進入其他開團網頁
            doc_html=pq('http://www.'+website+'.com.tw/'+i['Url'])
            #取團號
            prod_no=doc_html('.number_status').text().split('：')[1].split(' ')[0].strip()
            #取旅遊天數
            day=[i.text for i in doc_html('.tw_day')]
            #取旅遊天數行程
            dayls=[i.text.strip() for i in doc_html('.day_title_right span span')]
            if dayls==[]:
                dayls=[i.text for i in doc_html('.day_title_right')]
            tmp=pd.DataFrame([day,dayls]).T
            tmp.columns=['day_num','daylist']
            tmp.insert(0,'prod_no',prod_no)
            daylist=pd.concat([daylist,tmp])
            sleep_secs = random.randint(0, 1)
            time.sleep(sleep_secs) 
    data=pd.DataFrame([ID,title,tour_day,beg_date,price,available_sale,total_sale]).T

    data.columns=['prod_no','title','tour_day','beg_date','price','available_sale','total_sale']
    return data,daylist