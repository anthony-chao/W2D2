require_relative "room"

class Hotel

    attr_reader :rooms
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)              #what does this mean?? hash[name] = capacity? but what is Room.new? Creating a new capacity?
        end
    end

    def name
        words = @name.split(" ")
        new_words = words.map { |word| word.capitalize }
        new_words.join(" ")
    end

    def room_exists?(room)
        @rooms.keys.include?(room) ? true : false
    end

    def check_in(person, room)
        if self.room_exists?(room) 
            success = @rooms[room].add_occupant(person)
            if success
                p "check in successful"
            else
                    p 'sorry, room is full'
                end
        else
            p "sorry, room does not exist" 
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
    end
end
