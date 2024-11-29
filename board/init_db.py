import os
import psycopg2

from flask import current_app

conn = psycopg2.connect(host="psql-db", database="flask_db", user="admin", password="P4ssw0rd", port="5432")

cur = conn.cursor()

cur.execute('Drop Table If Exists post;')
# cur.execute('Create Table post(id integer primary key autoincrement, create Timestamp Not Null);')
cur.execute('Create Table post (id serial PRIMARY KEY,'
            'created DATE DEFAULT CURRENT_TIMESTAMP,'
            'author TEXT NOT NULL,'
            'message TEXT NOT NULL);')

conn.commit()

cur.close()
conn.close()