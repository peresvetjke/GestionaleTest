class Customer::UsersController < ApplicationController
  def index
    @breadcrumbs = ["Clienti"]
    @title = "Clienti"
    @subtitle = "Lista"
    @users = Customer::User.all
  end

  def new
    @breadcrumbs = []
    @user = Customer::User.build
  end

  def create
    @breadcrumbs = []
    @user = Customer::User.new(user_params)
    if @user.save
      redirect_to customer_users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @breadcrumbs = []
    @user = Customer::User.find(params[:id])
  end

  def update
    @breadcrumbs = []
    @user = Customer::User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = Customer::User.find(params[:id])
    redirect_to customer_user_contact_path(@user)
  end

  private

  def user_params
    params.require(:customer_user).permit(:first_name, :last_name)
  end
end
