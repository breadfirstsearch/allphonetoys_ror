class User < ApplicationRecord
  has_many :transactions

  validates :name,  presence: true, length: { maximum: 50 }

  validates :password,  presence: true, length: { maximum: 50 }

  validates :prefAmount,numericality: { only_integer: true, less_than_or_equal_to:1000 }

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => Devise::email_regexp

  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }

  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end

  def self.search(search_name, search_phone , search_amount, search_email, search_provider, search_location )

    @users = User.all
    search_name ? @users = User.where('name LIKE ?', "%#{search_name}%") : @users
    search_amount ? @users = @users.where('prefAmount LIKE ?', "%#{search_amount}%")  : @users
    search_phone ? @users = @users.where('phone LIKE ?', "%#{search_phone}%")  : @users
    search_email ? @users = @users.where('email LIKE ?', "%#{search_email}%")  : @users
    search_provider ? @users = @users.where('prefProvider LIKE ?', "%#{search_provider}%")  : @users
    search_location ? @users = @users.where('prefLocation LIKE ?', "%#{search_location}%")  : @users

  end


end
