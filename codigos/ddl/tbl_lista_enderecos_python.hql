CREATE EXTERNAL TABLE raw.tbl_lista_enderecos_python (
    nu_prefixo_cep          STRING COMMENT 'Primeiros cinco digitos do CEP do local',
    ds_latitude             STRING COMMENT 'Latitude do local',
    ds_longitude            STRING COMMENT 'Longitude do local',
    ds_bairro_logradouro    STRING COMMENT 'Bairro e logradouro do local'
)
COMMENT 'Tabela raw de lista de enderecos vinda do script de python'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/enderecos_python'
TBLPROPERTIES ("skip.header.line.count"="1");