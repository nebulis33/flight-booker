class PassengerMailer < ApplicationMailer
    default from: 'FlightBookerConfirmation@example.com'
    def thanks_email(passenger)
        # @booking = booking
        @passenger = passenger#Passenger.where("booking_id = ?", @booking.id).to_a
        @booking_url = 'http://localhost:3000/bookings/'
        mail(to: @passenger.email, subject: "Thanks for booking your flight!")
    end
end
