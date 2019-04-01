class ArticlesController < ApplicationController
    def new 
    end

    # Save the data in the db
    def create
        # render plain: params[:article].inspect
       
        # @article = Article.new(params[:article])
        @article = Article.new(article_params)

        @article.save
        redirect_to @article
    end

    # Once form is submitted, it will redirect to: 
    # localhost:[port]/articles/[id]
    # /articles/:id(.:format)       articles#show
    # def show
    #     @article = Article.find(params[:id])
    # end

    # /articles(.format)    articles:index
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    private
        def article_params
            # Whitelist this controller to prevent wrongfull mass assignment and use `require` and `permit` 
            params.require(:article).permit(:title, :text)
        end
end