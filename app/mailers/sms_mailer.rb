class SmsMailer < ApplicationMailer
  def send_receipt(transaction)
    message ="You have paid $" + transaction.amount.to_s + " to recharge your " + transaction.provider + " plan on "+transaction.rechargeDate
    mail(:to => transaction.user.email, :from => "habib1.baig@gmail.com", :subject => "AllPhoneToys Receipt for "+transaction.user.name) do |format|
      format.text { render plain: message }
    end
  end
end
