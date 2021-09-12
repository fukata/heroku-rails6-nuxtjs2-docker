class DummyController < ApplicationController
  def index
    data = {
      data: 100.times.map{
        {
          id: SecureRandom.uuid,
          name: Faker::Name.name,
        }
      }
    }
    render json: data and return
  end
end
