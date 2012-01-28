module Role
  module Navigator

    def login(page='/')
      load_cookie_from_file unless $cookies
      visit page
      if page.has_selector? :css, "#loginBox"
        page.fill_in "email", :with => "anixe"
        page.fill_in "password", :with => "anixe-nx"
        page.click_button "sign in"
        save_cookie_to_file
      end
      visit page unless page.driver.current_url[page] 
    end

    def is_on_page!(url)
      page.driver.current_url.should match /#{url}/i
    end

    def cookie_filename
      File.expand_path('../../../tmp/cookies', __FILE__)
    end

    def load_cookie_from_file
      $cookies = File.read(cookie_filename) if File.exist?(cookie_filename)
      page.driver.browser.set_cookie($cookies)
    end

    def save_cookie_to_file
      File.open(cookie_filename, "w") { |file| file.write(page.driver.browser.get_cookies.first)  }
    end

  end
end
