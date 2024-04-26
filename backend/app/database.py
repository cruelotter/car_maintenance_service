import psycopg2

class CarMaintenanceService:

    def __init__(self):
        self.conn = psycopg2.connect(database="CarMaintenanceService",
                                user="postgres",
                                password="postgres",
                                host="127.0.0.1", port="5433")
        print("postgres connected successfully")
        self.cursor = self.conn.cursor()


    def open_connection(self):
        self.conn = psycopg2.connect(database="CarMaintenanceService",
                                user="postgres",
                                password="postgres",
                                host="127.0.0.1", port="5433")
        # uncomment your credentials

        # conn = psycopg2.connect(database="postgres",
        #                         user="noodlenickels",
        #                         password="welcome29I",
        #                         host="127.0.0.1", port="5432")
        # print("Database connected successfully")

        print("postgres reconnected successfully")
        self.cursor = self.conn.cursor()


    def close_connection(self):
        self.cursor.close()
        self.conn.close()


    def create_tabels(self):
        with open('app\sql_scripts\create.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            print('tables created successfully')


    def fill_tables(self):
        with open('app\sql_scripts\insert.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            print('values inserted successfully')

    def create_roles(self):
        with open('app\sql_scripts\roles.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            print('roles created successfully')
        self.cursor.


    def get_table_data(self, table_name):
        self.cursor.execute(f'select * from {table_name}')
        data = self.cursor.fetchall()
        print(data)
        return data
    
    def get_dashboard_data(self, script):
        self.cursor.execute(script)
        data = self.cursor.fetchall()
        return data
    

    # def get_total_revenue_per_month(self):
    #     query = """
    #         SELECT
    #             YEAR(Date) AS Year,
    #             MONTH(Date) AS Month,
    #             SUM(TotalCost) AS TotalRevenue
    #         FROM
    #             Invoices
    #         GROUP BY
    #             YEAR(Date),
    #             MONTH(Date)
    #         ORDER BY
    #             YEAR(Date),
    #             MONTH(Date);
    #     """
    #     self.cursor.execute(query)
    #     rows = self.cursor.fetchall()
    #     data = [{'year': row.Year, 'month': row.Month, 'total_revenue': row.TotalRevenue} for row in rows]
    #     return data


