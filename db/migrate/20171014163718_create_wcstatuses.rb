class CreateWcstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :wcstatuses do |t|
      t.boolean :is_busy

      t.timestamps
    end
  end
end
