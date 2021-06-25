#language: pt

Funcionalidade: Cadastro de usuários
    Sendo um visitante do site Parodify
    Quero fazer o meu cadastro
    Para que eu possa ouvir minhas músicas favoritas


    @cadastro
    Cenario: Cadastro
        Dado que acesso a página de cadastro:
        Quando submeto o meu cadastro com:
            | email          | 3@2.com |
            | senha          | 123456  |
            | senha_confirma | 123456  |
        Então devo ser redirecionado para a área logada

    #place holder do cucumber <> que subistitui o valor pelo valor da tabela
    Esquema do Cenário: Tentativa de cadastro
        Dado que acesso a página de cadastro:
        Quando submeto o meu cadastro com:
            | email          | <email>          |
            | senha          | <senha>          |
            | senha_confirma | <senha_confirma> |
        Então devo ver a mensagem "<menssagem_saida>"

        Exemplos:
            | email   | senha   | senha_confirma | menssagem_saida                      |
            |         | 1234565 | 1234565        | Oops! Informe seu email.             |
            | 3@2.com |         |                | Oops! Informe sua senha.             |
            | 3@2.com | 123456  | 1234567        | Oops! Senhas não são iguais.         |
            |         |         |                | Oops! Informe seu email e sua senha. |
    #| 2@2.com | 123456  | 123456         | Oops! Email já cadastrado.           |

    @validacao_campo_email
    Cenario: Validação do campo email

        Quando acesso a página de cadastro
        Então deve exibir o seguinte css "input[type=email]" na página