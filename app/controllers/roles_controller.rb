class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def show
    display_associated_users
  end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if @role.save
        format.html { redirect_to role_url(@role), notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to role_url(@role), notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_role; end

  def role_params
    params.require(:role).permit(:name, :description)
  end

  def display_associated_users
    if @role.users.empty?
      @associated_user = 'None'
    else
      @associated_users = @role.users.map(&:email).join(', ')
    end
  end
end
