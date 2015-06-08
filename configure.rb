config_file_name = "./config.yml"

def generate_password(n=10)
  Array.new(n){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
end

puts "What is your application's name?"
app_name = readline.chomp

if File.exists?(config_file_name)
  File.delete(config_file_name)
end
config_file = File.new(config_file_name, "w+")
config_file.puts "- app_name: #{app_name}"
config_file.puts "- db_password: #{generate_password}"
config_file.puts "- root_password: #{generate_password}"
config_file.puts "- deploy_password: #{generate_password}"
config_file.close

puts "config.yml has been configured for app #{app_name}"
