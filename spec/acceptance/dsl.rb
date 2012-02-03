module AcceptanceTests
  def self.included(base)
    base.instance_eval do
      alias :background :before
      alias :scenario :it
    end

    base.class_eval do
      attr_accessor :user

      def _(text)
        example.description << "\n    #{text}".white
      end
    end

  end
end

RSpec.configure do |config|
  config.include AcceptanceTests
end

Kernel.class_eval do
  alias :story :describe
end
