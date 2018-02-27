class CartController < ApplicationController

    def index
        @products = Product.all
    end

    def checkout
        @total = params[:hiddentotal]
    end

end
