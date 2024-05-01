from flask import Flask, jsonify, send_from_directory

app = Flask(
    __name__, 
    static_folder='../client/dist', 
    static_url_path='')

@app.route('/')
def index():
    return send_from_directory(app.static_folder, 'index.html')

@app.route('/about')
def about():
    return jsonify({'about': 'about me info here'})



if __name__ == '__main__':
  app.run(port=5000)
