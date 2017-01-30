class ServicesController < ApplicationController
  def index
  end

  def new
    # @user_in_session = User.find(session[:user_id])
    # if @user_in_session.user_level == 9
    #   render 'services/new'
    # else
    #   flash[:errors] = ["You don't have permission to do that!"]
    #   redirect_to '/'
    # end
  end

  def create
    errors = []

    @new_service = Service.new(service_params)
    # @new_service.hours = @new_service.hours.to_json #to conver ruby hash to json .. right now it returns a json string ??
    unless @new_service.valid?
      errors << @new_service.errors.full_messages
    end

    @address = Address.new(address_params)
    unless @address.valid?
      errors << @address.errors.full_messages
    end

    @state = State.new(state_params)
    unless @state.valid?
      errors << @state.errors.full_messages
    end

    @zip = Zip.new(zip_params)
    unless @zip.valid?
      errors << @zip.errors.full_messages
    end

    if contact_params[:name].present?
      @contact = Contact.new(contact_params)
      unless @contact.valid?
        errors << @contact.errors.full_messages
      end
    end

    unless errors.count > 0
      if @new_service.save
        if @state.save
          @address.state = State.find(@state.id)

          if @zip.save
            @address.zip = Zip.find(@zip.id)

            if @address.save
              @service_to_address = ServiceToAddress.new(service: Service.find(@new_service.id), address: Address.find(@address.id))

              @service_to_address.save

              if contact_params[:name].present?
                @contact.service = Service.find(@new_service.id)
                @contact.save
              end

              redirect_to '/'
            end
          end
        end
      end
    end

    if errors.count > 0
      flash[:errors] = errors
      render "services/new"
    end
  end

  def show
  end

  def ajax_show
    @selected_service           = Service.find_by(id: params[:id])
    @selected_service_contact   = @selected_service.contacts
    @selected_service_address   = @selected_service.addresses ? @selected_service.addresses[0] : nil
    @selected_service_zip       = @selected_service_address ? @selected_service_address.zip : nil
    @selected_service_state     = @selected_service_address ? @selected_service_address.state : nil

    ajax_data = {
      service:  @selected_service,
      contact:  @selected_service_contact,
      address:  @selected_service_address,
      zip:      @selected_service_zip,
      state:    @selected_service_state
    }

    render json: ajax_data
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def service_params
    params.require(:services).permit(:name, :description, :website, hours: [:sunday => [:open, :close], :monday => [:open, :close], :tuesday => [:open, :close], :wednesday => [:open, :close], :thursday => [:open, :close], :friday => [:open, :close], :saturday => [:open, :close]])
  end

  def address_params
    params.require(:address).permit(:number, :street, :apt, :city)
  end

  def state_params
    params.require(:state).permit(:name)
  end

  def zip_params
    params.require(:zip).permit(:code)
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone.to_s)
  end

end
