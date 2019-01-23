require_relative "questions_db_connect.rb"
require_relative "questions.rb"
require_relative "replies.rb"
require_relative "question_follows.rb"

class Users

    attr_accessor :id, :fname, :lname

    def self.find_by_id(user_id)
        user = QuestionsDBConnect.instance.execute(<<-SQL, user_id)
            SELECT 
                * 
            FROM
                users 
            WHERE 
                id = ?
        SQL
        Users.new(user[0])
    end

    def self.find_by_name(fname,lname)
        output = QuestionsDBConnect.instance.execute(<<-SQL, fname,lname)
            SELECT 
                * 
            FROM
                users 
            WHERE 
                fname = ? AND lname = ?
        SQL
        Users.new(output[0])
    end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end
    
    def authored_questions
        Questions.find_by_author(@id)
    end

    def authored_replies
        Replies.find_by_author(@id)
    end

    def followed_questions
        QuestionFollows.followers_for_user_id(@id)
    end


end

if __FILE__ == $PROGRAM_NAME
    # p Users.find_by_id(2)
    # p Users.find_by_name("Demetri","Sakellaropoulos")
    dog = Users.new({"id" => 11, "fname" => "Frank", "lname" => "The Dog"})
    # p dog.authored_questions

    # p dog.authored_replies
    p dog.followed_questions

end