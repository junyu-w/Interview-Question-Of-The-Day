class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :votes
      t.string :source_url
      t.boolean :selected

      t.timestamps
    end
  end
end
