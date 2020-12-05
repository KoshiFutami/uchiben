class Vocab < ApplicationRecord
  belongs_to :user
  has_many :learnings, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :translation
    validates :sentence
  end

  scope :recent, -> { order(created_at: :desc) }

  def learning_by?(user)
    learnings.where(user_id: user.id).exists?
  end

  def self.create_learning_ranks
    Vocab.find(Learning.group(:vocab_id).order('count(vocab_id) desc').limit(5).pluck(:vocab_id))
  end




  def self.search(search)
    if search
      if search.match(/[一-龠々]/)
        converted_search = search.to_kanhira.to_roman
      elsif search.is_hira? || search.is_kana?
        converted_search = search.to_roman
      else
        converted_search = search
      end
      Vocab.where(['converted_name LIKE ? OR converted_translation LIKE ?', "%#{converted_search}%", "%#{converted_search}%"])
      # Vocab.where(['converted_name LIKE ? OR converted_translation LIKE ? OR converted_sentence LIKE ?', "%#{converted_search}%", "%#{converted_search}%", "%#{converted_search}%"])
      # Vocab.where(['name LIKE ? OR translation LIKE ? OR sentence LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    # else 
    #   Vocab.all
    end
  end

  def self.convert_to_roman(vocab)
    if vocab.name.match(/[一-龠々]/)
      vocab.converted_name = vocab.name.to_kanhira.to_roman
    elsif vocab.name.is_hira? || vocab.name.is_kana?
      vocab.converted_name = vocab.name.to_roman
    else
      vocab.converted_name = vocab.name
    end

    if vocab.translation.match(/[一-龠々]/)
      vocab.converted_translation = vocab.translation.to_kanhira.to_roman
    elsif vocab.translation.is_hira? || vocab.translation.is_kana?
      vocab.converted_translation = vocab.translation.to_roman
    else
      vocab.converted_translation = vocab.translation
    end

    # if vocab.sentence.match(/[一-龠々]/)
    #   vocab.converted_sentence = vocab.sentence.to_kanhira.to_roman
    # elsif vocab.sentence.is_hira? || vocab.sentence.is_kana?
    #   vocab.converted_sentence = vocab.sentence.to_roman
    # else
    #   vocab.converted_sentence = vocab.sentence
    # end
  end

end
