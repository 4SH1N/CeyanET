class ClientsController < ApplicationController
  before_action :current_client_params, only: %i[ edit show update ]

  def index
  end

  def edit
  end

  def new
  end

  def create
  end

  def show
  end

  def update
    if @client.update(client_params)
      render partial: "clients/forms/change"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def delete
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :description, :phone, :responsible, :location, :note)
  end

  def date_join
    Date.current
  end

  def current_client_params
    @client = current_client
  end
end
