require_relative("./header_file_reader")


def main
    if ARGV.length != 1
        puts "Usage :file_path"
        exit(1)
    end

    puts get_class_data(ARGV[0])
end

main

