class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
      end

      def new
        @booking = Booking.new
      end

      def create
        @course = Course.find(params[:booking][:course_id])
        @booking = Booking.new(booking_params)
        @booking.date = get_booking_date(booking_params)
        @booking.user = current_user
        if @booking.save
          flash[:notice] = 'Course has been successfully booked'
          redirect_to courses_path
        else
          render 'course/show'
        end
      end
      
      def destroy
        @booking = Booking.find(params[:id])
        @course = Course.find(@booking.course_id)
        if Booking.delete(params[:id]).positive?
          flash[:success] = 'Booking has been cancelled'
        else
          flash[:error] = 'You fucked up ! , please try again'
        end
        redirect_to booking_path(@booking)
      end

      private

      def get_booking_date(params)
        "#{params["date(3i)"]}/#{params["date(2i)"]}/#{params["date(1i)"]}"
      end

      def booking_params
        params.require(:booking).permit(:course_id, :date)
      end


end
