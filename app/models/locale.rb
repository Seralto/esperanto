class Locale < ApplicationRecord
  validates :country_acronym, :state_acronym, :city_name, presence: true

  enum locale_type: [:naskiĝo, :aktuala]

  belongs_to :user
end
