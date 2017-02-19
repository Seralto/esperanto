class LocalesController < ApplicationController
  def index
    country = params[:country]
    state = params[:state]

    if state
      result = CS.cities(state, country)
    elsif country
      result = CS.states(country)
    else
      result = CS.countries
    end

    render json: result
  end
end
