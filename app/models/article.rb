class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:20, maximum:200}

    # validad antes de que se creee
     before_create :set_visits_count

    # Here updated count then por cada visita le add one visitis
    ## OJO QUE ESTE MEHTOD se call en controller OJO
    def update_visits_count

        self.update_attribute(:visits_count, self.visits_count + 1)
            
    # self.methods.sort.each do |single|
        
    #     puts "CLASES=> #{single}"
    # end
      
                                         
    end

    private
    # Aui ininicializa el contador a cero
    def set_visits_count
        self.visits_count ||= 0
    end
end
