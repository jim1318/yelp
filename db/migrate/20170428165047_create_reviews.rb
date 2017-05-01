class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :review_text
      t.integer :user_id
      t.integer :business_id
      t.timestamps
    end
  end
end
