class CreateSwots < ActiveRecord::Migration
  def self.up
    create_table :swots do |t|
      t.string :name
      t.string :name_org
      t.text :address
      t.string :email
            
      t.timestamps
    end
  end

  def self.down
    drop_table :swots
  end
end
