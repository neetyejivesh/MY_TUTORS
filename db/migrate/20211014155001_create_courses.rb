class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :photo_url
      t.string :duration
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
