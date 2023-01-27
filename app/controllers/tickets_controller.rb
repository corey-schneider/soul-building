class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show edit update destroy]
  before_action :find_current_ticket, only: %i[show edit update destroy toggle_status]

  def index
    @tickets = Ticket.all.order(created_at: :asc)
  end

  def show
    return not_found unless can? :show, @ticket

    set_meta_tags title: "Ticket ##{@ticket.id} (#{@ticket.status.upcase})"
  end

  def new
    @ticket = Ticket.new
    set_meta_tags title: 'New ticket'
  end

  def create
    @ticket = Ticket.new(ticket_params)
    recaptcha_valid = verify_recaptcha(model: @ticket, action: 'contact', minimum_score: 0.6)
    # @ticket = Ticket.new(ticket_params.merge!(ip_address: request.remote_ip))

    if @ticket.save || !recaptcha_valid # show fake success message for invalid recaptcha
      redirect_to root_path, notice: 'Thanks for reaching out! Your message was received. We will be in touch soon.'
    else
      render 'contact_us/index', status: :unprocessable_entity
    end
  end

  def edit
    return not_found unless can? :update, @ticket
    set_meta_tags title: 'Edit ticket'
  end

  def update
    return not_found unless can? :update, @ticket

    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return not_found unless can? :destroy, @ticket

    @ticket.destroy
    redirect_to root_path, status: :see_other
  end

  def toggle_status
    @ticket.update(status: (@ticket.open? ? 1 : 0))
    redirect_to tickets_path, notice: "Updated status for ticket ##{@ticket.id}"
  end

  def find_current_ticket
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name, :email, :title, :body, :phone)
  end
end
