CREATE EXTERNAL TABLE raw.tbl_order_items (
    id_pedido           STRING COMMENT 'Id do pedido',
    id_pedido_item      STRING COMMENT 'Numero sequencial que indica o numero de itens num pedido',
    id_produto          STRING COMMENT 'Id do produto',
    id_vendedor         STRING COMMENT 'Id do vendedor',
    dt_envio_limite     STRING COMMENT 'Data de envio limite para o cliente',
    ds_preco            STRING COMMENT 'Preco do produto',
    ds_frete            STRING COMMENT 'Frete do produto'
)
COMMENT 'Tabela raw de itens do pedido'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/order_items'
TBLPROPERTIES ("skip.header.line.count"="1");