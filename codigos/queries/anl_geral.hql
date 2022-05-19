WITH clientes AS (
    SELECT
        id_pedido,
        ds_bairro AS bairro_cliente,
        ds_cidade AS cidade_cliente,
        ds_estado AS estado_cliente,
        ds_logradouro AS logradouro_cliente
    FROM
        default.tbl_anl_clientes
),
pedidos AS (
    SELECT
        id_pedido,
        substr(dt_pedido_feito, 1, 4) AS ano_pedido,
        substr(dt_pedido_feito, 6, 2) AS mes_pedido,
        substr(dt_pedido_feito, 9, 2) AS dia_pedido,
        CASE WHEN substr(dt_pedido_feito, 12, 2) BETWEEN '00' AND '05' THEN 'Madrugada'
        WHEN substr(dt_pedido_feito, 12, 2) BETWEEN '06' AND '11' THEN 'Manha'
        WHEN substr(dt_pedido_feito, 12, 2) BETWEEN '12' AND '17' THEN 'Tarde'
        WHEN substr(dt_pedido_feito, 12, 2) BETWEEN '18' AND '23' THEN 'Noite'
        ELSE 'N/I' END AS periodo_pedido,
        ds_preco,
        tp_pagamento,
        vl_pagamento,
        nu_nota_avaliacao,
        substr(dt_envio_avaliacao, 1, 10) as dt_avaliacao,
        substr(dt_resposta_avaliacao, 1, 10) as dt_resposta,
        id_vendedor,
        id_cliente,
        id_produto
    FROM
        default.tbl_anl_pedidos
),
produtos AS (
    SELECT
        id_produto,
        ds_categoria_produto
    FROM
        default.tbl_anl_produtos
)

INSERT INTO default.tbl_anl_geral
SELECT 
    pedidos.id_pedido,
    pedidos.id_cliente,
    pedidos.id_produto,
    pedidos.id_vendedor,
    pedidos.ano_pedido,
    pedidos.mes_pedido,
    pedidos.dia_pedido,
    pedidos.periodo_pedido,
    clientes.estado_cliente,
    clientes.cidade_cliente,
    clientes.bairro_cliente,
    clientes.logradouro_cliente,
    produtos.ds_categoria_produto,
    pedidos.ds_preco,
    pedidos.tp_pagamento,
    pedidos.vl_pagamento,
    pedidos.nu_nota_avaliacao,
    pedidos.dt_avaliacao,
    pedidos.dt_resposta
FROM
    pedidos
LEFT JOIN
    clientes
ON
    pedidos.id_pedido = clientes.id_cliente
LEFT JOIN
    produtos
ON
    pedidos.id_produto = produtos.id_produto