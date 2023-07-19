class MaidsController < ApplicationController
  before_action :set_maid, only: %i[ show edit update destroy ]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy] 
  # GET /maids or /maids.json
  def index
    @maids = Maid.all
  end

  # GET /maids/1 or /maids/1.json
  def show
  end

  # GET /maids/new
  def new
    @maid = Maid.new
  end

  # GET /maids/1/edit
  def edit
  end

  # POST /maids or /maids.json
  def create
    @maid = Maid.new(maid_params)

    respond_to do |format|
      if @maid.save
        format.html { redirect_to maid_url(@maid), notice: "Maid was successfully created." }
        format.json { render :show, status: :created, location: @maid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maids/1 or /maids/1.json
  def update
    respond_to do |format|
      if @maid.update(maid_params)
        format.html { redirect_to maid_url(@maid), notice: "Maid was successfully updated." }
        format.json { render :show, status: :ok, location: @maid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maids/1 or /maids/1.json
  def destroy
    @maid.destroy

    respond_to do |format|
      format.html { redirect_to maids_url, notice: "Maid was successfully destroyed." }
      format.json { head :no_content }
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
