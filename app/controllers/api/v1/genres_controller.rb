class Api::V1::GenresController < ApplicationController
  def index
    @genres = Livehouse.pluck(:genres).flatten.uniq
    render json: @genres
  end
end
