class FlightsController < ApplicationController
    before_action :sanitize_params

    def index
        @airport_options = Airport.all.map{ |a| [a.airport_code, a.id] } #loading everytime, scope this or something so it loads once, maybe its the render
        @days = Flight.all.map{ |f| f.start_datetime }
        @flights = Flight.where("from_airport_id = ? AND to_airport_id = ?", @departure, @arrival).map{ |f| f.id }
        render "flights/index"
    end

    private

        def sanitize_params
            @departure = params[:from_airport].to_i
            @arrival = params[:to_airport].to_i
        end
end