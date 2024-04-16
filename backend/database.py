import pyodbc

class CarMaintenanceService:
    def __init__(self):
        self.conn = pyodbc.connect(
            'DRIVER={SQL Server};SERVER=YourServerName;DATABASE=YourDatabaseName;UID=YourUsername;PWD=YourPassword'
        )
        self.cursor = self.conn.cursor()

    def get_total_revenue_per_month(self):
        query = """
            SELECT
                YEAR(Date) AS Year,
                MONTH(Date) AS Month,
                SUM(TotalCost) AS TotalRevenue
            FROM
                Invoices
            GROUP BY
                YEAR(Date),
                MONTH(Date)
            ORDER BY
                YEAR(Date),
                MONTH(Date);
        """
        self.cursor.execute(query)
        rows = self.cursor.fetchall()
        data = [{'year': row.Year, 'month': row.Month, 'total_revenue': row.TotalRevenue} for row in rows]
        return data

    

    def close_connection(self):
        self.cursor.close()
        self.conn.close()
