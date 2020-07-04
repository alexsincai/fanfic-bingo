from app.util import db
from werkzeug.security import generate_password_hash as hash


def create_card(nsfw=False):
    query_string = f"SELECT id FROM tropes {'WHERE nsfw = False' if not nsfw else ''} ORDER BY random() LIMIT 24;"

    entries = [str(item["id"]) for item in db(query_string)]

    string = "".join([item for item in entries])
    string = hash(string).split("$")[-1]

    entries = [int(item) for item in entries]

    tmp = db("INSERT INTO cards (string, entries) VALUES (%s, %s) RETURNING id;", (string, entries,))
    
    return string

def get_card(string):
    query_string = """
        WITH entries AS (
            SELECT entries as entry
            FROM cards
            WHERE string = %s
        )
        SELECT
            id,
            trope
        FROM tropes
        JOIN entries ON id = any(entry)
        ORDER BY array_position(entry, id);
    """

    return db(query_string, (string,))


def save_bingo(string, entries):
    query_string = "INSERT INTO bingos (string, entries) VALUES (%s, %s) RETURNING id;"
    id = db(query_string, (string, entries,))

    query_string = ()
    
    return id


def get_bingo(string, id):
    query_string = "SELECT entries FROM bingos WHERE string = %s AND id = %s;"
    return db(query_string, (string, id,))
