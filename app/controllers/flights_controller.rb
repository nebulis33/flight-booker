class FlightsController < ApplicationController
    def index
        @airport_options = Airport.all.map{ |a| [a.airport_code, a.id] } #loading everytime, scope this or something so it loads once
        @days = Flight.all.map{ |f| f.start_datetime }
        @flights = Flight.where("from_airport_id = ? AND to_airport_id = ?", params[:from_airport], params[:to_airport]).map{ |f| f.id }
        render "flights/index"
    end

end