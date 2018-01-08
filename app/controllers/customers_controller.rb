class CustomersController < ApplicationController
  respond_to :html
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    respond_with @customers
  end

  def new
    @customer = Customer.new
  end

  def create
    # In order to set the flash, we need to know if the create was successful.
    # Since `create` always returns an object we won't know if it's successful,
    # without re-validating or checking the errors.
    #
    # The cleaner way is to just initialize a new object, then check the call
    # to save; which will be truthy on a valid model and successful save.
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Customer was successfully created."
    end
    respond_with @customer, location: -> { customers_path }
  end

  def edit
    
  end

  def show
    
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "Customer was successfully updated."
    end

    respond_with @customer
  end

  def destroy
    flash[:notice] = "Customer was successfully destroyed."
    respond_with @customer.destroy
  end

  def map
    @customers = Customer.search(params)
    @hash = Gmaps4rails.build_markers(@customers) do |customer, marker|
      marker.lat customer.lat
      marker.lng customer.lng
      marker.json({ :id => customer.id })
      marker.infowindow render_to_string(:partial => "/customers/box", :locals => { :object => customer})
    end
    respond_with @customers
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :address, :city, :state, :zip, :email, :phone, :lat, :lng, :vehicles_attributes => [:id, :year, :customer_id, :make, :model, :trim, :style, :vin, :_destroy])
    end
end

