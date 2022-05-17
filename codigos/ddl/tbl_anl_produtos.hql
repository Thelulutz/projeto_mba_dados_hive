CREATE TABLE default.tbl_anl_produtos (
    id_produto                      STRING COMMENT 'Id do produto',
    ds_categoria_produto            STRING COMMENT 'Nome da categoria do produto',
    ds_categoria_produto_ingles     STRING COMMENT 'Nome da categoria do produto em ingles',
    qt_tamanho_nome                 STRING COMMENT 'Qtde de caracteres do nome do produto',
    qt_descricao_produto            STRING COMMENT 'Qtde de caracteres da descricao do produto',
    qt_fotos_produtos               STRING COMMENT 'Numero de fotos do produto',
    nu_peso_produto                 STRING COMMENT 'Peso em gramas do produto',
    nu_comprimento_produto          STRING COMMENT 'Comprimento em centimetros do produto',
    nu_altura_produto               STRING COMMENT 'Altura em centimetros do produto',
    nu_largura_produto              STRING COMMENT 'Largura em centimetros do produto'
)
COMMENT 'Tabela analitica de produtos'
STORED AS AVRO;