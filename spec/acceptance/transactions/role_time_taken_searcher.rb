module Role
  module TimeTakenSearcher
    def searches_for_time_taken(time_taken)
      fill_in 'time_taken', :with => time_taken
      click_button 'searchButton'
    end
  end
end
