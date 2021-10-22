require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room, cap|
            @rooms[room] = Room.new(cap)
        end
    end

    def name
        name = @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        if @rooms.include?(room)
            return true
        end
        false
    end

    def check_in(person, room)
        if room_exists?(room)
            attempt = @rooms[room].add_occupant(person)
            if attempt 
                p "check in successful"
            end
            p "sorry, room is full"
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts "#{name} : #{room.available_space}"
        end
    end

end


