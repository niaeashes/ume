require 'rails_helper'

RSpec.describe "Pokemons Resource", type: :request do

  describe "GET /pokemons/new" do
    it do
      get '/pokemons/new'
      expect(response).to have_http_status :ok
      expect(response).to render_template :new
    end
  end

end
