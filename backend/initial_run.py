from app.database import CarMaintenanceService

if __name__=='__main__':
    try:
        s = CarMaintenanceService()
        s.create_tabels()
        s.create_triggers()
        s.fill_tables()
        s.create_roles()

        data = s.get_table_data('customers')

        if len(data)>0:
            print('It works!')
        else: 
            print('Something is wrong!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') 
        s.close_connection()

    except Exception as e:
        s.close_connection()
        print(e)