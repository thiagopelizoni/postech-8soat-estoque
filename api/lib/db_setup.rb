#!/usr/bin/env ruby

def check_db_initialized
    output = `rails db:version 2>&1`.strip
    output.match?(/Current version:/)
end

puts check_db_initialized
unless check_db_initialized
    system("rails db:migrate")
else
    puts "Inicializando banco de dados"
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
end