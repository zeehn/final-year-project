class MaidsController < ApplicationController
  before_action :set_maid, only: %i[ show edit update destroy dashboard block approve]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy] 
  
  def index
    @maids = Maid.active
  end

  def show
  end

  def new
    @maid = Maid.new
  end

  def edit
  end

  def create
    @maid = Maid.new(maid_params)

    respond_to do |format|
      if @maid.save
        format.html { redirect_to maid_url(@maid), notice: "Account successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @maid.update(maid_params)
        format.html { redirect_to maid_url(@maid), notice: "Account successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @maid.destroy

    respond_to do |format|
      format.html { redirect_to maids_url, notice: "Maid was successfully destroyed." }
    end
  end
  
  def dashboard    
    @new_orders = @maid.orders.pending
    @progress_orders = @maid.orders.in_progress
  end

  def block
    if !@maid.blocked?
      @maid.update_columns(status: 2)
      redirect_to current_user
    end
  end

  def approve
    if @maid.pending? || @maid.blocked?
      @maid.update_columns(status: 1)
      redirect_to current_user
    end    
  end

  private
    def set_maid
      @maid = Maid.find(params[:id])
    end

    def maid_params
      params.require(:maid).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :city, :state, :zip, :hourly_rate)
    end

    def require_correct_user
      @user = Maid.find(params[:id])
      unless current_user?(@user)
        redirect_to current_user, notice: "Unauthorized access!"
      end
    end
end
