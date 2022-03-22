class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    render_users
  end

  def show; end

  def new; end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_user

    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :user_options, :user_manager_email, :organisation_options

  def user_options
    if @user.organisation.users.length <= 1 && @user.manager_id.nil?
      ['No users in this organisation']
    else
      User.all.where(organisation: current_user.organisation).map do |user|
        [user.email, user.id]
      end
    end
  end

  def organisation_options
    Organisation.all.map do |org|
      [org.title, org.id]
    end
  end

  def user_manager_email
    find_user_id = User.find_by(manager_id: @user.manager_id).manager_id
    User.find_by(id: find_user_id).email
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      :role_id,
      :organisation_id,
      :manager_id
    )
  end

  def render_users
    @users = if current_user.role.admin?
               User.all
             elsif current_user.role.org_admin? && current_user.organisation.present?
               [current_user.organisation.users].flatten
             else
               redirect_to root_url
             end
  end
end
