

def read_file(file_path)
    File.read(file_path).split("\n")
end

class ClassData

    attr_accessor :class_name , :func_names

    def initialize(class_name)
        @class_name =  class_name
        @func_names = []
    end

end

def is_func?(line)
  if /(\w+)\*? +(\w+)\(.*\)/.match(line) == nil
      return false
  end
  true
end


def get_class_data(file_path)

    container = {}
    lines = read_file(file_path)
    class_name = ""
    lines.each { |line|

        if line.include?("class") 
            class_name = line.split[1]
            container[class_name] = []
        end
        
        if is_func?(line) and class_name != ""

            line_data = line.split("(")
            func_data= line_data[0]


            container[class_name] << func_data .lstrip
        end

    }

    remove_empty_classes(container)

end

def remove_empty_classes(container)

    new_container = {}

    container.each { |class_name , func|
        if func.length == 0
            next
        end

        new_container[class_name] = func
    }

    new_container
end

