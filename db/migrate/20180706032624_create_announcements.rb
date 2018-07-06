class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.numeric :pet, null: false
      t.string :name
      t.string :description, null: false
      t.string :prevalent_color, null: false
      t.numeric :size, null: false
      t.string :race
    end
  end
end
