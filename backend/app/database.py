import psycopg2

class CarMaintenanceService:

    def __init__(self):
        # self.conn = psycopg2.connect(database="CarMaintenanceService",
        #                         user="postgres",
        #                         password="postgres"
        #                         host="127.0.0.1", port="5433")
        
        self.conn = psycopg2.connect(database="postgres",
                                user="noodlenickels",
                                password="welcome29I",
                                host="127.0.0.1", port="5432")
        print("Database connected successfully")

        self.cursor = self.conn.cursor()
        print("postgres connected successfully")
        # self.cursor.execute('''
        #     SELECT 'CREATE DATABASE Car_Maintenance_Service'
        #     WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '<Car_Maintenance_Service>')\gexec
        # ''')


    def open_connection(self):
        self.conn = psycopg2.connect(database="postgres",
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
        with open('backend\\app\sql_scripts\insert.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
        print('values inserted successfully')


    def create_roles(self):
        with open('backend\\app\sql_scripts\\roles.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
        print('roles created successfully')
        

    def get_table_data(self, table_name):
        self.cursor.execute(f'select * from {table_name}')
        data = self.cursor.fetchall()
        return data
    

    def get_dashboard_data(self, script):
        self.cursor.execute(script)
        data = self.cursor.fetchall()
        return data
    
    def add_service(self, values):
        #len = int(self.cursor.execute('''select count(*) from services''')[0][0])
        script = f'''INSERT INTO services VALUES ({values[0]}, '{values[1]}', '{values[2]}', {values[3]})'''
        self.cursor.execute(script)
        return 'OK'

    def delete_service(self, id):
        script = f'''DELETE FROM services WHERE service_id={id}'''
        self.cursor.execute(script)
        return 'OK'

    def add_user(self, values):
        script = f'''BEGIN;
            INSERT INTO technicians VALUES ({values[0]}, '{' '.join(map(str, values[2].split('_')))}', '{values[2]}.example.com');
            insert into users values ({values[0]}, {values[1]}, '{values[2]}', '{values[3]}', {values[4]});
            COMMIT; '''
        self.cursor.execute(script)
        return 'OK'