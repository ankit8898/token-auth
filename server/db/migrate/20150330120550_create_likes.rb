class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer    :likeable_id
      t.string     :likeable_type
      t.belongs_to :author
      t.timestamps null: false
    end
  end
end
