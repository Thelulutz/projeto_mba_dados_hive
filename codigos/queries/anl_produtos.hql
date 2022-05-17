INSERT INTO default.tbl_anl_produtos
SELECT
    produtos.id_produto,
    produtos.ds_categoria_produto,
    categorias_produtos.ds_nome_categoria_en,
    produtos.qt_tamanho_nome,
    produtos.qt_descricao_produto,
    produtos.qt_fotos_produtos,
    produtos.nu_peso_produto,
    produtos.nu_comprimento_produto,
    produtos.nu_altura_produto,
    produtos.nu_largura_produto
FROM
    raw.tbl_products produtos
LEFT JOIN
    raw.tbl_product_category categorias_produtos
ON
    produtos.ds_categoria_produto = categorias_produtos.ds_nome_categoria_pt