class Translate < ApplicationRecord
  has_many :word_translations, dependent: :destroy
  has_many :keywords, through: :word_translations

  enum category: [:credits, :labels, :grades, :actions, :status, :genre]

end
