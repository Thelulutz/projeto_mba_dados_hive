CREATE EXTERNAL TABLE raw.tbl_orders (
    id_pedido               STRING COMMENT 'Id do pedido',
    id_cliente              STRING COMMENT 'Id do cliente',
    st_pedido               STRING COMMENT 'Status do pedido',
    dt_pedido_feito         STRING COMMENT 'Data de compra do produto',
    dt_pedido_aprovado      STRING COMMENT 'Data de aprovacao da compra do produto',
    dt_entrega_fornecedor   STRING COMMENT 'Data de entrega do produto ao fornecedor',
    dt_entrega_cliente      STRING COMMENT 'Data de entrega do produto ao cliente',
    dt_entrega_estimada     STRING COMMENT 'Data de entrega estimada do produto ao cliente'
)
COMMENT 'Tabela raw de pedidos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/orders'
TBLPROPERTIES ("skip.header.line.count"="1");