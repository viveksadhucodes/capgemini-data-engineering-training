from pyspark.sql import SparkSession
from pyspark.sql.functions import when
from pyspark.sql.functions import sum,count
spark = SparkSession.builder.appName("practice").getOrCreate()

customers_data = [
    (1, "Ravi", "Hyderabad", 25),
    (2, "Sita", "Chennai", 32),
    (3, "Arun", "Hyderabad", 28),
    (4, "Meena", "Bengaluru", 35),
    (5, "Kiran", "Chennai", 22)
]

orders_data = [
    (101, 1, 2500, "2026-03-01"),
    (102, 2, 1800, "2026-03-02"),
    (103, 1, 3200, "2026-03-03"),
    (104, 3, 1500, "2026-03-04"),
    (105, 5, 2800, "2026-03-05")
]

customers = spark.createDataFrame(customers_data, ["customer_id","customer_name","city","age"])
orders = spark.createDataFrame(orders_data, ["order_id","customer_id","amount","order_date"])


# TOTAL SALES IN A PARTICULAR DATE 
daily_sales=orders.groupBy("order_date").agg(sum("amount").alias("total_sales"))
daily_sales.show()


#City and Total Revenue
c_orders=customers.join(orders,"customer_id")
citywise_revenue=c_orders.groupBy("city").agg(sum("amount").alias("total_revenue"))
citywise_revenue.show()


#top 5 customers
c_orders=customers.join(orders,"customer_id")
top5=c_orders.groupBy("customer_name").agg(sum("amount").alias("total_spend"))
top5.show()


# repeat customers
repeat_customers = c_orders.groupBy("customer_id", "customer_name") \
    .agg(count("order_id").alias("order_count")) \
    .filter("order_count > 1")

repeat_customers.show()


# 1. Calculate total spend per customer
customer_spend = c_orders.groupBy("customer_name").agg(sum("amount").alias("total_spend"))

# 2. Apply the Business Logic (Segmentation)
segmented_customers = customer_spend.withColumn(
    "segment",
    when(customer_spend.total_spend > 10000, "Gold")
    .when((customer_spend.total_spend >= 5000) & (customer_spend.total_spend <= 10000), "Silver")
    .otherwise("Bronze")
)

# 3. Final Output
segmented_customers.select("customer_name", "total_spend", "segment").show()

# 1. Join and Aggregate both Total Spend and Order Count
final_stats = c_orders.groupBy("customer_name", "city").agg(
    sum("amount").alias("total_spend"),
    count("order_id").alias("order_count")
)

# 2. Apply Segmentation Logic
final_df = final_stats.withColumn(
    "segment",
    when(final_stats.total_spend > 10000, "Gold")
    .when((final_stats.total_spend >= 5000) & (final_stats.total_spend <= 10000), "Silver")
    .otherwise("Bronze")
)

# 3. Output the specific columns requested
final_df.select("customer_name", "city", "total_spend", "order_count", "segment").show()


