class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: "author_id", dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :gists, dependent: :destroy

  has_and_belongs_to_many :badges

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, 
                                                message: 'Введите корректный email'}

  def show_test_passage(level = 0..10)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
