# Criacao dos diretorios que armazenam os arquivos csv
hdfs dfs -mkdir /user/hive/warehouse/raw.db/customers
hdfs dfs -mkdir /user/hive/warehouse/raw.db/geolocations
hdfs dfs -mkdir /user/hive/warehouse/raw.db/order_items
hdfs dfs -mkdir /user/hive/warehouse/raw.db/order_payments
hdfs dfs -mkdir /user/hive/warehouse/raw.db/order_reviews
hdfs dfs -mkdir /user/hive/warehouse/raw.db/orders
hdfs dfs -mkdir /user/hive/warehouse/raw.db/product_category
hdfs dfs -mkdir /user/hive/warehouse/raw.db/products
hdfs dfs -mkdir /user/hive/warehouse/raw.db/sellers

# Comandos para alterar a permissao dos diretorios
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/customers
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/geolocations
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/order_items
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/order_payments
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/order_reviews
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/orders
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/product_category
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/products
hdfs dfs -chmod 775 /user/hive/warehouse/raw.db/sellers