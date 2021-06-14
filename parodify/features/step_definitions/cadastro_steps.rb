#@happy
Dado('que acesso a página de cadastro') do       
    visit "http://parodify.qaninja.com.br"
    click_on "EXPERIMENTE AGORA"
end                                                                           
                                                                                
Quando('submeto o meu cadastro com:') do |table|     
    #converte a tabela que está entre pipe para um objeto nativo do ruby              
    #guardar na variável user    
    user = table.rows_hash

    #usar API para apagar o cadastro antes de ser utilizado
    apagar_cadastro user[:email]
    
    #find método do capybara para buscar elemento
    #preenchendo o campo e-mail
    find("input[id='user_email']").set user[:email]

    #preencher o campo senha
    find("input[id='user_password']").set user[:senha]

    #preencher o campo confirmar senha
    find("input[id='user_password_confirmation']").set user[:senha_confirma]

    #clicar no botão confirmar
    click_on "Cadastrar"
end                                                                           
                                                                                
  Então('devo ser redirecionado para a área logada') do
    #validação com rspec
    #a página deve conter o seletor css .dashboard
    expect(page).to have_css '.dashboard'
end                                                                           


#@email_invalido
Quando('submeto o meu cadastro sem o email') do
    find("input[id='user_password']").set "123456"
    find("input[id='user_password_confirmation']").set "123456"
    
    click_on "Cadastrar"
end

Então('devo ver Oops! Informe seu email') do
  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Informe seu email.'
end

#@senha_invalida
Quando('submeto o meu cadastro sem a senha') do

  find("input[id='user_email']").set "q@q.com"
  #find("input[id='user_password']").set user[:senha]
  find("input[id='user_password_confirmation']").set "123456"

  click_on "Cadastrar"

end

Então('devo ver Oops! Informe sua senha') do

  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Informe sua senha.'

end

#@senha_divergente
Quando('submeto meu cadastro com senha divergente') do   
  find("input[id='user_email']").set "3@2.com"
  find("input[id='user_password']").set "123456"
  find("input[id='user_password_confirmation']").set "654321"

  click_on "Cadastrar"
end                                                                          
                                                                             
Então('devo ver Opps! Senhas não são iguais') do   

  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Senhas não são iguais.'
  
end                                                                          

#@nenhum_campo_preenchido
Quando('submeto meu cadastro sem preencher os campos') do                       

  find("input[id='user_email']").set ""
  find("input[id='user_password']").set ""
  find("input[id='user_password_confirmation']").set ""

  click_on "Cadastrar"

end                                                                             
                                                                                
Então('devo ver Opps! Informe seu email e sua senha') do                        

  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Informe seu email e sua senha.'

end                                                                             

#@email_ja_cadastrado
#teria que aprender fazer um método para cadastrar e garantir
#que já existia a conta, nesse caso vou manter dessa forma mesmo 
Quando('submeto o meu cadastro com email, senha e confirmação da senha') do

    find("input[id='user_email']").set '1@2.com.br'
    find("input[id='user_password']").set '123456'
    find("input[id='user_password_confirmation']").set '123456'

  click_on "Cadastrar"
end

Então('devo ver Oops! Email já cadastrado') do
  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Email já cadastrado.'
end