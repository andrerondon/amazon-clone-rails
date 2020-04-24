class ProductsController < ApplicationController


    def index
        @products = Product.all.order('updated_at DESC')
        
    
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(params.require(:product).permit(:title, :description, :price))
   
        if @product.save
          redirect_to product_path(@product)
        else
          render :new
        end
    end
    
    def show
      @product = Product.find(params[:id])
      @review = Review.new
    end


    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      # redirect_to product_path(@product)
      render :new
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(params.require(:product).permit(:title, :description, :price))
        redirect_to product_path(@product)
        
      else
        render :edit
      end
    end
    
    



end
