class AddRelationships < ActiveRecord::Migration

  def change
    change_table :reviews do |t|
      t.references :user
      t.references :movie
    end
  end

end