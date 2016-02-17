class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :author
      t.text :script

      t.timestamps null: false
    end
  end
end
