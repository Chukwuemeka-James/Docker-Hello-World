from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Welcome to Docker Hello world Lab!'

@app.route('/test')
def test():
    return 'This is where we do the testing'

if __name__ == '__main__':
    app.run(debug=False,host='0.0.0.0', port=5000)
