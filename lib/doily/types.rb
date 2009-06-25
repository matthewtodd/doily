Dir.chdir(File.join(File.dirname(__FILE__), '..')) do
  Dir['doily/types/*.rb'].each do |filename|
    require filename
  end
end
