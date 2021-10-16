class RemoveBookingFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :booking_id 

  end
end
