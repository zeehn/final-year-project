class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy accept withdraw complete]
  
  def index
    if current_user_admin?
      @orders = Order.all
    else 
      @orders = current_user.orders.all
    end
  end

  def show
  end

  def new
    session[:maid_id] = params[:maid_id]
    @order = Order.new
  end

  def edit
  end
  
  def accept
    if @order.pending? 
      @order.inprogress!
      redirect_to @order, notice: "Offer accepted!"
    else 
      redirect_to @order, notice: "Offer can't be accepted!"
    end
  end

  def withdraw
    if @order.pending?
      @order.cancel!
      redirect_to @order, notice: "Order cancelled"
    else
      redirect_to orders_path, notice: "Can't cancel."
    end
  end

  def complete
    if @order.inprogress?
      @order.completed!
      redirect_to new_maid_review_path(@order.maid_id), notice: "Order completed."
    else
      redirect_to @order, notice: "Order can't be completed"
    end
  end

  def create
    maid = Maid.find(session[:maid_id])    
    @order = current_user.orders.new(order_params)
    @order.maid = maid
    @order.hourly = maid.hourly_rate 
    
    respond_to do |format|
      if @order.save
        session[:maid_id] = nil
        format.html { redirect_to current_user, notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_maid
      @maid = Maid.find(params[:maid_id])
    end
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:schedule_date, :time_from, :time_to, :instructions, :client_id, :maid_id, :pay_type)
    end
end
