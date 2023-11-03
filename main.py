import sqlite3

def request(number):
    filename = 'query_' + number + '.sql'

    try:
        conn = sqlite3.connect('sqlite.db')
        c = conn.cursor()  

        with open(filename, 'r') as f:
            sql = f.read()

            c.execute(sql)
            result = c.fetchall()

            conn.commit()
            conn.close()

            return result
        
    except sqlite3.Error as e:
        return None


if __name__ == '__main__':
    number = input('Введіть номер запиту>>>')
    result = request(number)
    for row in result:
        print(row)