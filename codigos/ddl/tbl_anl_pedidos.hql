CREATE TABLE default.tbl_anl_pedidos (
    id_pedido               STRING COMMENT 'Id do pedido',
    id_cliente              STRING COMMENT 'Id do cliente',
    st_pedido               STRING COMMENT 'Status do pedido',
    id_pedido_item          STRING COMMENT 'Numero sequencial que indica o numero de itens num pedido',
    id_produto              STRING COMMENT 'Id do produto',
    id_vendedor             STRING COMMENT 'Id do vendedor',
    ds_preco                STRING COMMENT 'Preco do produto',
    ds_frete                STRING COMMENT 'Frete do produto',
    nu_metodo_pagamento     STRING COMMENT 'Numero sequencial que indica o numero de metodos de pagamento do pedido',
    tp_pagamento            STRING COMMENT 'Metodo de pagamento',
    nu_parcelas             STRING COMMENT 'Numero de parcelas do pagamento',
    vl_pagamento            STRING COMMENT 'Valor do pagamento',
    dt_pedido_feito         STRING COMMENT 'Data de compra do produto',
    dt_pedido_aprovado      STRING COMMENT 'Data de aprovacao da compra do produto',
    dt_envio_limite         STRING COMMENT 'Data de envio limite para o cliente',
    dt_entrega_fornecedor   STRING COMMENT 'Data de entrega do produto ao fornecedor',
    dt_entrega_cliente      STRING COMMENT 'Data de entrega do produto ao cliente',
    dt_entrega_estimada     STRING COMMENT 'Data de entrega estimada do produto ao cliente',
    nu_nota_avaliacao       STRING COMMENT 'Nota de 1 a 5',
    ds_titulo_avaliacao     STRING COMMENT 'Titulo da avaliacao feita pelo cliente',
    ds_mensagem_avaliacao   STRING COMMENT 'Texto da avaliacao feita pelo cliente',
    dt_envio_avaliacao      STRING COMMENT 'Data de envio da avaliacao para o cliente',
    dt_resposta_avaliacao   STRING COMMENT 'Data de resposta da avaliacao feita pelo cliente'
)
COMMENT 'Tabela analitica de pedidos'
STORED AS AVRO;