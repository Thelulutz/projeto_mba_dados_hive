# Comandos para subir os arquivos para o HDFS
hdfs dfs -put /tmp/olist_customers_dataset.csv /user/hive/warehouse/raw.db/customers
hdfs dfs -put /tmp/olist_geolocation_dataset.csv /user/hive/warehouse/raw.db/geolocations
hdfs dfs -put /tmp/olist_order_items_dataset.csv /user/hive/warehouse/raw.db/order_items
hdfs dfs -put /tmp/olist_order_payments_dataset.csv /user/hive/warehouse/raw.db/order_payments
hdfs dfs -put /tmp/olist_order_reviews_dataset.csv /user/hive/warehouse/raw.db/order_reviews
hdfs dfs -put /tmp/olist_orders_dataset.csv /user/hive/warehouse/raw.db/orders
hdfs dfs -put /tmp/product_category_name_translation.csv /user/hive/warehouse/raw.db/product_category
hdfs dfs -put /tmp/olist_products_dataset.csv /user/hive/warehouse/raw.db/products
hdfs dfs -put /tmp/olist_sellers_dataset.csv /user/hive/warehouse/raw.db/sellers