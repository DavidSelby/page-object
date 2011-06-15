module PageObject
  module Elements
    class OrderedList < Element
      
      def initialize(element, platform)
        @element = element
        include_platform_for platform
      end
      
      protected
      
      def child_xpath
        ".//child::li"
      end
      
      def self.watir_finders
        [:class, :id, :index, :xpath]
      end

      def include_platform_for platform
        super
        if platform[:platform] == :watir
          require 'page-object/platforms/watir_ordered_list'
          self.class.send :include, PageObject::Platforms::WatirOrderedList
        elsif platform[:platform] == :selenium
          require 'page-object/platforms/selenium_ordered_list'
          self.class.send :include, PageObject::Platforms::SeleniumOrderedList
        else
          raise ArgumentError, "expect platform to be :watir or :selenium"          
        end
      end
  
    end
  end
end