from flask import render_template, request, redirect, url_for
from werkzeug.security import check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from app import app
from models import *
from forms import *
import requests
from flask_admin import Admin, AdminIndexView
from datetime import datetime
import xmltodict
from flask_admin.contrib.sqla import ModelView
from flask import redirect, url_for



# -------- valyuta kursu api start --------

def valyuta(gun):
    resp = requests.get(f'https://www.cbar.az/currencies/{gun}.xml')
    result = xmltodict.parse(resp.content)
    return result

# -------- valyuta kursu api end --------



# -------- Ana Səhifə start --------

@app.route("/",  methods = ['GET','POST'])
def yoxlamaa():
    slider = Slider1.query.first()
    slider_1 = Slider2.query.first()

    gun = datetime.today().strftime('%d.%m.%Y')
    melumat = valyuta(gun)
    if request.method=='POST':
        melumat_1 = request.form['melumat_1']
        melumat_2 = f'{melumat_1[8:]}.{melumat_1[5]}{melumat_1[6]}.{melumat_1[:4]}'
        melumat = valyuta(melumat_2)
        return render_template("index.html", melumat=melumat)

    return render_template("index.html", melumat=melumat, slider=slider, slider_1=slider_1)

# -------- Ana Səhifə end --------



# -------- Əmanətlər Səhifəsi start --------

@app.route('/emanetler', methods=['GET', 'POST'])
def emanetler():
    form = Univervalemanet()
    if request.method == 'POST':
        print(form.data)
        if form.validate_on_submit():
            contactinfo = emanetsorgu(ad=form.ad.data, soyad=form.soyad.data, nomre=form.nomre.data, deposit=form.deposit.data)
            contactinfo.save()
            form = Univervalemanet()
    emanetler = Emanetler.query.all()
    return render_template('emanetler.html', emanetler=emanetler, form=form)

# -------- Əmanətlər Səhifəsi end --------



# -------- Xəbərlər Səhifəsi start --------

@app.route('/xeberler')
def xeberler():    
    xeberler = Xeberler.query.all()
    return render_template('xeberler.html', xeberler=xeberler)

@app.route('/xeberler/detal<int:id>')
def movie(id):
    xeberler1 = Xeberler.query.filter_by(id=id).first()
    return render_template('xeberlerdetali.html', xeberler1=xeberler1)

@app.route('/onlinenovbe', methods=['GET', 'POST'])
def novbe():
    form = OnlineNovbeFormu()
    if request.method == 'POST':
        if form.validate_on_submit():
                contactinfo = onlinenovbe(filial=form.filial.data, xidmet_novu=form.xidmet_novu.data,tarix=form.tarix.data, vaxt=form.vaxt.data, mobil_nomre=form.mobil_nomre.data)
                contactinfo.save()
    return render_template('onnovbe.html', form=form)

# -------- Xəbərlər Səhifəsi end --------




# -------- Kampaniyalar Səhifəsi start --------

@app.route('/kampaniyalar')
def kompaniyalar():
    kompaniyalar = Kampaniyalar.query.all()
    return render_template('kampaniyalar.html', kompaniyalar=kompaniyalar)

@app.route('/kampaniyalar/detal<int:id>')
def kompaniyalardetali(id):
    kompaniyalar1 = Kampaniyalar.query.filter_by(id=id).first()
    return render_template('kampaniyalar-detal.html', kompaniyalar1=kompaniyalar1)

# -------- Kampaniyalar Səhifəsi end --------




# -------- İnternetBank Səhifəsi start --------

@app.route('/interbank', methods = ['GET', 'POST'])
def interbank():
    qeydiyyat = QeydiyyatFormu()
    if request.method == 'POST':
        butun = request.form
        qeydiyyat = QeydiyyatFormu(data = butun)
        if qeydiyyat.validate_on_submit():
            yeni = User(name = qeydiyyat.name.data, last_name=qeydiyyat.last_name.data, username=qeydiyyat.username.data, email=qeydiyyat.email.data, phone=qeydiyyat.phone.data, password=qeydiyyat.password.data, fin=qeydiyyat.fin.data, cins=qeydiyyat.cins.data, unvan=qeydiyyat.unvan.data)
            yeni.save()
            return redirect('/interbank')

    error = None
    form = GirisFormu()
    if request.method == 'POST':
        if request.form['username'] != 'username' or request.form['password'] != 'password':
            error = 'Yalnış istifadəçi adı vəya şifrə.'
        else:
            return redirect('/interbank')

    butun = request.form
    form = GirisFormu(data = butun)
    if form.validate_on_submit():
            username = User.query.filter_by(username = form.username.data).first()
            if check_password_hash(username.password, form.password.data):
                login_user(username)
                print('User girdi')
                return redirect ('/sexsikabinet')
            else:
                print('User girmedi')
    return render_template('interbank.html', yeni=qeydiyyat, form=form, error=error)

# -------- İnternetBank Səhifəsi end --------




# -------- Tezliklə Səhifəsi start --------

@app.route('/tezliklə')
def tezlikle():
    return render_template('tezlikle.html')

# -------- Tezliklə Səhifəsi end --------




# -------- Profildən çıxış start --------

@app.route('/cixis')
@login_required
def cixis():
    logout_user()
    return redirect('/interbank')

# -------- Profildən çıxış end --------




# -------- Şəxsi Kabinet start --------

@app.route('/sexsikabinet')
def profil():
    xeberler = Xeberler.query.all()
    kompaniyalar = Kampaniyalar.query.all()
    return render_template('profile.html', xeberler=xeberler, kompaniyalar=kompaniyalar)

# -------- Şəxsi Kabinet end --------




# -------- Profildə Düzəliş etmə start --------

@app.route('/parametrlər', methods=['GET', 'POST'])
def update_profile():
    user = User.query.get(current_user.id)
    if user is None:
        return redirect('/interbank')
    all_data = request.form
    print(all_data)
    form = EditProfileForm()
    if request.method == 'POST':
        form = EditProfileForm(data=all_data)
        print(form.validate_on_submit())
        if form.validate_on_submit():
            user.name = form.name.data
            user.last_name = form.last_name.data
            user.username = form.username.data
            user.email = form.email.data
            user.phone = form.phone.data
            user.fin = form.fin.data
            user.cins = form.cins.data
            user.unvan= form.unvan.data
            db.session.commit()
        else:
            print(form.errors)
    return render_template('settings.html', user=user, form=form)

# -------- Profildə Düzəliş etmə end --------




# -------- Profil silmə start --------

@app.route('/profilsil', methods=['POST'])
def profilsil():
    user = User.query.get(current_user.id)
    if user is None:
        return redirect('/interbank')
    
    db.session.delete(user)
    db.session.commit()
    
    logout_user()
    
    return redirect('/interbank')

# -------- Profil silmə end --------




# -------- Virtual Kabinetim səhifəsi start --------

@app.route('/virtualkabinetim')
def virtuall():
    return render_template('virtual-reality.html')

# -------- Virtual Kabinetim səhifəsi end --------




# -------- Kartlar səhifəsi start --------

@app.route('/kartlarim', methods=['GET', 'POST'])
def kartlarr():
    if request.method == 'POST':
        kartadi = request.form['kartadi']
        securty = request.form['securty']
        expires = request.form['expires']
        number = request.form['number']
        kart = Kartlar(kartadi=kartadi, securty=securty, expires=expires, number=number)
        kart.user = current_user
        kart.save()

    return render_template('kartlar.html', user=current_user)

# -------- Kartlar səhifəsi end --------




# -------- Kart silmə start --------

@app.route('/sil/kart/<kart_id>', methods=['POST'])
def sil_kart(kart_id):
    try:
        kart = Kartlar.query.get(kart_id)
        if kart:
            db.session.delete(kart)
            db.session.commit()
            return redirect('/kartlarim')
        else:
            return redirect('/kartlarim')
    except Exception as e:
        return redirect('/kartlarim')

# -------- Kart silmə end --------




# @app.route('/settings')
# def ayarlar():
#     return render_template('settings.html')


