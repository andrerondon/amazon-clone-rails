class ReviewsController < ApplicationController

    def create
        @product = Product.find(params[:product_id])
        @review = Review.new review_params
        @review.product = @product
        if @review.save
            redirect_to product_path(@product)
            
        else
            @products = Product.all.order('updated_at DESC')
            render 'products/show'
        end
    end

    def destroy
        @review = Review.find params [:id]
        @review.destroy
        redirect_to product_path(@review.product)
    end

    private

    def answer_params
        params.require(:review).permit(:body)
    end


end

