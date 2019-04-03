class ArticlesController < ApplicationController
    # URI Pattern:  /articles(.format)    articles:index
    # Controller:   article#index
    def index
        @articles = Article.all
    end

    # URI Pattern:  /article/:id
    # Controller:   article#show        
    def show
        @article = Article.find(params[:id])
    end
    
    # URI Pattern:  /articles/new
    # Controller:   articles#new
    def new 
        @article = Article.new 
    end

    # URI Pattern:  /articles/:id/edit
    # Controller:   articles#edit
    def edit
        @article = Article.find(params[:id])
    end 

    # URI Pattern:  /articles
    # Controller:   articles#create
    # Save the data in the db
    def create
        # render plain: params[:article].inspect
       
        # @article = Article.new(params[:article])
        @article = Article.new(article_params)

        # Added validation form 
        if @article.save
            redirect_to @article
        else 
            render 'new'
        end 
    end

    # URI Pattern:  /articles/:id
    # Controller:   articles#update
    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end

    # URI Pattern:  /articles/:id
    # Controller:   articles#destroy
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
      end

    private
        def article_params
            # Whitelist this controller to prevent wrongfull mass assignment and use `require` and `permit` 
            params.require(:article).permit(:title, :text)
        end
end