#language: pt
Funcionalidade: Login
    Sendo um usuário previamente cadastrado
    Quero acessar o sistema com meu email e senha
    Para que eu possa ter acesso as playlists do Patrodify

    @login_com_sucesso
    Cenário: Login com sucesso
        Dado que acesso a página de login
        Quando submeto minhas credenciais com: "3@2.com" e "123456"
        Então devo ser redirecionado para a área logada

    Esquema do Cenário: Tentativa de Login
        Dado que acesso a página de login
        Quando submeto minhas credenciais com: "<email>" e "<senha>"
        Então devo ver a mensagem de erro: "Opps! Dados de acesso incorretos!"

        Exemplos:
            | email   | senha  |
            | 2@2.com | 123456 |
            |         |        |
            | 3@2.com |        |
            |         | 123456 |