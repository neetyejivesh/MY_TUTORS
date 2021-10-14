class CoursesController < ApplicationController

    def index
        @courses = Course.all
      end
      def new
        @course = Course.new
      end

      def show
        @course = course.find(params[:id])
        @booking = Booking.new
      end

      def create
        @course = Course.new(course_params)
        @course.save
        redirect_to course_path(@course)
      end

      def update
        @course = Course.find(params[:id])
        @course.update(course_params)
        flash[:notice] = 'course information has been updated'
        redirect_to course_path
      end

      def destroy
        @course.destroy
        redirect_to courses_path
      end

      private

      def set_course
        @course = Course.find(params[:id])
      end

      def course_params
        params.require(:course).permit(:title, :description, :photo_url, :duration)
      end
   


end
