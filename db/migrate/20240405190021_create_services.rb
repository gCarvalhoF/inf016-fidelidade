class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.datetime :completed_at

      t.references :user

      t.timestamps
    end
  end

end
