class WordTranslation < ApplicationRecord
  belongs_to :keyword
  belongs_to :translate
end
