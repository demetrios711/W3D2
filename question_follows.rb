require_relative "questions_db_connect.rb"
require_relative "users.rb"
require_relative "questions.rb"

class QuestionFollows

    attr_accessor :id, :author_id, :question_id

    def self.find_by_id(reply_id)
        reply = QuestionsDBConnect.instance.execute(<<-SQL, reply_id)
            SELECT 
                * 
            FROM
                questions_follows 
            WHERE 
                id = ?
        SQL
        QuestionFollows.new(reply[0])
    end

    def self.followers_for_question_id(question_id)
        output = QuestionsDBConnect.instance.execute(<<-SQL, question_id)
            SELECT 
                users.*  
            FROM
                questions_follows AS qf
            JOIN 
                users ON qf.author_id = users.id
            WHERE 
                qf.question_id = ?
        SQL
        output.map{|oopy| Users.new(oopy)}
    end    

    def self.followers_for_user_id(user_id)
        output = QuestionsDBConnect.instance.execute(<<-SQL, user_id)
            SELECT 
                questions.*  
            FROM
                questions_follows AS qf
            JOIN 
                questions ON qf.author_id = questions.author_id
            WHERE 
                qf.author_id = ?
        SQL
        output.map{|oopy| Questions.new(oopy)}
    end    


    def initialize(options)
        @id = options["id"]
        @author_id = options["author_id"]
        @question_id = options["question_id"]
    end
    

end

if __FILE__ == $PROGRAM_NAME
    #p QuestionFollows.find_by_id(0)
    # p QuestionFollows.followers_for_question_id(112)
    p QuestionFollows.followers_for_user_id(11)
end