import pyodbc

def create_database(server, database, username, password):
    # Connect to the master database to create a new database
    conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};UID={username};PWD={password}')
    cursor = conn.cursor()

    # Create the new database
    cursor.execute(f'CREATE DATABASE {database}')

    cursor.close()
    conn.close()

def insert_credentials(server, database, username, password):
    # Connect to the newly created database to insert server credentials
    conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}')
    cursor = conn.cursor()

    # Example: Insert server credentials into a configuration table
    cursor.execute("INSERT INTO ServerCredentials (ServerName, Username, Password) VALUES (?, ?, ?)", (server, username, password))
    conn.commit()

    cursor.close()
    conn.close()

# def create_tables(path='./create.sql'):
#     with open(path, 'r'):
        


if __name__ == '__main__':
    # Replace these values with your actual SQL Server credentials
    server = 'YourServerName'
    database = 'car_maintenance'
    username = 'YourUsername'
    password = 'YourPassword'

    # Create the database
    create_database(server, database, username, password)

    # Insert server credentials
    insert_credentials(server, database, username, password)
