from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Initialize Spark
spark = SparkSession.builder.appName("DataCleaningChallenge").getOrCreate()

# Create initial messy dataset
data = [
    (1, "Ravi", "Hyderabad", 25),
    (2, None, "Chennai", 32),
    (None, "Arun", "Hyderabad", 28),
    (4, "Meena", None, 30),
    (4, "Meena", None, 30),
    (5, "John", "Bangalore", -5)
]
columns = ["customer_id", "name", "city", "age"]
df = spark.createDataFrame(data, columns)

# --- CLEANING PROCESS ---

# 1. Remove rows with null keys (customer_id)
df_no_null_id = df.filter(col("customer_id").isNotNull())

# 2. Remove duplicates
df_no_duplicates = df_no_null_id.dropDuplicates()

# 3. Handle missing values (Fill missing city with 'Unknown' and missing name with 'Guest')
df_filled = df_no_duplicates.fillna({"city": "Unknown", "name": "Guest"})

# 4. Filter invalid age (age must be > 0)
df_cleaned = df_filled.filter(col("age") > 0)

# --- VALIDATION ---
print(f"Initial row count: {df.count()}")
print(f"Cleaned row count: {df_cleaned.count()}")
df_cleaned.show()

# --- AGGREGATION ---
df_cleaned.groupBy("city").count().show()
