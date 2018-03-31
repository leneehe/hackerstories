class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories, id: false do |t|
      t.integer :id
      t.string :title
      t.string :url
      t.string :site
      t.integer :points
      t.string :author
      t.string :time
      t.integer :comments

      t.timestamps
    end
  end
end
