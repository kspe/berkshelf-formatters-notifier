require 'terminal-notifier'

module Berkshelf
  module Formatters
    class NotificationCenter
      include AbstractFormatter

      register_formatter :nc

      def initialize
        Berkshelf.ui.mute!

        @output = {
          cookbooks: Array.new,
          errors: Array.new,
          messages: Array.new
        }
        @cookbooks_names = Array.new
        @cookbooks = Hash.new
        super
      end

      def cleanup_hook
        cookbooks.each do |name, details|
          details[:name] = name
          output[:cookbooks] << name
          cookbooks_names << name
        end

        notify "\u2705" + cookbooks_names.join(",")
        notify "\u2757" + output[:errors].join(",")   unless output[:errors].empty?
        notify "\u2757" + output[:messages].join(",") unless output[:messages].empty?
      end

      # Add a Cookbook installation entry to delayed output
      #
      # @param [String] cookbook
      # @param [String] version
      # @param [~Location] location
      def install(cookbook, version, location)
        cookbooks[cookbook] ||= {}
      end

      # Add a Cookbook use entry to delayed output
      #
      # @param [String] cookbook
      # @param [String] version
      # @param [~Location] location
      def use(cookbook, version, location = nil)
        cookbooks[cookbook] ||= {}
      end

      # Add a Cookbook upload entry to delayed output
      #
      # @param [String] cookbook
      # @param [String] version
      # @param [String] chef_api_url
      def upload(cookbook, version, chef_api_url)
        cookbooks[cookbook] ||= {}
      end

      # Add a Cookbook package entry to delayed output
      #
      # @param [String] cookbook
      # @param [String] destination
      def package(cookbook, destination)
        cookbooks[cookbook] ||= {}
      end

      # Output Cookbook info entry to delayed output
      #
      # @param [CachedCookbook] cookbook
      def show(cookbook)
        cookbooks[cookbook.cookbook_name] = cookbook.pretty_hash
      end

      # Add a generic message entry to delayed output
      #
      # @param [String] message
      def msg(message)
        output[:messages] << message
      end

      # Add an error message entry to delayed output
      #
      # @param [String] message
      def error(message)
        output[:errors] << message
      end

      private
        def notify(msg)
          TerminalNotifier.notify(msg, title: "Berkshelf")        
        end

        attr_reader :output
        attr_reader :cookbooks
        attr_reader :cookbooks_names
    end
  end
end

