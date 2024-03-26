class Customer::AddressesController < ApplicationController
  def index
    @breadcrumbs = ["Clienti"]
    @subtitle = "Indirizzi"
    @user = Customer::User.find(params[:user_id])
    @title = "#{@user.first_name} #{@user.last_name}"
  end

  def new
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @address = @user.addresses.build
  end

  def create
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @address = @user.addresses.build(address_params)
    if @address.save
      redirect_to customer_user_addresses_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
  end

  def update
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to customer_user_addresses_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = Customer::User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
    @address.destroy

    redirect_to customer_user_addresses_path(@user)
  end

  private

  def address_params
    params.require(:customer_address).permit(
      :country,
      :province,
      :city,
      :postcode,
      :name
    )
  end
end
