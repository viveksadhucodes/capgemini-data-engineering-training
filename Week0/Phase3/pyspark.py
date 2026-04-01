from pyspark.sql import SparkSession
from pyspark.sql import functions as F
spark = SparkSession.builder.appName("practice").getOrCreate()

customers= [
    (1, "Ravi", "Hyderabad", 25),
    (2, "Sita", "Chennai", 32),
    (3, "Arun", "Hyderabad", 28),
    (4, "Meena", "Bengaluru", 35),
    (5, "Kiran", "Chennai", 22)
]

orders= [
    (101, 1, 2500, "2026-03-01"),
    (102, 2, 1800, "2026-03-02"),
    (103, 1, 3200, "2026-03-03"),
    (104, 3, 1500, "2026-03-04"),
    (105, 5, 2800, "2026-03-05")
]

customers = spark.createDataFrame(customers, ["customer_id", "name", "city", "age"])
orders = spark.createDataFrame(orders, ["order_id", "customer_id", "order_amount", "order_date"])
df_joined = customers.join(orders, "customer_id", "left")

res=customers.select("name") \
            .filter(customers.city == "Hyderabad")
res.show()

res2=orders.filter(orders.order_amount > 2000) \
         .groupBy("customer_id") \
         .agg(F.sum("order_amount").alias("total_spent"))
res2.show()

res3=orders.join(customers, "customer_id", "inner") \
         .select("order_id", "name", "order_amount")
res3.show()
