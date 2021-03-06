class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { only_integer: true, less_than_or_equal_to:1000 }
  validates :phone_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }

  validates_presence_of :provider, :location, :status, :pickupDate, :rechargeDate

  scope :trans_status_pickups                   , -> (                         ) { where "status                      LIKE ? or status LIKE ?",'Scheduled','Picked Up' }
  scope :trans_status_recharges                   , -> (                         ) { where "status                      LIKE ? or status LIKE ?",'Picked Up','Recharged' }


  def self.search(search_name, search_phone , search_amount, search_status, search_date )

    @transactions = Transaction.all
    search_name ? @transactions = Transaction.joins(:user).where('CAST(name as TEXT) LIKE ?', "%#{search_name}%") : @transactions
    search_amount ? @transactions = @transactions.where('CAST(transactions.amount as TEXT) LIKE ?', "%#{search_amount}%")  : @transactions
    search_phone ? @transactions = @transactions.where('CAST(transactions.phone_number as TEXT) LIKE ?', "%#{search_phone}%")  : @transactions
    search_status ? @transactions = @transactions.where('CAST(transactions.status as TEXT) LIKE ?', "%#{search_status}%")  : @transactions
    #search_date ? @transactions = @transactions.where('scheduledPickupStartDT||scheduledPickupEndDT||messagedPickupDT||pickedUpDT||rechargeDueDT||rechargedDT LIKE ?', "%#{search_date}%")  : @transactions
  end


end

