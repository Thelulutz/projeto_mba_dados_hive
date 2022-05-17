WITH enderecos AS (
    SELECT
        split(endereco.ds_bairro_logradouro, ' // ')[0] AS bairro,
        split(endereco.ds_bairro_logradouro, ' // ')[1] AS logradouro,
        endereco.ds_latitude,
        endereco.ds_longitude,
        CASE WHEN length(endereco.nu_prefixo_cep) = 4 THEN concat('0', endereco.nu_prefixo_cep)
        ELSE endereco.nu_prefixo_cep END AS nu_cep
    FROM
        raw.tbl_lista_enderecos_python AS endereco
)

INSERT INTO default.tbl_anl_clientes
SELECT DISTINCT
    clientes.id_pedido,
    clientes.id_cliente,
    clientes.ds_estado,
    clientes.ds_cidade,
    enderecos.bairro,
    enderecos.logradouro,
    clientes.nu_prefixo_cep,
    enderecos.ds_latitude,
    enderecos.ds_longitude
FROM 
    raw.tbl_customers AS clientes
LEFT JOIN
    enderecos
ON 
    clientes.nu_prefixo_cep = enderecos.nu_cep;