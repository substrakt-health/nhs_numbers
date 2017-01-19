task default: :test
task :test do
  Dir.glob('./test/lib/*_test.rb').each { |file| require file }
end
