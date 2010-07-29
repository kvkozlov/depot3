class CreateListStrWks < ActiveRecord::Migration
  def self.up
    create_table :list_str_wks do |t|
      t.string :name
      t.string :description
      t.string :feature_type,:limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :list_str_wks
  end
end
