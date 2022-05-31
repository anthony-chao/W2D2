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
        salaries.keys.include?(title)? true : false
    end

    def >(another_startup)
        self.funding > another_startup.funding ? true : false
    end

    def hire(name, title)
        if valid_title?(title)
            employees << name 
        end

    end

end
