class User < ApplicationRecord
  has_many :generals, dependent: :destroy
  has_many :comments, through: :generals, source: :generalable,
           source_type: :Comment
  has_many :ratings, through: :generals, source: :generalable,
           source_type: :Rating

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {minimum: Settings.name_min,
                                            maximum: Settings.name_max}
  validates :email, presence: true, length: {maximum: Settings.email_max},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: {minimum: Settings.password_min}

  private

  def downcase_email
    self.email = email.downcase
  end
end
