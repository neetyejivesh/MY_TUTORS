class AddCourseIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings , :course, foreign_key: true 
  end
end
