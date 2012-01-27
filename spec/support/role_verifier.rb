module Role
  module Verifier

    def sees!(content, message=nil)
      page.should have_content(content),  message || "User should see #{content} on the page\n#{page.text}"
    end

    def sees_link!(link, message=nil)
      page.should have_link?(link), message || "User should see link #{link} on the page\n#{page.text}"
    end

    def sees_field!(field, opts={}, message=nil)
      page.should have_field?(field, opts), message || "User should see field #{field} #{opts.inspect} on the page\n #{page.text}"
    end
  end
end  
