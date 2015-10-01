class CreateTables < ActiveRecord::Migration

  # bundle exec rake db:create

  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps null: false
    end

    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.string :director
      t.string :image_url
      t.timestamps null: false
    end

    create_table :reviews do |t|
      t.integer :score
      t.text :comment
      t.timestamps null: false
    end
  end

end