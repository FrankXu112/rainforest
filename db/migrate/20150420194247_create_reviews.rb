class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :username
      t.references :product
      t.references :user

      t.timestamps null: false
    end
  end
end
