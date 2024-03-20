from flask import Flask

app = Flask(__name__)
@app.route('/match')
def match():
    return "hi"

app = Flask(__name__)
@app.route('/foster')
def match():
    return "hi"

if __name__ == '__main__':
    # run app in debug mode on port 5000
    app.run(debug=False, host="192.168.86.27", port=5000)