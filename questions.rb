require_relative "questions_db_connect.rb"
require_relative "replies.rb"
class Questions

    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(question_id)
        question = QuestionsDBConnect.instance.execute(<<-SQL, question_id)
            SELECT 
                * 
            FROM
                questions 
            WHERE 
                id = ?
        SQL
        Questions.new(question[0])
    end

    def self.find_by_author(author_id)
        question = QuestionsDBConnect.instance.execute(<<-SQL, author_id)
            SELECT 
                * 
            FROM
                questions 
            WHERE 
                author_id = ?
        SQL
        Questions.new(question[0])
    end

    def initialize(options)
        @id = options["id"]
        @title = options["title"]
        @body = options["body"]
        @author_id = options["author_id"]
    end

    def author
        output = QuestionsDBConnect.instance.execute(<<-SQL, author_id)
            SELECT 
                fname, lname
            FROM
                users
            WHERE 
                id = ?
        SQL
        output[0]
    end

    def replies
        Replies.find_by_question_id(@id)
    end

end

if __FILE__ == $PROGRAM_NAME
    #p Questions.find_by_id(0)
    # p Questions.find_by_author(2)
    
    question = Questions.new({"id"=>112, "title"=> "some random title",
     "body"=>"ruby doesn't care about whitespace","author_id" => 11})

    p question.replies
end