class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|

      t.string :title
      t.text :content
      t.string :metaphor
      t.integer :author_id
      t.timestamps
    end
  end
end
