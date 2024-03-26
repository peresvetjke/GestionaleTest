class Customer::ContactsController < ApplicationController
  def new
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @contact = @user.build_contact
  end

  def create
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @contact = @user.build_contact(contact_params)
    if @contact.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @contact = @user.contact
  end

  def update
    @breadcrumbs = []
    @user = Customer::User.find(params[:user_id])
    @contact = @user.contact
    if @contact.update(contact_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @breadcrumbs = ["Clienti"]
    @subtitle = "Contatti"
    @user = Customer::User.find(params[:user_id])
    @contact = @user.contact
    @title = "#{@user.first_name} #{@user.last_name}"
  end

  def destroy
    @user = Customer::User.find(params[:user_id])
    @contact = @user.contact
    @contact.destroy

    redirect_to @user
  end

  private

  def contact_params
    params.require(:customer_contact).permit(
      :fiscal_code,
      :email,
      :vat_number,
      :phone_number
    )
  end
end
