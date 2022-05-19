-- Segmentar clientes por localizacao
SELECT 
    ds_estado_cliente,
    ds_cidade_cliente,
    ds_bairro_cliente,
    count(distinct id_cliente) AS qt_clientes
FROM
    default.tbl_anl_geral
GROUP BY
    ds_estado_cliente,
    ds_cidade_cliente,
    ds_bairro_cliente
ORDER BY
    ds_estado_cliente,
    ds_cidade_cliente,
    ds_bairro_cliente;


-- Total de pedidos por periodo e categoria
SELECT
    ds_categoria_produto,
    ds_periodo_pedido_feito,
    count(id_pedido) AS qt_pedidos
FROM
    default.tbl_anl_geral
GROUP BY
    ds_categoria_produto,
    ds_periodo_pedido_feito
ORDER BY
    ds_categoria_produto,
    ds_periodo_pedido_feito;


-- Total de pagamentos por metodo de pagamento
SELECT
    tp_pagamento,
    count(id_pedido) AS qt_pagamento,
    sum(cast(vl_pagamento as DOUBLE)) AS soma_pagamento
FROM 
    default.tbl_anl_geral
GROUP BY
    tp_pagamento
ORDER BY
    tp_pagamento;


-- Notas das avaliacoes
SELECT
    nu_nota_avaliacao,
    count(id_pedido) qt_avaliacoes
FROM
    default.tbl_anl_geral
GROUP BY
    nu_nota_avaliacao
ORDER BY 
    nu_nota_avaliacao;


-- Vendedores x vendas
WITH media_geral AS (
    SELECT
        count(distinct id_vendedor) AS qt_vendedores,
        count(id_pedido) AS qt_vendas
    FROM 
        default.tbl_anl_geral
)

SELECT
    'media' AS id_vendedor,
    qt_vendas/qt_vendedores AS qt_vendas
FROM
    media_geral
UNION ALL
SELECT
    id_vendedor,
    count(id_pedido) AS qt_vendas
FROM 
    default.tbl_anl_geral
GROUP BY
    id_vendedor
ORDER BY
    id_vendedor;


-- Produtos mais vendidos
WITH produtos_vendidos AS (
    SELECT
        id_produto,
        count(id_pedido) AS qt_vendida
    FROM
        default.tbl_anl_geral
    GROUP BY
        id_produto
)

SELECT
    id_produto,
    qt_vendida
FROM
    produtos_vendidos
ORDER BY
    qt_vendida DESC;