from flask import url_for, render_template, redirect, request
from app import db
from app import app
from app.forms import cliente_form
from app.models import cliente_model
from app.entidades import cliente
from app.services import cliente_service


@app.route("/cadastrar_cliente", methods=["GET", "POST"])
def cadastrar_cliente():
    form = cliente_form.ClienteForm()
    if form.validate_on_submit():  # se passar desse if significa que os dados foram validados corretamente (dados inseridos no form pelo usuário)
        nome = form.nome.data
        email = form.email.data
        data_nascimento = form.data_nascimento.data
        profissao = form.profissao.data
        sexo = form.sexo.data

        cliente = cliente_model.Cliente(nome=nome, email=email, data_nascimento=data_nascimento, profissao=profissao,sexo=sexo)  # criando objeto do tipo cliente_model passando dados obtidos do formulario pro metodo add
        try:
            cliente_service.cadastrar_cliente(cliente)
            return redirect(
                url_for("listar_clientes"))  # redireciona pra pagina de listagem de clientes depois de se cadastrar
        except:
            print("Cliente não cadastrado")
    return render_template("clientes/form.html", form=form)


@app.route("/listar_clientes", methods=["GET"])
def listar_clientes():
    # clientes = cliente_model.Cliente.query.all()  #a query busca na tabela cliente todos os clientes cadastrados na db
    clientes = cliente_service.listar_clientes()
    return render_template("clientes/lista_clientes.html", clientes=clientes)


@app.route("/listar_cliente/<int:id>")
def listar_cliente(id):
    # cliente = cliente_model.Cliente.query.filter_by(id=id).first() #buscando na tabela do cliente aquele que tem o ID procurado, é como se fosse um SELECT * FROM clientes WHERE id = 2 (exemplo)
    cliente = cliente_service.listar_cliente(id)
    return render_template("clientes/lista_cliente.html", cliente=cliente)


@app.route("/editar_cliente/<int:id>", methods=["POST", "GET"])
def editar_cliente(id):
    cliente_bd = cliente_service.listar_cliente(id)
    form = cliente_form.ClienteForm(obj=cliente_bd)  # aqui criamos a variavel form que cria a instancia do cliente form e passa o  atributo obj o cliente que encontra no db, isso é pra quando for editar um cliente o formulario aparecer preenchido
    form.sexo.data = cliente_bd.sexo
    if form.validate_on_submit():
        nome = form.nome.data
        email = form.email.data
        data_nascimento = form.data_nascimento.data
        profissao = form.profissao.data
        sexo = form.sexo.data

        cliente_novo = cliente.Cliente(nome=nome, email=email, data_nascimento=data_nascimento, profissao=profissao,sexo=sexo)

        try:
            cliente_service.editar_cliente(cliente_bd, cliente_novo)
            return redirect(url_for("listar_clientes"))
        except:
            print("O cliente não foi editado")

    return render_template("clientes/form.html", form=form)


@app.route("/remover_cliente/<int:id>", methods=["GET", "POST"])
def remover_cliente(id):
    cliente = cliente_service.listar_cliente(id)
    if request.method == "POST":  # verifica o método da requisição , se sim o cliente é removido ao clickar no botao
        try:
            cliente_service.remover_cliente(cliente)
            return redirect(url_for("listar_clientes"))
        except:
            print("Erro ao remover o cliente")

    return render_template("clientes/remover_cliente.html", cliente=cliente)