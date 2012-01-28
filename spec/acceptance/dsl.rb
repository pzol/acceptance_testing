module AccepteanceTests
  def self.included(base)
    base.instance_eval do
      alias :background :before
      alias :scenario :it
    end
  end
end
RSpec.configuration.include AccepteanceTests

Kernel.class_eval do
  alias :story :describe
end
