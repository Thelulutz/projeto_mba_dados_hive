CREATE EXTERNAL TABLE raw.tbl_order_payments (
    id_pedido               STRING COMMENT 'Id do pedido',
    nu_metodo_pagamento     STRING COMMENT 'Numero sequencial que indica o numero de metodos de pagamento do pedido',
    tp_pagamento            STRING COMMENT 'Metodo de pagamento',
    nu_parcelas             STRING COMMENT 'Numero de parcelas do pagamento',
    vl_pagamento            STRING COMMENT 'Valor do pagamento'
)
COMMENT 'Tabela raw de pagamentos dos pedidos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/order_payments'
TBLPROPERTIES ("skip.header.line.count"="1");