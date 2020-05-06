class CreateHobbiesPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :hobbies_people, id: false do |t|
      t.references :person, null: false, foreign_key: true
      t.references :hobby, null: false, foreign_key: true
    end
  end
end
