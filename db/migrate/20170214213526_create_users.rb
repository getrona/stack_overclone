class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :image, :string
      t.column :reputation, :integer
      t.column :gold, :integer
      t.column :silver, :integer
      t.column :bronze, :integer
      t.column :job, :string
      t.column :location, :string
      t.column :profile_views, :integer

      t.timestamps
    end
  end
end
