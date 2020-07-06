class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:20, maximum:200}

    ## validad antes de que se creee
    before_create :set_visits_count


    # Here updated count then por cada visita le add one visitis
    ## OJO QUE ESTE MEHTOD se call en controller OJO
    def update_visits_count

        ## NO FUNCIONA ESTO
        # self.save if self.visits_count.nil?
        self.update(visits_count: self.visits_count + 1)
        puts "OOOOOOOOOOOOOOOOOOOOOOO #{self.visits_count.class}"
                                       
    end

    private
    # Aui ininicializa el contador a cero
    def set_visits_count
        self.visits_count ||= 0
    end
end
