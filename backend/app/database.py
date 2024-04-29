import psycopg2

class CarMaintenanceService:

    def __init__(self):
        conn = psycopg2.connect(
            database="postgres",
            user="noodlenickels", password="welcome29I",
            host="127.0.0.1", port="5432")
        conn.autocommit = True
        cur = conn.cursor()
        cur.execute("""SELECT 1 FROM pg_catalog.pg_database WHERE datname = 'car_maintenance_service'""")
        exists = cur.fetchone()
        if not exists:
            cur.execute("CREATE DATABASE car_maintenance_service")
            conn.commit()
            print("Database 'car_maintenance_service' created")
        else:
            print("Database 'car_maintenance_service' already exists")
        conn.autocommit = False
        cur.close()
        conn.close()

        # self.conn = psycopg2.connect(
        #     database="car_maintenance_service",
        #     user="postgres",
        #     password="postgres",
        #     host="127.0.0.1", port="5433"
        # )

        self.conn = psycopg2.connect(database="postgres",
                                user="noodlenickels",
                                password="welcome29I",
                                host="127.0.0.1", port="5432")
        print("Database connected successfully")

        self.cursor = self.conn.cursor()
        print("postgres connected successfully")


    def close_connection(self):
        self.cursor.close()
        self.conn.close()


    def create_tabels(self):
        with open('backend\\app\sql_scripts\create.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            self.conn.commit()
        print('tables created successfully')

    def create_triggers(self):
        with open('backend\\app\sql_scripts\\triggers.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            self.conn.commit()
        print('triggers created successfully')


    def fill_tables(self):
        with open('backend\\app\sql_scripts\insert.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            self.conn.commit()
        print('values inserted successfully')

    def create_user_with_role(self, user):
        self.cursor.execute(f"""CREATE USER {user[2]} WITH PASSWORD '{user[3]}' """)
        self.conn.commit()
        if user[4]==1:
            self.cursor.execute(f"""GRANT administrators_role TO {user[2]}""")
            self.conn.commit()
        if user[4]==2:
            self.cursor.execute(f"""GRANT managers_role TO {user[2]}""")
            self.conn.commit()
        if user[4]==3:
            self.cursor.execute(f"""GRANT technicians_role TO {user[2]}""")
            self.conn.commit()


    def create_roles(self):
        with open('backend\\app\sql_scripts\\roles.sql', 'r') as f:
            script = f.read()
            self.cursor.execute(script)
            self.conn.commit()

        users = self.get_table_data('users')
        for user in users:
            self.create_user_with_role(user)
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
        script = f'''SELECT * FROM create_service({values[0]}, '{values[1]}', '{values[2]}', {values[3]})'''
        self.cursor.execute(script)
        self.conn.commit()
        return 'OK'

    def delete_service(self, id):
        script = f'''DELETE FROM services WHERE service_id={id}'''
        self.cursor.execute(script)
        self.conn.commit()
        return 'OK'

    def add_user(self, values):
        script = f'''BEGIN;
            INSERT INTO technicians VALUES ({values[0]}, '{' '.join(map(str, values[2].split('_')))}', '{values[2]}.example.com');
            insert into users values ({values[0]}, {values[1]}, '{values[2]}', '{values[3]}', {values[4]});
            COMMIT; '''
        self.cursor.execute(script)
        self.conn.commit()
        return 'OK'
    
    def add_relation(self, values):
        script = f'''INSERT INTO users_relations VALUES ({values[0]}, {values[1]}, {values[2]});'''
        self.cursor.execute(script)
        self.conn.commit()
        return 'OK'