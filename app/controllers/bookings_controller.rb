class BookingsController < ApplicationController
    before_action :sanitize_params
    def new
        @flight = Flight.find(@flight_id)
        @passenger = Passenger.new
        @booking = @flight.bookings.new
        @passengers.times { @booking.passengers.build }
    end

    def create
        @passenger = Passenger.new(passenger_params)
        @flight = Flight.find(params[:booking][:flight_id])
        @booking = @flight.bookings.new(booking_params)
        if @passenger.save
            @booking = @passenger.bookings.build(booking_params)
            if @booking.save
                flash[:success] = "Booking saved"
                redirect_to @booking
            end
        end
    end

    def show
        @booking = Booking.find(params[:id])
        @passengers = Passenger.where("booking_id = ?", params[:id])
        @flight = Flight.find(@flight_id)
    end

    private

        def sanitize_params
            @flight_id = params[:id].to_i
            @passengers = params[:num_passengers].to_i
        end

        def booking_params
            params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
        end

        def passenger_params
            params.require(:booking).permit(passenger: [:name, :email])
        end
end