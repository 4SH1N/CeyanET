class ClientsController < ApplicationController
  before_action :authenticate_client!
  before_action :set_current_client, only: %i[ edit show update ]


  def edit
  end

  def show
  end

  def update
    if @client.update(client_params)
      render partial: "clients/forms/change"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def client_params
    params.require(:client).permit(:name, :email, :description, :phone, :responsible, :location, :note)
  end

  def date_join
    Date.current
  end

  def set_current_client
    @client = current_client
  end
end
