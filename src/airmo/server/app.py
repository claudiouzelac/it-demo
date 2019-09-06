from flask import Flask, request

app = Flask(__name__)


@app.route("/api/version")
def version():
    return {"version": "0.0.1"}

if __name__ == '__main__':
    app.run()
