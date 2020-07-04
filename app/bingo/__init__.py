from flask import Blueprint, request, redirect, url_for, render_template, jsonify
from app.bingo.functions import create_card, get_card, save_bingo, get_bingo

bingo = Blueprint("bingo", __name__, url_prefix="/bingo")


@bingo.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        if request.form.get("naughty") and request.form.get("naughty") == "on":
            string = create_card(True)
            return redirect(url_for("bingo.string", string=string))

        string = create_card(False)
        return redirect(url_for("bingo.string", string=string))

    return redirect(url_for("index"))


@bingo.route("/<string>/", methods=["GET", "POST"])
def string(string, saved=None):

    if request.method == "POST":
        inserted = save_bingo(string, request.get_json())[0]["id"]
        return jsonify({"redirect": url_for('bingo.saved', string=string, saved=inserted)})

    entries = [dict(item) for item in get_card(string)]

    if entries:
        return render_template("bingo.html", hasbingo=False, entries=entries, allownew=True)

    return redirect(url_for("bingo.index"))


@bingo.route("/<string>/<int:saved>/")
def saved(string, saved):
    entries = [dict(item) for item in get_card(string)]

    if entries:
        bingos = get_bingo(string, saved)

        if bingos:
            return render_template("bingo.html", entries=entries, hasbingo=True, bingo=bingos[0]["entries"], allownew=False)

        return redirect(url_for("bingo.string", string=string))

    return redirect(url_for("bingo.index"))
