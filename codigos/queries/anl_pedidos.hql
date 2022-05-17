INSERT INTO default.tbl_anl_pedidos
SELECT 
    pedidos.id_pedido,
    pedidos.id_cliente,
    pedidos.st_pedido,
    itens_pedidos.id_pedido_item,
    itens_pedidos.id_produto,
    itens_pedidos.id_vendedor,
    itens_pedidos.ds_preco,
    itens_pedidos.ds_frete,
    pagamentos_pedidos.nu_metodo_pagamento,
    pagamentos_pedidos.tp_pagamento,
    pagamentos_pedidos.nu_parcelas,
    pagamentos_pedidos.vl_pagamento,
    pedidos.dt_pedido_feito,
    pedidos.dt_pedido_aprovado,
    itens_pedidos.dt_envio_limite,
    pedidos.dt_entrega_fornecedor,
    pedidos.dt_entrega_cliente,
    pedidos.dt_entrega_estimada,
    reviews_pedidos.nu_nota_avaliacao,
    reviews_pedidos.ds_titulo_avaliacao,
    reviews_pedidos.ds_mensagem_avaliacao,
    reviews_pedidos.dt_envio_avaliacao,
    reviews_pedidos.dt_resposta_avaliacao
FROM 
    raw.tbl_orders pedidos
LEFT JOIN
    raw.tbl_order_items itens_pedidos
ON
    pedidos.id_pedido = itens_pedidos.id_pedido
LEFT JOIN
    raw.tbl_order_payments pagamentos_pedidos
ON
    pedidos.id_pedido = pagamentos_pedidos.id_pedido
LEFT JOIN
    raw.tbl_order_reviews reviews_pedidos
ON
    pedidos.id_pedido = reviews_pedidos.id_pedido