class User < ApplicationRecord
  before_create :confirmation_token

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

  scope :user_name, -> (name) { where "lower(name) like ?", "%#{name.downcase}%" }
  scope :user_email, -> (email) { where "lower(email) like ?", "%#{email.downcase}%" }
  scope :user_phone, -> (phone) { where "phone = ?", phone }
  scope :user_pref_amount, -> (prefAmount) { where "prefAmount = ?", prefAmount }
  scope :user_pref_provider, -> (prefProvider) { where "prefProvider = ?", prefProvider }
  scope :user_pref_location, -> (prefLocation) { where "prefLocation = ?", prefLocation }

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    self.save(:validate => false)
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

end
