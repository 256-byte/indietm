class Keyword < ApplicationRecord
  has_many :word_translations, dependent: :destroy
  has_many :translates, through: :word_translations
end
