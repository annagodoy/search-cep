class CepSearch
  include Interactor

  def call
    raise 'cep não pode ser vazio' if context.cep.blank?
    raise 'usuário inválido' if context.user.blank?

    url = "#{Services.cep_api}/ws/#{context.cep}/json"

    context.result = HTTParty.get(url).parsed_response

    register_search
  rescue => e 
    context.fail!(error: e.message)
  end

  private

  def user 
    @user ||= context.user
  end

  def register_search
    search = user.user_searches.new(
      address: "#{context.result['logradouro']} - #{context.result['bairro']} - #{context.result['cep']} - #{context.result['localidade']} - #{context.result['uf']}",
      street: context.result['logradouro'],
      neighborhood: context.result['bairro'],
      zip_code: context.result['cep'],
      city: context.result['localidade'],
      state: context.result['uf'],
    )
    
    if search.save
      context.search = search
    end
  end
end