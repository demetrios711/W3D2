require_relative "questions_db_connect.rb"
class QuestionLikes

    attr_accessor :id, :author_id, :question_id

    def self.find_by_id(reply_id)
        reply = QuestionsDBConnect.instance.execute(<<-SQL, reply_id)
            SELECT 
                * 
            FROM
                question_likes 
            WHERE 
                id = ?
        SQL
        QuestionLikes.new(reply[0])
    end

    def initialize(options)
        @id = options["id"]
        @author_id = options["author_id"]
        @question_id = options["question_id"]
    end
    

end

if __FILE__ == $PROGRAM_NAME
    p QuestionLikes.find_by_id(0)
end