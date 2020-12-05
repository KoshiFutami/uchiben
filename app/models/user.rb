class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :vocabs
  has_many :learnings, dependent: :destroy
  has_many :learning_vocabs, through: :learnings, source: :vocab
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  def to_param
    username
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end

  def self.create_user_ranks
    User.find(Vocab.group(:user_id).order('count(user_id) desc').limit(5).pluck(:user_id))
  end



end
