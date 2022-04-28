CREATE EXTERNAL TABLE raw.tbl_sellers (
    id_vendedor     STRING COMMENT 'Id do vendedor',
    nu_prefixo_cep  STRING COMMENT 'Primeiros cinco digitos do CEP do vendedor',
    ds_cidade       STRING COMMENT 'Cidade que mora o vendedor',
    ds_estado       STRING COMMENT 'Estado que mora o vendedor'  
)
COMMENT 'Tabela raw de vendedores'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/sellers'
TBLPROPERTIES ("skip.header.line.count"="1");