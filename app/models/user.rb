class User < ApplicationRecord
  has_secure_password

  validates :name, :birthdate, :gender, :level, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true, on: :create
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }

  enum gender: [:maskla, :ina, :alia]
  enum level:  [:baza, :meza, :progresinta, :flua]

  has_many :locales

  accepts_nested_attributes_for :locales, allow_destroy: true
end
