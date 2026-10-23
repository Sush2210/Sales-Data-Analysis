
import sqlite3

# Create a database file
conn = sqlite3.connect("sales.db")

# Create a sample Sales table
conn.execute("""
CREATE TABLE IF NOT EXISTS Sales (
    Product TEXT,
    Category TEXT,
    Quantity INTEGER,
    Price REAL
)
""")

# Add sample data only if the table is empty
count = conn.execute("SELECT COUNT(*) FROM Sales").fetchone()[0]

if count == 0:
    conn.executemany(
        "INSERT INTO Sales VALUES (?, ?, ?, ?)",
        [
            ("Laptop", "Electronics", 2, 25000),
            ("Mobile", "Electronics", 3, 10000),
            ("Chair", "Furniture", 5, 2000),
            ("Table", "Furniture", 2, 5000)
        ]
    )

# Run SQL query
query = """
SELECT Product,
       SUM(Quantity * Price) AS Revenue
FROM Sales
GROUP BY Product
ORDER BY Revenue DESC
"""

results = conn.execute(query).fetchall()

print("Product-wise Sales Revenue")
print("---------------------------")

for product, revenue in results:
    print(f"{product}: Rs. {revenue:,.2f}")

conn.close()
