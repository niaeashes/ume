require 'rails_helper'

RSpec.describe "Users routing", type: :routing do
  it { expect(get: "/users").to route_to action: "index", controller: "users" }
end
