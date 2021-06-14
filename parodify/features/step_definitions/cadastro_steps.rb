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


#@email_Invalido
Quando('submeto o meu cadastro sem o email') do
    find("input[id='user_password']").set "123456"
    find("input[id='user_password_confirmation']").set "123456"
    
    click_on "Cadastrar"
end

Então('devo ver Oops! Informe seu email') do
  alert = find(".message p")
  expect(alert.text).to eql 'Oops! Informe seu email.'
end