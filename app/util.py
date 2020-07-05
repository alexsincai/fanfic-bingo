from os import environ as env
from psycopg2 import connect, DatabaseError
from psycopg2.extras import RealDictCursor as cursor_type


def establish_connection():
    try:
        connection = connect("postgres://postgres:postgres@127.0.0.1/fanficbingo")
        # connection = connect(env["DATABASE_URL"], sslmode="require")
        connection.autocommit = True
        return connection

    except DatabaseError:
        raise RuntimeError("Could not connect to databse")


def db(statement, vars=None):
    with establish_connection() as conn:
        with conn.cursor(cursor_factory=cursor_type) as cursor:
            cursor.execute(statement, vars)

            return cursor.fetchall()
