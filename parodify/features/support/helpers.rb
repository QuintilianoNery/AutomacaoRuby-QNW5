require "HTTParty"

#Função que chama a api de exclusão do cadastro que usa determinado e-mail
module Helpers
  def apagar_cadastro(email)
    HTTParty.get("http://parodify.qaninja.com.br/helpers?email=#{email}")
  end
end
