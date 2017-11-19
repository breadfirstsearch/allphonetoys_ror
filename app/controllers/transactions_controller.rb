class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, :admin_privacy, only: [:todays_pickups, :todays_recharges]

  # GET /transactions
  # GET /transactions.json
  def index
   if session[:user_id]
      @transactions = Transaction.where(user_id: session[:user_id])
   elsif session[:admin_id]
      @transactions = Transaction.where(nil)
   else
      redirect_to login_path
   end

   @transactions = Transaction.search(params[:search_name], params[:search_phone] , params[:search_amount], params[:search_status], params[:search_date ])
  end

  def todays_pickups
    @@carrierFile = YAML.load(File.read(File.expand_path('../../../config/sms-easy.yml', __FILE__)))
    @transactions = Transaction.where("SUBSTR(\"pickupDate\", 1, 11) = ?", Date.today.strftime("%d %b %Y")) #Filter only transactions to be picked up today
    @transactions = @transactions.trans_status_pickups() #Filter only transactions with status =scheduled or picked up
  end

  def todays_recharges
    @transactions = Transaction.where("(\"rechargeDate\") = ?", Date.today.strftime("%d %b %Y"))#filter only transactions to be recharged today
    @transactions = @transactions.trans_status_recharges() #Filter only transactions with status =picked up or recharged
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @timingsList = []
    @datesList = []
    @timings = Timing.find_by_sql("SELECT day, hours, minutes, ampm FROM timings")
    @timings.each do |timing|
      timing.day = date_of_next(timing.day).strftime("%d %b %Y") + " - " + timing.hours + ":" + timing.minutes + " " + timing.ampm
      @timingsList.push([timing.day, timing.day])
    end
    for i in 1..10
      @datesList.push([(Date.today+i).strftime("%d %b %Y"), (Date.today+i).strftime("%d %b %Y")])
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.update(user_id: session[:user_id])
    @transaction.update(status: 'Scheduled')


    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def do_pickup
    transaction = Transaction.find(params[:id])

    if (transaction.status == 'Scheduled')
      transaction.status='Picked Up' #status=picked up
      carrierEmail = @@carrierFile['carriers'][transaction.provider.downcase]['value'] #get the sms email address for this provider
      SmsMailer.send_receipt(transaction,carrierEmail).deliver
    elsif (transaction.status == 'Picked Up')
      transaction.status = 'Scheduled'
    end
    transaction.save
    redirect_back fallback_location: root_path
  end

  def do_recharge
    transaction = Transaction.find(params[:id])
    if (transaction.status == 'Picked Up')
      transaction.status='Recharged' #status=recharged
    elsif (transaction.status == 'Recharged')
      transaction.status = 'Picked Up'
    end
    transaction.save
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :phone_number, :provider, :location, :status, :scheduledPickupStartDT, :scheduledPickupEndDT, :messagedPickupDT, :pickedUpDT, :rechargeDueDT, :rechargedDT, :remarks, :search_name, :search_phone , :search_amount, :search_status, :search_date, :pickupDate, :rechargeDate)
    end
end
