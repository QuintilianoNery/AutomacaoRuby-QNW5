Dado('que acesso a página de cadastro') do       
    visit "http://parodify.qaninja.com.br"
    click_on "EXPERIMENTE AGORA"
end                                                                           
                                                                                
  Quando('submeto o meu cadastro com:') do |table|     
    #converte a tabela que está entre pipe para um objeto nativo do ruby              
    #guardar na variável user    
    user = table.rows_hash
    #find método do capybara para buscar elemento
    #preenchendo o campo e-mail
    find("input[id='user_email']").set user[:email]
    #preencher o campo senha
    find("input[id='user_password']").set user[:senha]
    #preencher o campo confirmar senha
    find("input[id='user_password_confirmation']").set user[:senha_confirma]
end                                                                           
                                                                                
  Então('devo ser redirecionado para a área logada') do
  #clicar no botão confirmar
   click_on "Cadastrar"
end                                                                           