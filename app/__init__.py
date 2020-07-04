from flask import Flask, render_template, session
from app.bingo import bingo
from datetime import datetime

app = Flask(__name__)

app.config.from_object("app.config")

app.jinja_env.trim_blocks = True
app.jinja_env.lstrip_blocks = True
app.jinja_env.strip_trailing_newlines = True

app.register_blueprint(bingo)


@app.context_processor
def footer_variables():
    return {
        "year": datetime.utcnow().year,
        "version": app.config.get("VERSION")
    }


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/about/")
def about():
    return render_template("about.html")
