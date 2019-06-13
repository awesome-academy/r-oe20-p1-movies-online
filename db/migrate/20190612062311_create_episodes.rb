class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :name
      t.references :movie, foreign_keys: true
      t.string :url_content
      t.string :image
      t.timestamps
    end
  end
end
