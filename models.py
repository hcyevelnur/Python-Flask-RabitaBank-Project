from extensions import * 
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from app import *
from flask_admin.contrib.sqla import ModelView






class ContactUs(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    full_name = db.Column(db.String(100))
    email = db.Column(db.String(100))
    date = db.Column(db.String(100))
    comment = db.Column(db.String(100))

    def __repr__(self):
        return self.full_name

    def __init__(self, full_name, email, date, comment):
        self.full_name = full_name
        self.email = email
        self.date = date
        self.comment = comment

    def save(self):
        db.session.add(self)
        db.session.commit()





class Xeberler(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    description = db.Column(db.String(255))
    date = db.Column(db.String(255))
    comment = db.Column(db.Text)
    image = db.Column(db.String(255))
    image2 = db.Column(db.String(255))
    image3 = db.Column(db.String(255))
    image4 = db.Column(db.String(255))
    kategori = db.Column(db.String(255))


    def __repr__(self):
        return self.description

    def __init__(self, description, date, comment, image, image2, image3, image4, kategori):
        self.description = description
        self.date = date
        self.comment = comment
        self.image = image
        self.image2 = image2
        self.image3 = image3
        self.image4 = image4
        self.kategori = kategori

    def save(self):
        db.session.add(self)
        db.session.commit()






class Kampaniyalar(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100))
    date = db.Column(db.String(25))
    date1 = db.Column(db.String(25))
    date2 = db.Column(db.String(25))
    comment = db.Column(db.Text)
    image = db.Column(db.Text, nullable=True)
    kategori = db.Column(db.String(255))

    def __repr__(self):
        return self.name

    def __init__(self, name, date, date1, date2, comment, image, kategori):
        self.name = name
        self.date = date
        self.date1 = date1
        self.date2 = date2
        self.comment = comment
        self.image = image
        self.kategori = kategori

    def save(self):
        db.session.add(self)
        db.session.commit()






class Slider1(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100))
    description = db.Column(db.String(100))
    meblegi = db.Column(db.String(25))
    faizderecesi = db.Column(db.String(25))
    muddeti = db.Column(db.String(25))
    image = db.Column(db.Text, nullable=True)


    def __repr__(self):
        return self.name

    def __init__(self, name, description, meblegi, faizderecesi, muddeti, image):
        self.name = name
        self.description = description
        self.meblegi = meblegi
        self.faizderecesi = faizderecesi
        self.muddeti = muddeti
        self.image = image

    def save(self):
        db.session.add(self)
        db.session.commit()







class Slider2(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100))
    nagdlasdirma = db.Column(db.String(25))
    guzes = db.Column(db.String(25))
    kartlimit = db.Column(db.String(25))
    image = db.Column(db.Text, nullable=True)


    def __repr__(self):
        return self.name

    def __init__(self, name, nagdlasdirma, guzes, kartlimit, image):
        self.name = name
        self.nagdlasdirma = nagdlasdirma
        self.guzes = guzes
        self.kartlimit = kartlimit
        self.image = image

    def save(self):
        db.session.add(self)
        db.session.commit()







class Emanetler(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100))
    description = db.Column(db.String(100))
    muddeti = db.Column(db.String(25))
    faizderecesi = db.Column(db.String(25))
    valyuta = db.Column(db.String(25))
    image = db.Column(db.Text, nullable=True)


    def __repr__(self):
        return self.name

    def __init__(self, name, description, muddeti, faizderecesi, valyuta, image):
        self.name = name
        self.description = description
        self.muddeti = muddeti
        self.faizderecesi = faizderecesi
        self.valyuta = valyuta
        self.image = image

    def save(self):
        db.session.add(self)
        db.session.commit()






class emanetsorgu(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    ad = db.Column(db.String(100))
    soyad = db.Column(db.String(100))
    nomre = db.Column(db.String(100))
    deposit = db.Column(db.Text)


    def __repr__(self):
        return self.ad

    def __init__(self, ad, soyad, nomre, deposit):
        self.ad = ad
        self.soyad = soyad
        self.nomre = nomre
        self.deposit = deposit

    def save(self):
        db.session.add(self)
        db.session.commit()







class onlinenovbe(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    filial = db.Column(db.String(100))
    xidmet_novu = db.Column(db.String(100))
    tarix = db.Column(db.String(100))
    vaxt = db.Column(db.String(100))
    mobil_nomre = db.Column(db.String(100))


    def __repr__(self):
        return self.filial

    def __init__(self, filial, xidmet_novu, tarix, vaxt, mobil_nomre):
        self.filial = filial
        self.xidmet_novu = xidmet_novu
        self.tarix = tarix
        self.vaxt = vaxt
        self.mobil_nomre = mobil_nomre

    def save(self):
        db.session.add(self)
        db.session.commit()

@login_manager.user_loader
def load_user(user_id):
        return User.query.get(user_id)







class User(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    last_name = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(100), nullable=False)
    fin = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(255), nullable=False)
    cins = db.Column(db.String(100), nullable=True)
    unvan = db.Column(db.String(100), nullable=True)
    is_active = db.Column(db.Boolean, nullable=False)
    is_superuser = db.Column(db.Boolean, nullable=False)
    kartlar = db.relationship('Kartlar', backref='user', lazy=True)

    def __repr__(self):
        return self.name

    def __init__(self, name, last_name, username, email, phone, fin, password,cins,unvan, is_active=True, is_superuser=True):
        self.name = name
        self.last_name = last_name
        self.username = username
        self.email = email
        self.phone = phone
        self.fin = fin
        self.password = generate_password_hash(password)
        self.cins = None
        self.unvan = None
        self.is_active = is_active
        self.is_superuser = is_superuser

    def set_cins(self, cins):
        self.cins = cins

    def set_unvan(self, unvan):
        self.unvan = unvan

    def save(self):
        db.session.add(self)
        db.session.commit()

    def get_id(self):
        return str(self.id)

    def set_password(self, new_password):
        self.password = generate_password_hash(new_password)

    def check_password(self, password):
        return check_password_hash(self.password, password)









class Kartlar(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    kartadi = db.Column(db.String(100))
    securty = db.Column(db.String(100))
    expires = db.Column(db.String(100))
    number = db.Column(db.String(100))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return self.kartadi

    def __init__(self, kartadi, securty, expires, number):
        self.kartadi = kartadi
        self.securty = securty
        self.expires = expires
        self.number = number

    def save(self):
        db.session.add(self)
        db.session.commit()








admin.add_view(ModelView(Xeberler, db.session))
admin.add_view(ModelView(Kampaniyalar, db.session))
admin.add_view(ModelView(Slider1, db.session))
admin.add_view(ModelView(Slider2, db.session))
admin.add_view(ModelView(Emanetler, db.session))
admin.add_view(ModelView(emanetsorgu, db.session))
admin.add_view(ModelView(onlinenovbe, db.session))
admin.add_view(ModelView(User, db.session))
admin.add_view(ModelView(Kartlar, db.session))




