require 'csv'

class Keyword < ApplicationRecord

  has_many :word_translations, dependent: :destroy
  has_many :translates, through: :word_translations

  accepts_nested_attributes_for :translates, reject_if: :all_blank, allow_destroy: true

  def marked_word(search_value)
    self.word.gsub(/#{Regexp.escape(search_value)}/i) { |match| "<b>#{match}</b>" }.html_safe
  end


  def self.list(keyword)
    if keyword.present?
      Keyword.where("lower(word) LIKE :search", search: "%#{keyword.downcase}%")
    else
      []
    end
  end

  def self.search(keyword)
    if keyword.present?
      Keyword.where("lower(word) LIKE :search", search: "%#{keyword.downcase}%")
    else
      Keyword.all
    end
  end

  def word_translations_attributes=(word_translation_attributes)
    word_translation_attributes.values.each do |translate_attribute|
      translate = Translate.create(name: translate_attribute["translate_attributes"]["translated"])
      self.translates << translate
    end
  end

  def self.import_dictionary
    CSV.foreach("Dictionary.csv") do |row|
      keyword = Keyword.find_or_create_by(word: row[0])
      word_class = row[1].split("/").to_a
      translate = Translate.create(translated: row[4], description: row[2], category: row[3].downcase, word_class: word_class)
      WordTranslation.create(keyword_id: keyword.id, translate_id: translate.id)
    end
  end
end
