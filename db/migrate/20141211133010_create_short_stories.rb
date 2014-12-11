class CreateShortStories < ActiveRecord::Migration
  def change
    create_table :short_stories do |t|

      t.string :title
      t.text :content
      t.string :short_description
      t.integer :author_id
      t.timestamps
    end
  end
end
