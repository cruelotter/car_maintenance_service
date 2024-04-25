from database import CarMaintenanceService


if __name__=='__main__':
    s = CarMaintenanceService()
    s.create_tabels()
    s.fill_tables()
    s.create_roles()

    data = s.get_data('customers')
    if len(data)>0:
        print('It works!')
    else: 
        print('Something is wrong')
        
    s.close_connection()