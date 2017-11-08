class PokemonsController < ApplicationController
  before_action :set_pokemon, only: :show

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new create_params
    @pokemon.skills.build name: "なきごえ"
    if @pokemon.save
      redirect_to @pokemon
    else
      render :new
    end
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find params[:id]
  end

  def create_params
    params.require(:pokemon).permit(:name, :basename, :type1, :type2)
  end

end
