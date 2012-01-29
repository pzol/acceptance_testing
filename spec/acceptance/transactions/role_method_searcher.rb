module Role
  module MethodSearcher
    def searches_by_method(method)
      fill_in 'method', :with => method
      click_button 'searchButton'
    end
  end
end
