class Addawardstoauthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :awards, :attachments  
  end
end
