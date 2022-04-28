CREATE EXTERNAL TABLE raw.tbl_geolocations (
    nu_prefixo_cep      STRING COMMENT 'Primeiros cinco digitos do CEP do local',
    ds_latitude         STRING COMMENT 'Latitude do local',
    ds_longitude        STRING COMMENT 'Longitude do local',
    ds_cidade           STRING COMMENT 'Cidade do local',
    ds_estado           STRING COMMENT 'Estado do local'
)
COMMENT 'Tabela raw de geolocalizacao'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/geolocations'
TBLPROPERTIES ("skip.header.line.count"="1");