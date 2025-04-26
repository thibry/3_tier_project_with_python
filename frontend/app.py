from flask import Flask, render_template, request, redirect, url_for, flash, make_response
import urllib.request, json
import requests

app = Flask(__name__)

@app.route('/')
def index():
    todos = {}

    try:
        # URL du backend
        url = "internal-BackendAppELB-207611879.us-east-1.elb.amazonaws.com/"
        response = requests.get(url, timeout=60)
        todos = json.loads(response.content)
    except Exception as ex:
        exc = str(ex)

    return render_template('index.html', todos=todos)

@app.route('/create', methods=['POST'])
def create():
    task = request.form.get('task')
    try:
        url = "internal-BackendAppELB-207611879.us-east-1.elb.amazonaws.com/create"
        data = {'task': task}
        response = requests.post(url, data=data)
        return redirect('/')
    except Exception as ex:
        exc = str(ex)
        return redirect('/')

@app.route('/update', methods=['POST'])
def update():
    task_id = request.form.get('task_id')
    task = request.form.get('task')
    try:
        url = "internal-BackendAppELB-207611879.us-east-1.elb.amazonaws.com/update"
        data = {'task_id': task_id, 'task': task}
        response = requests.post(url, data=data)
        return redirect('/')
    except Exception as ex:
        exc = str(ex)
        return redirect('/')

if __name__ == "__main__":
    app.run(debug=True)
