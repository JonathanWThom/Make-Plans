class AddStringHappeningAtField < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :happening_at_string, :string
    add_column :activities, :happening_at_string, :string
  end
end
