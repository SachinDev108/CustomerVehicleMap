require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "return 200 success with customers information" do
      get customers_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST /customer with vehicle' do
    before(:each) do
      @vehicles_attributes = {
        "0" => {"year"=>"1990", "make"=>"01/01/2018", "model"=>"xyz", "_destroy"=>"false"}
      }
    end
    it "Creates a Customer with vehicle and redirects to the customer's page" do
      get "/customers/new"
      expect(response).to render_template(:new)

      post "/customers", :params => { :customer => {name: 'hello', address: '421 8th Avenue, New York, NY, United States', lat: '40.7515458', lng: '-73.9959106', :vehicles_attributes => @vehicles_attributes } }
      expect(response).to redirect_to(assigns(:customers))
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Customer was successfully created.")
    end
  end

  describe "DELETE /Customer with vehicle" do
    let(:customer) { FactoryGirl.create(:customer) }
    
    it "Delete a Customer with vehicle and redirects to the customer's page" do
      delete "/customers/#{customer.id}"
      expect(response).to redirect_to(assigns(:customer))
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Customer was successfully destroyed.")
    end
  end

  describe "Edit|Update|Show /Customer" do
    before do
      @customer = FactoryGirl.create(:customer)
    end
    
    it "Edit the Customer" do
      get "/customers/#{@customer.id}/edit"
      expect(response).to render_template(:edit)
    end

    it "Update the Customer" do
      put "/customers/#{@customer.id}", :params => {:customer => {name: 'new name'}}
      expect(response).to redirect_to(assigns(:customer))
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "Show the Customer" do
      get "/customers/#{@customer.id}"
      expect(response).to render_template(:show)
    end
  end
end
