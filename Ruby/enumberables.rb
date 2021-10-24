class Array

    def my_each(&prc)
        length = self.length
        counter = 0
        while counter < length
            prc.call(self[counter])
            counter += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each {|num| new_arr << num if prc.call(num)}
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each {|num| new_arr << num if !prc.call(num)}
        new_arr
    end

    def my_flatten
        new_arr = []
        self.each do |ele|
            p ele
            if !ele.is_a?(Array)
                new_arr << ele
            else
                new_arr += ele.my_flatten
            end
        end
        new_arr
    end    
end