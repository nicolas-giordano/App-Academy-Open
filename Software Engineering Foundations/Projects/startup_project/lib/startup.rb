require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.keys.include?(title)
            return true
        end
        false
    end

    def >(startup)
        if @funding > startup.funding
            return true
        end
        false
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "That title is not valid."
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding > salary
            @funding -= salary
            employee.pay(salary)
        else
            raise "Not enough funding."
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        total = 0
        @employees.map {|employee| total += @salaries[employee.title]}
        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !valid_title?(title)
                @salaries[title] = salary
            end
        end
        startup.employees.each {|employee| @employees << employee}
        startup.close
    end
end
