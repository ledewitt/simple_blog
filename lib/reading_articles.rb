Dir.foreach ("./../articles") do |file|
  if file.include?(".txt")
    puts "Got #{file}"
    puts File.read("./../articles/#{file}")
  end
end