class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:20, maximum:200}


    # Esto quiere decir que tiene un file adjunto
    has_attached_file :cover, styles: {medium: "1280x720", thumb: "800x600"}
    #Validaciones
    # validates_attachment_content_type :cover, content_type: ["image/jpeg", "image/gif", "image/png","application/pdf"]
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
    # validad antes de que se creee
    before_create :set_visits_count


    after_create :send_mail

    # Here updated count then por cada visita le add one visitis
    ## OJO QUE ESTE MEHTOD se call en controller OJO
    def update_visits_count

        self.update_attribute(:visits_count, self.visits_count + 1)
            
    # self.methods.sort.each do |single|
        
    #     puts "CLASES=> #{single}"
    # end
      
                                         
    end

    private

    def send_mail
        ArticleMailer.new_article(self).deliver_later
    end

    # Aui ininicializa el contador a cero
    def set_visits_count
        self.visits_count ||= 0
    end
end
