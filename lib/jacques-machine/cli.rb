require 'optparse'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'jacques-machine.rb'))

module JacquesMachine
  class Cli
    def self.run(args)

      OptionParser.new{ |opts|
        opts.banner = "Usage:\n    jacques-machine [options]"
        opts.separator "\nOptions: "

        opts.on("-c <key>", "--campfire <key>",
          "Join Campfire using API <key>") do |key|
          JacquesMachine::Configuration.campfire_key = key
        end

        opts.on("-r <room>", "--room <room>",
          "Join Campfire <room>") do |room|
          JacquesMachine::Configuration.campfire_room = room
        end

        opts.on("-s <subdomain>", "--subdomain <subdomain>",
          "Join Campfire using <subdomain>") do |subdomain|
          JacquesMachine::Configuration.campfire_subdomain = subdomain
        end

        opts.on("-i", "--interactive",
          "Run in interactive mode on the command line") do
          JacquesMachine::Configuration.output = CommandLine.new
        end

        opts.on_tail("-v", "--version", "Print version number") do
          require "jacques-machine/version"
          out << "Jacques-Machine #{JacquesMachine::VERSION}\n"
          exit
        end

        opts.on_tail("-h", "--help", "Print this help") do
          out << "A machine can be a person.\n\n"
          out << opts
          out << "\nCreated and maintained by Etienne de Bruin, available under the MIT License.\n"
          out << "Report bugs and contribute at http://github.com/etdebruin/Jacques-Machine\n"
          exit
        end

      }.parse!(args)
      
      query = args.join(" ")

      if Configuration.campfire_key && Configuration.campfire_room && Configuration.campfire_subdomain
        puts "Joining Campfire..."
        Configuration.output = Campfire.new(Configuration.campfire_key, Configuration.campfire_room, Configuration.campfire_subdomain)
      end

      if Configuration.output
        JacquesMachine::output = Configuration.output
        JacquesMachine::interactive
      end

      if query == " "
        "Pick something dude?"
      end

    end
  end
end