class User < ActiveRecord::Base
  attr_accessible :username, :password_hash, :session_id, :password
  attr_reader :password

  validates :username, presence: true
  validates :password_hash, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true}
  validates :session_token, presence: true
  after_initialize :ensure_session_token

  has_many(
  :subs,
  class_name: "Sub",
  foreign_key: :moderator_id,
  primary_key: :id
  )

  has_many(
  :comments,
  class_name: 'Comment',
  foreign_key: :author_id,
  primary_key: :id)

  def password=(password)
    @password=password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end


  def self.has_password?(username, password)
    user = User.find_by_username(username)
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
