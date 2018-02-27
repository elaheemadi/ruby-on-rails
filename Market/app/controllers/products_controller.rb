class ProductsController < ApplicationController
   #bypass authentication
   protect_from_forgery with: :null_session
   @product = nil
   #before_action :setup, only: :create

   #new & create are pairs
   def new
      @product = Product.new
   end


   def create
      @product = Product.new(check)

      #successful save redirect to root or show path
      if @product.save
                redirect_to products_path
      else
                redirect_to new_products_path
                #render :new
      end
   end

   #display all the Products
   def show
        @product = Product.all
   end

   #destroy a single Product
   def destroy
        @product = Product.find(params[:id])
        @product.destroy

        redirect_to products_path
   end

   #edit and update are pairs
   def edit
        @product = Product.find(params[:id])
   end

   def update
        
        @product = Product.find(params[:product][:id])

        if @product.update(check) 
                redirect_to products_path
        else 
               
                #do something else if something goes wrong
                redirect_to root_path
        end
   end

   private
        def check
                params.require(:product).permit(:id, :name, :image, :description, :price, :code)
        end


end
