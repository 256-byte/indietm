class Keyword < ApplicationRecord
  has_many :word_translations, dependent: :destroy
  has_many :translates, through: :word_translations

  accepts_nested_attributes_for :translates, reject_if: :all_blank, allow_destroy: true


  def self.list(keyword)
    if keyword.present?
      Keyword.where("lower(word) LIKE :search", search: "%#{keyword.downcase}%")
    else
      []
    end
  end

  def word_translations_attributes=(word_translation_attributes)
    word_translation_attributes.values.each do |translate_attribute|
      translate = Translate.create(name: translate_attribute["translate_attributes"]["translated"])
      self.translates << translate
    end
  end
end
