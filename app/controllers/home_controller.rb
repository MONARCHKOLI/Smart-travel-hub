class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @weather = nil

    if params[:lat].present? && params[:lng].present?
      @weather = WeatherService.get_weather(
        params[:lat],
        params[:lng]
      )
    end
  end
end
