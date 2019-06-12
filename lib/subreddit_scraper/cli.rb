module SubredditScraper
  class Cli
    extend Menu::Actions
    def self.before # used to append methods
      (self.singleton_class.instance_methods - self.superclass.singleton_class.instance_methods).each do |name|
        next if name == :before
        m = method(name)
        define_singleton_method(name) do |*args, &block|  
          Gem.win_platform? ? (system "cls") : (system "clear")
          m.call(*args, &block)
        end
      end
    end

    before # appending clearing the console to all methods to keep the console clear
  end
end