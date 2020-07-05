class ArticlesController < ApplicationController

    def index
        # No olvidad que con @ envio data al la vistass
        @nombre ="Juan"
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end
    
    def create
        # @article = Article.new(params[:article])
        # if @article.save
        #   flash[:success] = "Object successfully created"
        #   redirect_to @article
        # else
        #   flash[:error] = "Something went wrong"
        #   render 'new'
        # end

        @article = Article.new(title: params[:article][:title],
                                body: params[:article][:body])

        # Save Article
        # @article.save

        #Redireciona a la pagina article/id   WOOOOWWWWW con el id que acabo de crear
        # redirect_to @article
        # puts "Esto servira"  => La consola ya muestra la data

        if @article.save
            flash[:success] = "Object successfully created"
            # redirect_to @article
            render 'new'
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to articles_url
            
            #Redirecciona al HOME path o /
            #articles_url
            #articles_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to articles_url
        end
    end
    
end
