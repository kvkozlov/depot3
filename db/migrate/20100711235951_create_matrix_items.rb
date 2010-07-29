class CreateMatrixItems < ActiveRecord::Migration
  def self.up
    create_table :matrix_items do |t|
      t.integer :list_opp_tr_id, :null => false, :options =>
        "CONSTRAINT fk_matrix_item_list_opp_trs REFERENCES list_opp_trs(id)"
      t.integer :list_str_wk_id, :null => false, :options =>
        "CONSTRAINT fk_matrix_item_list_str_wks REFERENCES list_str_wks(id)"
      t.integer :swot_id, :null => false, :options =>
        "CONSTRAINT fk_matrix_item_swots REFERENCES swots(id)"
      t.float :value
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end

  def self.down
    drop_table :matrix_items
  end
end
