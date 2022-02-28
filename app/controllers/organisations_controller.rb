class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @organisations = Organisation.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if @organisation.save

        format.html do
          redirect_to organisation_url(@organisation), notice: 'Organisation was successfully created.'
        end
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisation_url(@organisation), notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:title, :short_description)
  end

  def assign_user_to_organisation(organisation)
    organisation.users << current_user
  end
end
