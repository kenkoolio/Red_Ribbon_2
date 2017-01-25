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
    @new_service = Service.new(service_params)
    if @new_service.save
      @state = State.new(state_params)
      if @state.save
        @zip = Zip.new(zip_params)
        if @zip.save
          @address = Address.new(address_params)
          @address.state = State.find(@state.id)
          @address.zip = Zip.find(@zip.id)
          if @address.save
            @service_to_address = ServiceToAddress.new(service: Service.find(@new_service.id), address: Address.find(@address.id))
            if @service_to_address.save
              @contact = Contact.new(contact_params)
              @contact.service = Service.find(@new_service.id)
              if @contact.save
                redirect_to '/'
              else
                flash[:errors] = @contact.errors.full_messages
                redirect_to '/'
              end
            else
              flash[:errors] = @service_to_address.errors.full_messages
              redirect_to '/'
            end
          else
            flash[:errors] = @address.errors.full_messages
            redirect_to '/'
          end
        else
          flash[:errors] = @zip.errors.full_messages
          redirect_to '/'
        end
      else
        flash[:errors] = @state.errors.full_messages
        redirect_to '/'
      end
    else
      flash[:errors] = @new_service.errors.full_messages
      redirect_to '/'
    end
  end

  def show
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
