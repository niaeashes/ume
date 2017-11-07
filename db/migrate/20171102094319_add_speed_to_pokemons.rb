class AddSpeedToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :speed, :int
  end
end
