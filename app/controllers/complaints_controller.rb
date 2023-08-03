class ComplaintsController < ApplicationController
  before_action :require_signin 
  
  def index
    @complaints = Complaint.all
  end
  
  def new
    @complaint = Complaint.new 
  end

  def create
    @maid = Maid.find(params[:id])
    @complaint = Complaint.new(complaint_params)
    @complaint.maid = @maid
    @complaint.client = current_user
    if @complaint.save
      redirect_to @maid, notice: "Complaint sent. We'll review it soon."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def complaint_params
    params.require(:complaint).permit(:message)
  end
end
