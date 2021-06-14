require "HTTParty"

module Helpers
    
    def apagar_cadastro(email)
        HTTParty.get("http://parodify.qaninja.com.br/helpers?email=#{email}")
    end
end