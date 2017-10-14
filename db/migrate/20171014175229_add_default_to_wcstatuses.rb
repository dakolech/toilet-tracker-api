class AddDefaultToWcstatuses < ActiveRecord::Migration[5.0]
  def change
    change_column :wcstatuses, :is_busy, :boolean, default: :true
  end
end
