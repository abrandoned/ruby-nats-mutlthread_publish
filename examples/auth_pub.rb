
require 'rubygems'
require 'nats/client'
  
def usage
  puts "Usage: pub.rb <user> <pass> <subject> <msg>"; exit
end

user, pass, subject, msg = ARGV
usage unless user and pass and subject

# Default
msg ||= 'Hello World'

uri = "nats://#{user}:#{pass}@localhost:8222"

NATS.start(:uri => uri) do |n|
  n.publish(subject, msg)
  NATS.stop
end
