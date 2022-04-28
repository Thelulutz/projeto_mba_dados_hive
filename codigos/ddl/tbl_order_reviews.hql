CREATE EXTERNAL TABLE raw.tbl_order_reviews (
    id_avaliacao            STRING COMMENT 'Id da avaliacao',
    id_pedido               STRING COMMENT 'Id do pedido',
    nu_nota_avaliacao       STRING COMMENT 'Nota de 1 a 5',
    ds_titulo_avaliacao     STRING COMMENT 'Titulo da avaliacao feita pelo cliente',
    ds_mensagem_avaliacao   STRING COMMENT 'Texto da avaliacao feita pelo cliente',
    dt_envio_avaliacao      STRING COMMENT 'Data de envio da avaliacao para o cliente',
    dt_resposta_avaliacao   STRING COMMENT 'Data de resposta da avaliacao feita pelo cliente'
)
COMMENT 'Tabela raw de avaliacoes dos pedidos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/order_reviews'
TBLPROPERTIES ("skip.header.line.count"="1");