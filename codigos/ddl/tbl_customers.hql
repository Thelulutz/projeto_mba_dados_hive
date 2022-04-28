CREATE EXTERNAL TABLE raw.tbl_customers (
    id_pedido       STRING COMMENT 'Chave para a tabela orders',
    id_cliente      STRING COMMENT 'Chave unica do cliente',
    nu_prefixo_cep  STRING COMMENT 'Primeiros cinco digitos do CEP do cliente',
    ds_cidade       STRING COMMENT 'Cidade que mora o cliente',
    ds_estado       STRING COMMENT 'Estado que mora o cliente'  
)
COMMENT 'Tabela raw de clientes'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/customers'
TBLPROPERTIES ("skip.header.line.count"="1");