Dado("que acesso a página de login") do
  visit "http://parodify.qaninja.com.br"
  click_on "Login"
end

Quando("submeto minhas credenciais com: {string} e {string}") do |email, senha|
  find("input[id=user_email]").set email
  find("input[id=user_password]").set senha
  click_on "Log in"
end

Então ("devo ver a mensagem de erro: {string}") do |expect_message|
  message find(".message .message-body")
  expect(message.text).to eql expect_message
end
