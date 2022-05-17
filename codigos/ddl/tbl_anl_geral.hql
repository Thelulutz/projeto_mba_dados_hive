CREATE TABLE default.tbl_anl_geral (
    id_pedido                   STRING COMMENT 'Id do pedido',
    id_cliente                  STRING COMMENT 'Id do cliente',
    id_produto                  STRING COMMENT 'Id do produto',
    id_vendedor                 STRING COMMENT 'Id do vendedor',
    ds_ano_pedido_feito         STRING COMMENT 'Ano de compra do produto',
    ds_mes_pedido_feito         STRING COMMENT 'Mes de compra do produto',
    ds_dia_pedido_feito         STRING COMMENT 'Dia de compra do produto',
    ds_periodo_pedido_feito     STRING COMMENT 'Periodo de compra do produto',
    ds_estado_cliente           STRING COMMENT 'Estado que mora o cliente',
    ds_cidade_cliente           STRING COMMENT 'Cidade que mora o cliente',
    ds_bairro_cliente           STRING COMMENT 'Bairro do cliente',
    ds_logradouro_cliente       STRING COMMENT 'Logradouro do cliente',
    ds_categoria_produto        STRING COMMENT 'Nome da categoria do produto',
    ds_preco                    STRING COMMENT 'Preco do produto',
    tp_pagamento                STRING COMMENT 'Metodo de pagamento',
    vl_pagamento                STRING COMMENT 'Valor do pagamento',
    nu_nota_avaliacao           STRING COMMENT 'Nota de 1 a 5',
    dt_envio_avaliacao          STRING COMMENT 'Data de envio da avaliacao para o cliente',
    dt_resposta_avaliacao       STRING COMMENT 'Data de resposta da avaliacao feita pelo cliente'
)
COMMENT 'Tabela analitica geral'
STORED AS AVRO;