class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.column :answer, :string
      t.references :answerable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
