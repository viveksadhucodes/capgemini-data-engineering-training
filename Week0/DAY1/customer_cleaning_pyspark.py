import os
import sys
from pathlib import Path

from pyspark.sql import SparkSession
from pyspark.sql.functions import coalesce, col, initcap, lower, to_date, trim, upper, when


SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_INPUT_PATH = SCRIPT_DIR / "C1.csv"
DEFAULT_OUTPUT_PATH = SCRIPT_DIR / "cleaned_output"


def clean_text_column(column_name):
    value = trim(col(column_name))
    return when(
        value.isNull() | lower(value).isin("", "blank", "null", "none", "na", "n/a"),
        None,
    ).otherwise(value)


if len(sys.argv) == 3:
    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])
else:
    input_path = DEFAULT_INPUT_PATH
    output_path = DEFAULT_OUTPUT_PATH

os.environ.setdefault("SPARK_LOCAL_IP", "127.0.0.1")
os.environ.setdefault("PYSPARK_PYTHON", sys.executable)

spark = (
    SparkSession.builder.master("local[*]")
    .appName("CSVDataCleaning")
    .config("spark.driver.host", "127.0.0.1")
    .config("spark.driver.bindAddress", "127.0.0.1")
    .getOrCreate()
)

df = spark.read.option("header", True).csv(str(input_path))

for column_name in df.columns:
    df = df.withColumn(column_name, clean_text_column(column_name))

cleaned_df = (
    df.withColumn("CustomerID", col("CustomerID").cast("int"))
    .withColumn("Sales", col("Sales").cast("double"))
    .withColumn("Name", initcap(col("Name")))
    .withColumn(
        "Country",
        when(lower(col("Country")) == "india", "India")
        .when(lower(col("Country")) == "usa", "USA")
        .when(lower(col("Country")) == "uk", "UK")
        .when(lower(col("Country")) == "new york", "USA")
        .otherwise(initcap(col("Country"))),
    )
    .withColumn(
        "Category",
        when(upper(col("Category")).isin("A", "B", "C"), upper(col("Category"))).otherwise("Unknown"),
    )
    .withColumn(
        "JoinDate",
        coalesce(
            to_date(col("JoinDate"), "dd-MM-yyyy"),
            to_date(col("JoinDate"), "MM-dd-yyyy"),
        ),
    )
)

cleaned_df = cleaned_df.fillna(
    {
        "Name": "Unknown",
        "Country": "Unknown",
        "Category": "Unknown",
        "Sales": 0.0,
    }
)

cleaned_df = cleaned_df.na.drop(subset=["CustomerID", "JoinDate"])
cleaned_df = cleaned_df.dropDuplicates(["Name", "Country", "JoinDate", "Sales", "Category"])

cleaned_df.show(truncate=False)
cleaned_df.write.mode("overwrite").option("header", True).csv(str(output_path))

spark.stop()
