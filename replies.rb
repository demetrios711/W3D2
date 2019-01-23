require_relative "questions_db_connect.rb"
class Replies

    attr_accessor :id, :body, :author_id, :question_id, :parent_reply_id

    def self.find_by_id(reply_id)
        reply = QuestionsDBConnect.instance.execute(<<-SQL, reply_id)
            SELECT 
                * 
            FROM
                replies 
            WHERE 
                id = ?
        SQL
        Replies.new(reply[0])
    end

    def self.find_by_author(author_id)
        reply = QuestionsDBConnect.instance.execute(<<-SQL, author_id)
            SELECT 
                * 
            FROM
                replies
            WHERE 
                author_id = ?
        SQL
        Replies.new(reply[0])
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDBConnect.instance.execute(<<-SQL, question_id)
            SELECT 
                * 
            FROM
                replies
            WHERE 
                question_id = ?
        SQL
        reply.map{|repl| Replies.new(repl)}
    end

    def initialize(options)
        @id = options["id"]
        @body = options["body"]
        @author_id = options["author_id"]
        @question_id = options["question_id"]
        @parent_reply_id = options["parent_reply_id"]
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

    def question
        output = QuestionsDBConnect.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM 
            questions
        WHERE
            id = ?
        SQL
        output[0]
    end

    def parent_reply
        output = QuestionsDBConnect.instance.execute(<<-SQL, parent_reply_id)
        SELECT
            *
        FROM 
            replies
        WHERE
            id = ?
        SQL
        output[0]
    end

    def child_replies
        output = QuestionsDBConnect.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM 
            replies
        WHERE
            parent_reply_id = ?
        SQL
        output[0]     
    end

end

if __FILE__ == $PROGRAM_NAME
    #p Replies.find_by_id(0)
    # p Replies.find_by_author(1)
    #p Replies.find_by_question_id(0)
    #reply = Replies.new("id" => 4, "body" => "ur mum", "author_id" => 25, "question_id" => 112, "parent_reply_id" => 3)
    # p reply.author
    # p reply.question
    #p reply.parent_reply
    # reply = Replies.new("id" => 3, "body" => "ur mum", "author_id" => 25, "question_id" => 112)
    # p reply.child_replies
end