Dado('que acesso a página de cadastro') do       
    visit "http://parodify.qaninja.com.br"
end                                                                           
                                                                                
  Quando('submeto o meu cadastro com:') do |table|     
    #converte a tabela que está entre pipe para um objeto nativo do ruby                  
    log table.rows_hash
end                                                                           
                                                                                
  Então('devo ser redirecionado para a área logada') do                         
    pending # Write code here that turns the phrase above into concrete actions 
end                                                                           