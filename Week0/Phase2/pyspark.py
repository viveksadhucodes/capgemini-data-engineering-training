#1. Total order amount for each customer
res1 = orders.groupBy("customer_id") \
             .agg(F.sum("order_amount").alias("total_order_amount"))
res1.show()

#2. Top 3 customers by total spend
top3 = res1.orderBy(F.col("total_order_amount").desc()).limit(3)
top3.show()

#3. Customers with no orders
no_orders = df_joined.filter(F.col("order_id").isNull()).select("name", "customer_id")
no_orders.show()

#4. City-wise total revenue
city_revenue = df_joined.groupBy("city") \
                         .agg(F.sum("order_amount").alias("city_total"))
city_revenue.show()

#5. Average order amount per customer
avg_order = orders.groupBy("customer_id") \
                  .agg(F.avg("order_amount").alias("avg_spend"))
avg_order.show()

#6. Customers with more than one order
frequent_customers = orders.groupBy("customer_id") \
                           .agg(F.count("order_id").alias("order_count")) \
                           .filter(F.col("order_count") > 1)
frequent_customers.show()

#7. Sort customers by total spend descending
sorted_spend = res1.sort(F.desc("total_order_amount"))
sorted_spend.show()
