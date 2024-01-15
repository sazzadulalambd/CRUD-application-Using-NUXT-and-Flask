from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# MySQL configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'naynabco_crud'
app.config['MYSQL_PASSWORD'] = '(6=ZFSg;Hzhw)'
app.config['MYSQL_DB'] = 'naynabco_crud_app'

# Initialize MySQL
mysql = MySQL(app)

# Error handling during initialization
try:
    print("MySQL connection successful!")
except Exception as e:
    print(f"Error connecting to MySQL during initialization: {e}")

# API to get all students
@app.route('/students', methods=['GET'])
def get_all_students():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM student")
        data = cur.fetchall()
        cur.close()

        students = []
        for row in data:
            student_dict = {
                'id': row[0],
                'name': row[1],
                'course': row[2],
                'email': row[3],
                'phone': row[4]
            }
            students.append(student_dict)

        return jsonify({'students': students})
    except Exception as e:
        return jsonify({'message': f'Error executing query: {e}'}), 500
    
# API to get a single student by ID
@app.route('/students/<int:student_id>', methods=['GET'])
def get_student(student_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM student WHERE id = %s", (student_id,))
        data = cur.fetchone()
        cur.close()
        if data:
            # Convert the tuple into a dictionary
            student_dict = {
                'id': data[0],
                'name': data[1],
                'course': data[2],
                'email': data[3],
                'phone': data[4]
            }
            return jsonify({'student': student_dict})
        else:
            return jsonify({'message': 'Student not found'}), 404
    except Exception as e:
        return jsonify({'message': f'Error fetching student: {e}'}), 500
    
# API to create a new student
@app.route('/students', methods=['POST'])
def create_student():
    try:
        data = request.get_json()
        name = data['name']
        course = data['course']
        email = data['email']
        phone = data['phone']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO student (name, course, email, phone) VALUES (%s, %s, %s, %s)", (name, course, email, phone))
        mysql.connection.commit()
        cur.close()

        return jsonify({'message': 'Student created successfully'}), 201
    except Exception as e:
        return jsonify({'message': f'Error creating student: {e}'}), 500  
    
# API to update a student by ID (supports both PUT and PATCH)
@app.route('/students/<int:student_id>', methods=['PUT', 'PATCH'])
def update_student(student_id):
    try:
        data = request.get_json()
        name = data.get('name')
        course = data.get('course')
        email = data.get('email')
        phone = data.get('phone')

        cur = mysql.connection.cursor()
        cur.execute("UPDATE student SET name = %s, course = %s, email = %s, phone = %s WHERE id = %s",
                    (name, course, email, phone, student_id))
        mysql.connection.commit()
        cur.close()

        return jsonify({'message': 'Student updated successfully'})
    except Exception as e:
        return jsonify({'message': f'Error updating student: {e}'}), 500
    
# API to delete a student by ID
@app.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM student WHERE id = %s", (student_id,))
        mysql.connection.commit()
        cur.close()

        return jsonify({'message': 'Student deleted successfully'})
    except Exception as e:
        return jsonify({'message': f'Error deleting student: {e}'}), 500

if __name__ == '__main__':
    app.run(debug=True)
