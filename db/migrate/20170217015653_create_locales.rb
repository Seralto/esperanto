class CreateLocales < ActiveRecord::Migration[5.0]
  def change
    create_table :locales do |t|
      t.string :country_acronym
      t.string :state_acronym
      t.string :city_name
      t.integer :locale_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
