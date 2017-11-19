class SmsMailer < ApplicationMailer
  def send_receipt(transaction,carrierEmail)
    message ="You have paid $" + transaction.amount.to_s + " to recharge your " + transaction.provider + " plan on "+transaction.rechargeDate
    mail(:to => transaction.phone_number.to_s+carrierEmail, :from => "habib1.baig@gmail.com", :subject => "AllPhoneToys Receipt for "+transaction.user.name) do |format|
      format.text { render plain: message }
    end
  end
end
