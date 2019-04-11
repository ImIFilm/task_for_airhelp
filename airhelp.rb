require 'json'

class Message
    attr_accessor :message, :tags, :words
    def initialize (message, tags, words)
        @message = message
        @tags = tags
        @words = words
    end

    def count_words
        @words=@message.split
    end

    def tag_if_question
        if !(@tags.include? "needs answer") and @message.include? "?"
            @tags << "needs answer"
        end
    end

    def as_json()
        {message: @message, tags: @tags, words: @words}
    end

    def to_json()
        as_json().to_json()
    end
end

def get_json_input(directory)
    json_string = File.read(directory, :encoding => 'utf-8')
    text=JSON.parse(json_string)
    mes = Message.new(text['message'], text['tags'], text['words']) 
end

if ARGV.size()<1 then
    puts "please give at least one directory"
end

raw_input = []
number_of_dirs = ARGV.size()

for i in 0..number_of_dirs-1
    #read source
    begin
        if ARGV[i].end_with? ".json"
            raw_input<<get_json_input(ARGV[i])
        else 
            raise ArgumentError.new("It must be .json file!")
        end
    rescue Errno::ENOENT
        puts 'No such file or directory. Try again'
        exit
    rescue ArgumentError => e
        puts e.message
        exit
        
    end

    #process message
    raw_input[i].count_words
    raw_input[i].tag_if_question

    #save results
    File.open(ARGV[i],"w") do |f|
        f.write(raw_input[i].to_json)
    end
end