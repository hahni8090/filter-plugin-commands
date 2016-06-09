# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "json"

# Dieses Filter-Plugin führt Befehle auf der Maschine aus:
# z.B.: Freier Festplattenplatz
class LogStash::Filters::Commands < LogStash::Filters::Base

  config_name "commands"
  
  # Replace the message with this value.
  config :command, :validate => :array, :required => true
  config :parameter1, :validate => :string, :default => ""
  config :parameter2, :validate => :string, :default => ""
  config :parameter3, :validate => :string, :default => ""
  config :parameter4, :validate => :string, :default => ""
  config :parameter5, :validate => :string, :default => ""

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)

    if @command
      option1 = event[@parameter1]
      option2 = event[@parameter2]
      option3 = event[@parameter3]
      option4 = event[@parameter4]
      option5 = event[@parameter5]
      # Befehl zusammenbauen und ausführen
      result = %x( #{command[1]} #{option1} #{option2} #{option3} #{option4} #{option5}) ##{fullcommand} ]
      #print "#{command[1]} #{option}\n"
      event[command[0]] = JSON.parse("#{result}")
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Commands
