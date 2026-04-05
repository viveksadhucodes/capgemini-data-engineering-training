from pyspark.sql import SparkSession
from pyspark.sql.functions import when, sum, count

# Initialize Spark
spark = SparkSession.builder.appName("practice").getOrCreate()

# 1. Create Data (Using 'amount' column as per your screenshot)
customers_data = [
    (1, "Ravi", "Hyderabad", 25),
    (2, "Sita", "Chennai", 32),
    (3, "Arun", "Hyderabad", 28),
    (4, "Meena", "Bengaluru", 35),
    (5, "Kiran", "Chennai", 22)
]

orders_data = [
    (101, 1, 12000, "2026-03-01"),
    (102, 2, 7500, "2026-03-02"),
    (103, 1, 3200, "2026-03-03"),
    (104, 3, 1500, "2026-03-04"),
    (105, 5, 2800, "2026-03-05")
]

customers = spark.createDataFrame(customers_data, ["customer_id", "customer_name", "city", "age"])
orders = spark.createDataFrame(orders_data, ["order_id", "customer_id", "amount", "order_date"])

# 2. Fixed Bucketing Logic

df_segmented = orders.withColumn(
    "segment",
    when(orders.amount > 10000, "Gold")
    .when((orders.amount >= 5000) & (orders.amount <= 10000), "Silver")
    .otherwise("Bronze")
)

# 3. Show Results
df_segmented.show()

# Task 2: Group data by segment and count customers
segment_counts = df_segmented.groupBy("segment").count()

# Show the summary table
segment_counts.show()

# Task 3: Quantile-based Segmentation

# 1. Calculate the thresholds for 3 equal groups (33% and 66%)
# The '0' at the end is the relative error (0 = exact calculation)
thresholds = orders.stat.approxQuantile("amount", [0.33, 0.66], 0)

print(f"Calculated Thresholds: {thresholds}")

# 2. Apply segments based on these dynamic thresholds
df_quantiles = orders.withColumn(
    "quantile_segment",
    when(orders.amount <= thresholds[0], "Bottom Tier")
    .when(orders.amount <= thresholds[1], "Middle Tier")
    .otherwise("Top Tier")
)

df_quantiles.select("customer_id", "amount", "quantile_segment").show()
