class User < ApplicationRecord
  has_many :transactions

  validates :name,  presence: true, length: { maximum: 50 }

  validates :password,  presence: true, length: { maximum: 50 }

  validates :pref_amount,numericality: { only_integer: true, less_than_or_equal_to:1000 }

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => Devise::email_regexp
  
  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }
  before_create { generate_token(:auth_token) }
  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end

  def self.search(search_name, search_phone , search_amount, search_email, search_provider, search_location )
    
    @users = User.all
    search_name ? @users = User.where('CAST(name as TEXT) LIKE ?', "%#{search_name}%") : @users
    search_amount ? @users = @users.where('CAST(pref_amount as TEXT) LIKE ?', "%#{search_amount}%")  : @users
    search_phone ? @users = @users.where('CAST(phone as TEXT)  LIKE ?', "%#{search_phone}%")  : @users
    search_email ? @users = @users.where('CAST(email as TEXT)  LIKE ?', "%#{search_email}%")  : @users
    search_provider ? @users = @users.where('CAST(pref_provider as TEXT)  LIKE ?', "%#{search_provider}%")  : @users
    search_location ? @users = @users.where('CAST(pref_location as TEXT) LIKE ?', "%#{search_location}%")  : @users
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
