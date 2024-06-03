module Admin
  class NewsController < ApplicationController
    before_action :set_news, only: [:show, :edit, :update, :destroy]

    def index
    @news = News.all
    end

    def show
    end

    def new
      @news = News.new
    end

    def edit
    end

    def create
      @news = News.new(news_params)
      if @news.save
        ActionCable.server.broadcast 'news_channel', news: @news
        render json: @news, status: :created
      else
        render json: @news.errors, status: :unprocessable_entity
      end
    end

    def update
      if @news.update(news_params)
        ActionCable.server.broadcast 'news_channel', news: @news
        render json: @news
      else
        render json: @news.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @news.update(hidden: true)
      redirect_to admin_news_index_path, notice: 'Новость скрыта.'
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