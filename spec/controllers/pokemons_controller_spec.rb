require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do

  describe "GET #index" do

    it do
      get :index
      expect(response).to have_http_status :ok
    end

    let(:pokemons) { build_list :pokemon, 100 }
    it do
      allow(Pokemon).to receive(:all) { pokemons }
      get :index
      expect(assigns[:pokemons]).to eq pokemons
      expect(assigns[:pokemons].length).to eq 100
    end

  end

end
