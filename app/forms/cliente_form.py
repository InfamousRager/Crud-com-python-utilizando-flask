from flask_wtf import FlaskForm
from wtforms import StringField, DateField, SelectField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Email


class ClienteForm(FlaskForm):
    nome =  StringField("nome",validators=[DataRequired()])
    email = EmailField("email",validators=[Email(), DataRequired()])
    data_nascimento = DateField("data_nascimento", validators=[DataRequired()], format='%d/%m/%Y')
    profissao = StringField("profissão", validators=[DataRequired()])
    sexo = SelectField("sexo",validators=[DataRequired()],choices=[('F','Feminino'),('M','Masculino'),('N','Nenhuma das opções')])