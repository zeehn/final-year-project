class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
 
  def index
    @clients = Client.all
  end

  def show
    @pending_orders = @client.orders.pending.limit(3)
    @scheduled_orders = @client.orders.in_progress
    @completed_orders = @client.orders.completed.limit(2)
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        session[:user_id] = @client.email
        format.html { redirect_to client_url(@client), notice: "Account created successfully!" }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Account successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    session[:user_id] = nil if session[:user_id] = @client.email
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :city, :state, :country, :zip)
    end
  
    def require_correct_user
      @user = Client.find(params[:id])
      unless current_user?(@user)
        redirect_to current_user, notice: "Unauthorized access!"
      end
    end

end
