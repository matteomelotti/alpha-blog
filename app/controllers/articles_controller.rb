class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = 'OK'
            redirect_to articles_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = 'Ok'
            redirect_to article_path(@article)
        else
            flash[:error] = 'Not ok'
            render 'edit'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = 'Deleted succesfull!'
        redirect_to articles_path
    end

    private
    
    def article_params
        params.require(:article).permit(:title,
                                        :description)
    end
    
end
