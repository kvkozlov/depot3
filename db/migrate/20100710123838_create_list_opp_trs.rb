class CreateListOppTrs < ActiveRecord::Migration
  def self.up
    create_table :list_opp_trs do |t|
      t.string :opp_tr_type,:limit => 10
      t.string :description
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :list_opp_trs
  end
end
