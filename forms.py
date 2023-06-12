from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import DataRequired, Length, Email
from models import *
from flask_ckeditor import CKEditorField



class ContactForm(FlaskForm):
    full_name = StringField('Full Name', validators=[DataRequired(), Length(min=2, max=20)])
    email = EmailField('Email', validators=[DataRequired(), Email()])
    phone = IntegerField('Phone', validators=[DataRequired()])
    comment = TextAreaField('Comment', validators=[DataRequired()])




class Univervalemanet(FlaskForm):
    ad = StringField('Adınız', validators=[DataRequired(), Length(min=2, max=20)],render_kw={'placeholder': 'John'})
    soyad = StringField('Soyadınız', validators=[DataRequired(), Length(min=2, max=20)],render_kw={'placeholder': 'Doe'})
    nomre = StringField('Mobil nömrəniz', validators=[DataRequired()], render_kw={'class': 'emanetsorgusu_1_7', 'style': 'padding-left: 20px;', 'inputmode': 'tel', 'placeholder': 'məs: 0515400979'})
    deposit = RadioField('Əmanətin növü', choices=[
        ('Universal əmanət', 'Universal əmanət'),
        ('Uşaq yığım əmanəti', 'Uşaq yığım əmanəti'),
        ('Saxlanc seyfləri', 'Saxlanc seyfləri')
    ], validators=[DataRequired()])




class OnlineNovbeFormu(FlaskForm):
    filial = SelectField('Secin', choices=[
        ('Seçin', 'Seçin'),
        ('Nəsimi filialı (Bül-bül pr.30)', 'Nəsimi filialı (Bül-bül pr.30)'),
        ('Nizami filialı (Sarayevo küç. 26c)', 'Nizami filialı (Sarayevo küç. 26c)'),
        ('Səbail Filialı (A.Məhərrəmov küç. 33A)', 'Səbail Filialı (A.Məhərrəmov küç. 33A)'),
        ('Nərimanov filialı (İ.Hidayətzadə küç.49/51)', 'Nərimanov filialı (İ.Hidayətzadə küç.49/51)'),
        ('Yasamal filialı (Şərifzadə küç.408)', 'Yasamal filialı (Şərifzadə küç.408)'),
        ('Baş Ofis (Bakı şəh.,Nəsimi ray., 28 May küç.3)', 'Baş Ofis (Bakı şəh.,Nəsimi ray., 28 May küç.3)'),
        ('Sahil filialı (Ə.Rəcəbli küç.3)', 'Sahil filialı (Ə.Rəcəbli küç.3)'),
        ('Xətai filialı (Xocalı pr.37)', 'Xətai filialı (Xocalı pr.37)'),
        ('Sumqayıt filialı (S.Vurğun küç.102)', 'Sumqayıt filialı (S.Vurğun küç.102)'),
        ('Mərkəz filialı (B.Sərdarov küç.,1)', 'Mərkəz filialı (B.Sərdarov küç.,1)'),
        ('Şirvan filialı (20 yanvar küç.12)', 'Şirvan filialı (20 yanvar küç.12)'),
        ('Kürdəmir filialı (H.Əliyev pr. 3-cü məh. 50)', 'Kürdəmir filialı (H.Əliyev pr. 3-cü məh. 50)'),
        ('Ağsu filialı (M.Rəsulzadə küç.35)', 'Ağsu filialı (M.Rəsulzadə küç.35)'),
        ('Şamaxı filialı (N. Nərimanov küç. 66)', 'Şamaxı filialı (N. Nərimanov küç. 66)'),
        ('Şəki filialı (M.Rəsulzadə küç.178)', 'Şəki filialı (M.Rəsulzadə küç.178)'),
        ('Xaçmaz filialı (N.Nərimanov küç.15)', 'Xaçmaz filialı (N.Nərimanov küç.15)'),
        ('Quba filialı (H.Əliyev pr. və T.Əhmədov küç. kəsişməsi)', 'Quba filialı (H.Əliyev pr. və T.Əhmədov küç. kəsişməsi)'),
        ('Qusar filialı (N.Şərifov küç. 18A)', 'Qusar filialı (N.Şərifov küç. 18A)'),
        ('Şəmkir filialı (Nizami Gəncəvi küç.144)', 'Şəmkir filialı (Nizami Gəncəvi küç.144)'),
        ('Gəncə filialı (H.Əliyev pr. 273)', 'Gəncə filialı (H.Əliyev pr. 273)'),
        ('Ağcabədi filialı (H.Əliyev pr.29)', 'Ağcabədi filialı (H.Əliyev pr.29)'),
        ('Lənkəran filialı (Mir Mustafaxan küç.33)', 'Lənkəran filialı (Mir Mustafaxan küç.33)'),
        ('Masallı filialı (H.Əliyev pr. və H.Aslanov küç. kəsişməsi)', 'Masallı filialı (H.Əliyev pr. və H.Aslanov küç. kəsişməsi)'),
        ('Kaspian filialı (C. Cabbarlı küç.44(Caspian Plaza))', 'Kaspian filialı (C. Cabbarlı küç.44(Caspian Plaza))'),
        ('KOB Mərkəzi (Ə.Rəcəbli -3 küç., 5)', 'KOB Mərkəzi (Ə.Rəcəbli -3 küç., 5)'),
        ('Naxçıvan filialı (H.Əliyev pros.3/13)', 'Naxçıvan filialı (H.Əliyev pros.3/13)'),
    ], validators=[DataRequired()])

    xidmet_novu = SelectField('Secin', choices=[
        ('Seçin', 'Seçin'),
        ('Kredit müraciəti', 'Kredit müraciəti'),
        ('Sürətli pul köçürmələri', 'Sürətli pul köçürmələri'),
        ('Plastik kart', 'Plastik kart'),
        ('Əmanət', 'Əmanət'),
        ('Hesab üzrə əməliyyatlar', 'Hesab üzrə əməliyyatlar'),
        ('Hüquqi şəxs və sahibkarlar', 'Hüquqi şəxs və sahibkarlar'),
    ], validators=[DataRequired()])

    tarix = SearchField('Seçilen Tarih', validators=[DataRequired()], render_kw={'class': 'onlinenovbe_6', 'type': 'date', 'id': 'birthday'})

    vaxt = SelectField('Secin', choices=[
        ('Seçin', 'Seçin'),
        ('09:00:00', '09:00:00'),
        ('10:00:00', '10:00:00'),
        ('11:00:00', '11:00:00'),
        ('12:00:00', '12:00:00'),
        ('14:00:00', '14:00:00'),
        ('15:00:00', '15:00:00'),
        ('16:00:00', '16:00:00')
    ], validators=[DataRequired()])

    mobil_nomre = SearchField('Mobil nömrəniz', validators=[DataRequired()], render_kw={'class': 'onlinenovbe_6', 'style': 'padding-left: 20px;', 'inputmode': 'tel', 'placeholder': 'məs: 0515400979'})





class XeberlerFormu(FlaskForm):
    description = StringField('Description', validators=[DataRequired()])
    date = StringField('Date', validators=[DataRequired()])
    comment = CKEditorField('Comment', validators=[DataRequired()])
    image = StringField('Image', validators=[DataRequired()])
    image2 = StringField('Image2', validators=[DataRequired()])
    image3 = StringField('Image3', validators=[DataRequired()])
    image4 = StringField('Image4', validators=[DataRequired()])
    kategori = StringField('Kategori', validators=[DataRequired()])




class QeydiyyatFormu(FlaskForm):
    name = StringField('Ad', validators=[DataRequired(), Length(min=2, max=20)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Adınız'})
    last_name = StringField('Soyad', validators=[DataRequired(), Length(min=2, max=20)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Soyadınız'})
    username = StringField('istifadəçi adı', validators=[DataRequired(), Length(min=2, max=20)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'İstifadəçi adı'})
    email = EmailField('Email', validators=[DataRequired(), Email()], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Email'})
    phone = IntegerField('Telefon', validators=[DataRequired()], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Möbil nömrəniz'})
    password = StringField('Şifrə', validators=[DataRequired(), Length(min=8, max=18)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Şifrə'})
    fin = StringField('istifadəçi adı', validators=[DataRequired(), Length(min=2, max=7)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'FİN'})
    date = StringField('Dogum gunu')
    cins = StringField('cins')
    unvan = StringField('unvan')




class GirisFormu(FlaskForm):
    username = StringField('istifadəçi adı', validators=[DataRequired(), Length(min=2, max=20)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'İstifadəçi adı'})
    password = StringField('Şifrə', validators=[DataRequired(), Length(min=8, max=18)], render_kw={'class': 'form-control', 'style': 'font-family: sans-serif;', 'placeholder': 'Şifrəniz'})





class Kartformu(FlaskForm):
    kartadi = StringField('Kart adı', validators=[DataRequired(), Length(min=2, max=20)], render_kw={'class': 'form-control', 'placeholder': 'John Doe'})
    securty = StringField('345', validators=[DataRequired(), Length(min=2, max=5)], render_kw={'class': 'form-control', 'placeholder': '123'})
    expires = StringField('MM/MM', validators=[DataRequired(), Length(min=2, max=16)], render_kw={'class': 'form-control', 'placeholder': '12/12'})
    number = StringField('4562112245947852', validators=[DataRequired(), Length(min=2, max=16)], render_kw={'class': 'form-control', 'placeholder': '4169 7388 5200 5994'})





class EditProfileForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=2, max=20)])
    email = EmailField('Email', validators=[DataRequired(), Email(), Length(min=2, max=255)])
    name = StringField('Name', validators=[DataRequired(), Length(min=2, max=20)])
    last_name = StringField('Last Name', validators=[DataRequired(), Length(min=2, max=20)])
    phone = IntegerField('Phone', validators=[DataRequired()])
    fin = StringField('Fin', validators=[DataRequired(), Length(min=2, max=7)])
    unvan = StringField('unvan', validators=[DataRequired(), Length(min=2, max=255)]) 
    cins = SelectField('Secin', choices=[
        ('Seçin', 'Seçin'),
        ('Kişi', 'Kişi'),
        ('Qadın', 'Qadın')
    ], validators=[DataRequired()])

    