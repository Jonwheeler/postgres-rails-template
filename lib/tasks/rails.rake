namespace :rails do
  desc 'Rename application classes to a new name'
  task :rename do
    old_name = "#{Rails.application.class.parent}"
    new_name = ENV['NEW_NAME'].to_s.strip
  
    if new_name.empty?
      STDERR.puts "New name required. Please run: NEW_NAME=name rake rails:rename"
      exit 1
    end

    new_name = new_name.downcase.gsub(/\s/, "_").camelize.capitalize
    files = `find $(pwd) -name \*.rb`.strip.split("\n")
    files << 'Rakefile'
    files << 'config.ru'

    files.each do |f|
      data = File.read(f)
      if data[old_name]
        puts "Renaming class in #{File.basename(f)}"
        data.gsub!(old_name, new_name)
        File.open(f, 'w') { |io| io.write(data) }
      end
    end
  end

  desc 'Reset git repository for the project'
  task :reset_git do
    git_root = Rails.root.join('.git')
    if File.exists?(git_root)
      puts "Deleting an existing git repository"
      `rm -rf #{git_root}`
    end
    puts "Creating a new git repository"
    `git init .`
  end
end