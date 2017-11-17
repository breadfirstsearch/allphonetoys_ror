json.extract! transaction, :id, :amount, :phone_number, :provider, :location, :status, :scheduledPickupStartDT, :scheduledPickupEndDT, :messagedPickupDT, :pickedUpDT, :rechargeDueDT, :rechargedDT, :remarks, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
