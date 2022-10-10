class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @bills = Bill.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bills_params)

    if @bill.save
      redirect_to bills_path, notice: "Bill was successfully uploaded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bill.update(bills_params)
      redirect_to bills_path, notice: "Bill was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path, notice: "Bill was successfully deleted."
  end

  def approve
    @bill = Bill.find(params[:id])
    @bill.approved = true
    if @bill.save
      redirect_to bills_path, notice: "Bill was successfully approved."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def list
    @bills = Bill.order("#{params[:column]} asc")
    render(partial: 'bills', locals: { bills: @bills })
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bills_params
    params.require(:bill).permit(:reference, :amount)
  end
end
