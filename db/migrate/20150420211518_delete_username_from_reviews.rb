class DeleteUsernameFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :username
  	rename_column :reviews, :content, :comment
  end
end
