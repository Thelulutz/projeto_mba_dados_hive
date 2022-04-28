CREATE EXTERNAL TABLE raw.tbl_products (
    id_produto              STRING COMMENT 'Id do produto',
    ds_categoria_produto    STRING COMMENT 'Nome da categoria do produto',
    qt_tamanho_nome         STRING COMMENT 'Qtde de caracteres do nome do produto',
    qt_descricao_produto    STRING COMMENT 'Qtde de caracteres da descricao do produto',
    qt_fotos_produtos       STRING COMMENT 'Numero de fotos do produto',
    nu_peso_produto         STRING COMMENT 'Peso em gramas do produto',
    nu_comprimento_produto  STRING COMMENT 'Comprimento em centimetros do produto',
    nu_altura_produto       STRING COMMENT 'Altura em centimetros do produto',
    nu_largura_produto      STRING COMMENT 'Largura em centimetros do produto'
)
COMMENT 'Tabela raw de produtos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/raw.db/products'
TBLPROPERTIES ("skip.header.line.count"="1");