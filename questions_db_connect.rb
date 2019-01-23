require 'singleton'
require 'sqlite3'

class QuestionsDBConnect < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

