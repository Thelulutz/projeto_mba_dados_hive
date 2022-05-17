CREATE TABLE default.tbl_anl_clientes (
    id_pedido       STRING COMMENT 'Chave para a tabela orders',
    id_cliente      STRING COMMENT 'Chave unica do cliente',
    ds_estado       STRING COMMENT 'Estado que mora o cliente',
    ds_cidade       STRING COMMENT 'Cidade que mora o cliente',
    ds_bairro       STRING COMMENT 'Bairro do local',
    ds_logradouro   STRING COMMENT 'Logradouro do local',
    nu_prefixo_cep  STRING COMMENT 'Primeiros cinco digitos do CEP do cliente',
    ds_latitude     STRING COMMENT 'Latitude do local',
    ds_longitude    STRING COMMENT 'Longitude do local'
)
COMMENT 'Tabela analitica de clientes'
STORED AS AVRO;