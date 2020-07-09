class ArticleMailer < ApplicationMailer

    # rails g mailer ArticleMailer
    # Instalar gema letter_opene => para hacer test
    def new_article(article)
        @article = article

        # A todos los usuarios le voy a mandar un mail

        User.all.each do |user|
            mail(to: user.email, subject:"ESTO ES DE TEST" )
        end
        
    end
end
