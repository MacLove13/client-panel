class ClientsController < ApplicationController
  before_action :require_selected_organization
  before_action :set_client, only: [ :edit, :update ]

  def index
    @clients = current_organization.clients.order(created_at: :desc)

    if params[:search].present?
      search = "%#{params[:search]}%"
      @clients = @clients.where(
        "name ILIKE :search OR phone ILIKE :search OR address ILIKE :search OR nickname ILIKE :search",
        search: search
      )
    end

    if params[:sort_direction].present? && %w[asc desc].include?(params[:sort_direction])
      @clients = @clients.reorder(created_at: params[:sort_direction].to_sym)
    end
  end

  def new
    @client = current_organization.clients.build
  end

  def create
    @client = current_organization.clients.build(client_params)

    if @client.save
      redirect_to clients_path, notice: "Cliente criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "Cliente atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_client
    @client = current_organization.clients.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :phone, :address, :nickname)
  end
end
