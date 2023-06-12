from flask import Flask
from flask_ckeditor import CKEditor
from flask_login.utils import login_user, logout_user
from flask_login import LoginManager, UserMixin, current_user
from app import *
from flask_ckeditor import CKEditor

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+mysqlconnector://root:123456@127.0.0.1:3308/task_flask"
app.config['SECRET_KEY'] = 'any secret string'
app.config['FLASK_ADMIN_SWATCH'] = 'cerulean'
app.config['UPLOAD_FOLDER'] = 'static/uploads'


SQLALCHEMY_TRACK_MODIFICATIONS = True

from extensions import *
from controllers import *
from models import *

if __name__ == '__main__':
    db.init_app(db)
    db.init_app(migrate)
    app.run(port=5001, debug=True)







