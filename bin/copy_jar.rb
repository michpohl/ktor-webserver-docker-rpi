require "fileutils"

# Moves the latest build artifact to the docker folder


root = __dir__
puts root
# TODO tun these into arguments or maybe env vars
artifacts_path = "#{root}/../build/libs"
docker_jars_path = "#{root}/../docker"

puts "Move latest jar artifact to docker"

# Clean docker jar folder
if Dir.exist?(docker_jars_path)
    Dir.foreach(docker_jars_path) do |file|
        filename = File.join(docker_jars_path, file)
        File.delete(filename) if filename.end_with?(".jar")
        # File.delete(filename) if file != '.' && file != '..' && file != 'Dockerfile' && file !
    end
else
    puts "Docker jar folder was not found"
    exit 1    
end
# Copy newest jar over
if Dir.exist?(artifacts_path)
    puts "artifacts folder exists. Checking jars..."

    latest = Dir.glob("#{artifacts_path}/*.jar").max_by(1) {|f| File.mtime(f)}
    name = File.basename(latest[0])
    puts "This is the latest jar: #{latest}"

    puts "Copying: #{name}"
    FileUtils.cp(latest, docker_jars_path)
else
    puts "Artifacts folder was not found"
    exit 1
end


# Rename jar file
finalname = "tinyserver.jar"
puts "Renaming to #{finalname}"
oldname = "#{docker_jars_path}/#{name}"
newname = "#{docker_jars_path}/#{finalname}"
if File.exist?(oldname)
    File.rename(oldname, newname)
else
    puts "An error occured trying to rename the jar file in #{docker_jars_path}!"
    exit 1
end

puts "Done!"