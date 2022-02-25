class CustomersController < ApplicationController
  layout "customer", except: [:index]

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    # rendering a raw file
    render file: "#{Rails.root}/public/404.html", layout: false
    # or rendering a template
    # render :template => "errors/error_404", :status => 404
  end

  def index
    @customers = Customer.all()
    # using render with inline
    # render inline: "<% @customers.each do |p| %><p><%= p.name %></p><% end %>"
  end

  def show
    @customer = Customer.find(params[:id])
    # rendering HTML
    # render html: '<div>html goes here</div>'.html_safe
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.create(customer_params)
    if customer.valid?
      # and return to avoid double render/redirect error
      redirect_to customers_path and return
    else 
      flash[:errors] = customer.errors.full_messages
      redirect_to new_customer_path
    end
    redirect_to(customer)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update 
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.valid?
      redirect_to action: :index
    else 
      flash[:errors] = @customer.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private 
  def customer_params
    params.require(:customer).permit(:name)
  end
end
