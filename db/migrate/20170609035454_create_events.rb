class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
    end

    create_table :activities_events do
      t.belongs_to :activities, index: true
      t.belongs_to :events, index: true
    end
  end
end


events have and belong to many activites
activities have and belong to many events
users have many actitivies
users have many events

has many through? 
