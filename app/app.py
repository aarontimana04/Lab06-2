import os
import socket

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        message="Flask en Kubernetes funcionando",
        pod=socket.gethostname()
    )


@app.route("/health")
def health():
    return jsonify(status="ok")


@app.route("/pod")
def pod():
    return jsonify(
        pod=socket.gethostname(),
        hostname=os.getenv("HOSTNAME")
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
