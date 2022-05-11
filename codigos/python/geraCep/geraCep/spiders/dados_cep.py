import scrapy
from scrapy import Request, FormRequest
import re
from geraCep.items import ScraperItem
import pandas as pd
import json
import unicodedata
import datetime
import geopy
from geopy.geocoders import Nominatim


class CepSpider(scrapy.Spider):
    name = "geraCep"
    allowed_domains = []
    headers={'Accept':'*/*', 
        'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36 OPR/85.0.4341.72'
    }
    

    def __init__(self):
        self.date_now = datetime.datetime.now().strftime('%d/%m/%Y')
        self.df = pd.read_csv(r'C:\Users\lfbas\Downloads\olist_customers_dataset.csv')
        self.url_ini = 'https://apps.widenet.com.br/busca-cep/api/cep.html?code='


    def start_requests(self):
        for index, row in self.df.iterrows():
            cep = row['customer_zip_code_prefix']
            if len(str(cep)) == 3:
                cep = '00' + str(cep) + '000'
            elif len(str(cep)) == 4:
                cep = '0' + str(cep) + '000'
            elif len(str(cep)) == 5:
                cep = str(cep) + '000'
            url_cep = self.url_ini + cep
            yield Request(url_cep,
                    headers=self.headers,
                    meta={
                        cep: cep
                    },
                    callback=self.parse_cursos_pres)
        

    def parse_cursos_pres(self, response):
        if response.body not in [b'CEP n\xc3\xa3o encontrado', b'Blocked by flood']:
            endereco_utf8 = response.body.decode('utf-8')
            endereco = endereco_utf8.split(',')
            logradouro = endereco[0].split('-')[0].lstrip().rstrip()
            city = endereco[1].split('-')[1].split('/')[0].lstrip().rstrip()
            uf = endereco[1].split('-')[1].split('/')[1].lstrip().rstrip()
            bairro = endereco[1].split('-')[0].lstrip().rstrip()
            endereco_geopy = logradouro + ', ' + bairro + ' - ' + city + ' / ' + uf
            geolocator = Nominatim(user_agent="Chrome/99.0.4844.84")
            location = geolocator.geocode(endereco_geopy)
            latitude = location.latitude
            longitude = location.longitude

            item = ScraperItem()
            item['Estado'] = uf
            item['Cidade'] = city
            item['Bairro'] = bairro
            item['Logradouro'] = logradouro
            item['Latitude'] = latitude
            item['Longitude'] = longitude
            yield item
        else:
            cep = response.meta['cep'][:-1]+ '1'
            url_cep = self.url_ini + cep
            yield Request(url_cep,
                    headers=self.headers,
                    meta={
                        cep: cep
                    },
                    callback=self.parse_cursos_retry)

    
    def parse_cursos_retry(self, response):
        endereco_utf8 = response.body.decode('utf-8')
        endereco = endereco_utf8.split(',')
        logradouro = endereco[0].split('-')[0].lstrip().rstrip()
        city = endereco[1].split('-')[1].split('/')[0].lstrip().rstrip()
        uf = endereco[1].split('-')[1].split('/')[1].lstrip().rstrip()
        bairro = endereco[1].split('-')[0].lstrip().rstrip()
        endereco_geopy = logradouro + ', ' + bairro + ' - ' + city + ' / ' + uf
        geolocator = Nominatim(user_agent="Chrome/99.0.4844.84")
        location = geolocator.geocode(endereco_geopy)
        latitude = location.latitude
        longitude = location.longitude

        item = ScraperItem()
        item['Estado'] = uf
        item['Cidade'] = city
        item['Bairro'] = bairro
        item['Logradouro'] = logradouro
        item['Latitude'] = latitude
        item['Longitude'] = longitude
        yield item

