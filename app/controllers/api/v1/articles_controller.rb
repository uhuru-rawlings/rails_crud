module Api
    module V1
        class ArticlesController < ApplicationController

            def index
                @articles = Article.order('created_at desc')
                if @articles
                    render json: {status: 'success', message: 'Articles',data: @articles}, status: :ok
                else
                    render json: {status: 'error', message: 'Articles not found', error: articles.errors}, status: :unprocessable_entity
                end
            end

            def show
                @article = Article::find(params[:id])
                if @article
                    render json: {status: 'success', message: 'Article',data: @article}, status: :ok
                else
                    render json: {status: 'error', message: 'Articles not found', error: article.errors}, status: :unprocessable_entity
                end
            end

            def create
                @article = Article.new(article_params)

                if @article.save
                    render json: {status: 'success', message: 'New Article',data: @article}, status: :ok
                else
                    render json: {status: 'error', message: 'Articles not found', error: article.errors}, status: :unprocessable_entity
                end
            end

            def update
                @article = Article::find(params[:id])
                if @article.update(article_params)
                    render json: {status: 'success', message: 'Article',data: @article}, status: :ok
                else
                    render json: {status: 'error', message: 'Articles not Updated', error: article.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                @article = Article::find(params[:id])
                if @article
                    @article.delete
                    render json: {status: 'success', message: 'Deleted Article',data: @article}, status: :ok
                else
                    render json: {status: 'error', message: 'Articles not found', error: article.errors}, status: :unprocessable_entity
                end
            end
            private 

            def article_params
                params.permit(:title, :author, :body)
            end
        end
    end
end
# class Api::V1::ArticlesController < ApplicationController
# end
