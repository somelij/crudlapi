module Api
    class NewsController < ApplicationController
      before_action :set_news, only: [:show, :update, :destroy]

      def index
        if params[:date]
          @news = News.where("created_at >= ?", params[:date]).where(hidden: false)
        else
          @news = News.where(hidden: false)
        end
        render json: @news
      end

      def show
        render json: @news
      end

      def create
        @news = News.new(news_params)
        if @news.save
          render json: @news, status: :created
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      def update
        if @news.update(news_params)
          render json: @news
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @news.update(hidden: true)
        head :no_content
      end

      private

      def set_news
        @news = News.find(params[:id])
      end

      def news_params
        params.require(:news).permit(:title, :content, :image_url, :hidden)
      end
    end
end