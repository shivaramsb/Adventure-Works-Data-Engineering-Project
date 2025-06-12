CREATE DATABASE SCOPED CREDENTIAL cred_shivaram
WITH IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
with 
(
    LOCATION = 'https://strorageaccaw.blob.core.windows.net/silver',
    CREDENTIAL = cred_shivaram 
)

CREATE EXTERNAL DATA SOURCE source_gold
with 
(
    LOCATION = 'https://strorageaccaw.blob.core.windows.net/gold',
    CREDENTIAL = cred_shivaram 
)

-- EXTERNAL FILE FORMAT

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


--CREATE EXTERNAL TABLE 

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS 
SELECT * FROM gold.sales


SELECT * FROM gold.extsales





