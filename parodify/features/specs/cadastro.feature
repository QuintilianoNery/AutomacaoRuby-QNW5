#language: pt

Funcionalidade: Cadastro de usuários
    Sendo um visitante do site Parodify
    Quero fazer o meu cadastro
    Para que eu possa ouvir minhas músicas favoritas


@happy
Cenario: Cadastro
    Dado que acesso a página de cadastro:
    Quando submeto o meu cadastro com:
        |email         |3@2.com|
        |senha         |123456 |
        |senha_confirma|123456 |
    Então devo ser redirecionado para a área logada

@email_não_informado
Cenario: Email não informado
    Dado que acesso a página de cadastro:
        Quando submeto o meu cadastro com:
        |email         |       |
        |senha         |123456 |
        |senha_confirma|123456 |
    Então devo ver a mensagem "Oops! Informe seu email."
    
@senha_invalida
Cenario: Senha não informada
    Dado que acesso a página de cadastro:
    Quando submeto o meu cadastro com:
        |email         |3@3.com|
        |senha         |       |
        |senha_confirma|       |
    Então devo ver a mensagem "Oops! Informe sua senha."

@senha_divergente
Cenario: Senha divergente
    Dado que acesso a página de cadastro:
    Quando submeto o meu cadastro com:
        |email         |3@3.com|
        |senha         |123456 |
        |senha_confirma|654321 |
    Então devo ver a mensagem "Oops! Senhas não são iguais."

@nenhum_campo_preenchido
Cenario: Nenhum campo preenchido
    Dado que acesso a página de cadastro:
    Quando submeto o meu cadastro com:
        |email         |       |
        |senha         |       |
        |senha_confirma|       |
    Então devo ver a mensagem "Oops! Informe seu email e sua senha."


#Tentar fazer com que esse cenário rode sem ter seu e-mail apagado
@email_ja_cadastrado
Cenario: E-mail já cadastrado 
    Dado que acesso a página de cadastro:
    Quando submeto o meu cadastro com:
        |email         |1@2.com.br|
        |senha         |123456    |
        |senha_confirma|123456    |
    Então devo ver a mensagem "Oops! Email já cadastrado."
