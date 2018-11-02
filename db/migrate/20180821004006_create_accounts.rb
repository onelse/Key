class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :keycate
      t.string :keyname
      t.string :keyid
      t.string :keypw
      t.text   :keydesc
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
