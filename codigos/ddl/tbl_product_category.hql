CREATE EXTERNAL TABLE raw.tbl_product_category (
    ds_nome_categoria_pt    STRING COMMENT 'Nome da categoria do produto em portugues',
    ds_nome_categoria_en    STRING COMMENT 'Nome da categoria do produto em ingles'
)
COMMENT 'Tabela raw de categorias dos produtos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/product_category'
TBLPROPERTIES ("skip.header.line.count"="1");