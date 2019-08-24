class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.date :departure_date
      t.date :arrival_date
      t.time :arrival_hour
      t.string :arrival_place
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
