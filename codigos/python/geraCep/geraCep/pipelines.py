# -*- coding: utf-8 -*-

from scrapy import signals
from scrapy.exceptions import DropItem
from scrapy.exporters import CsvItemExporter

# Pipeline to output to csv without calling -o output.csv each time
class CSVPipeline(object):

    @classmethod
    def from_crawler(cls, crawler):
        pipeline = cls()
        crawler.signals.connect(pipeline.spider_opened, signals.spider_opened)
        crawler.signals.connect(pipeline.spider_closed, signals.spider_closed)
        return pipeline

    def spider_opened(self, spider):
        self.file = open('lista_enderecos_coordenadas.csv', 'w+b')
        self.exporter = CsvItemExporter(self.file)
        self.exporter.start_exporting()

    def spider_closed(self, spider):
        self.exporter.finish_exporting()
        self.file.close()

    def process_item(self, item, spider):
        self.exporter.export_item(item)
        return item

class DuplicatesPipeline(object):

    def __init__(self):
        self.items_seen = list()

    def process_item(self, item, spider):
        try:
            if spider.drop_duplicates:
                if item in self.items_seen:
                    raise DropItem("Duplicate item found: %s" % item)
                else:
                    self.items_seen.append(item)
                    return item
            else:
                return item
        except AttributeError:
            return item

