# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class ScraperItem(scrapy.Item):
    # define the fields for your item here like:
    Estado = scrapy.Field()
    Cidade = scrapy.Field()
    Bairro = scrapy.Field()
    Logradouro = scrapy.Field()
    Latitude = scrapy.Field()
    Longitude = scrapy.Field()
    pass

