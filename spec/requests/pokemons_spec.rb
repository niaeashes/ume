require 'rails_helper'

RSpec.describe "Pokemons Resource", type: :request do

  describe "GET /pokemons/new" do
    it do
      get '/pokemons/new'
      expect(response).to have_http_status :ok
      expect(response).to render_template :new
    end
  end

  describe "POST /pokemons" do

    def send_request
      post '/pokemons', params: { pokemon: attributes }
    end

    context "with correct attributes" do
      let(:attributes) { attributes_for :pokemon }
      it do
        send_request
        expect(assigns[:pokemon]).not_to be_nil
        expect(response).to redirect_to "/pokemons/#{assigns[:pokemon].id}"
      end
      it { expect { send_request }.to change { Pokemon.count }.by 1 }
    end

    context "with incorrect attributes (without name)" do
      let(:attributes) { attributes_for :pokemon, name: nil }
      it do
        send_request
        expect(assigns[:pokemon]).not_to be_nil
        expect(response).to render_template :new
      end
      it { expect { send_request }.not_to change { Pokemon.count } }
    end

  end

end
