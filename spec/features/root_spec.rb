require 'rails_helper'

RSpec.describe 'root' do 
  describe 'searching' do
    it 'finds the location' do
      visit root_path
      select "Griffin Coffee", from: :location 
      click_button 'Find Nearest Station'
      expect(current_path).to eq("/search")
      # Then I should see the closest electric fuel station to me.
      #    For that station I should see
      #      - Name
      #      - Address
      #      - Fuel Type
      #      - Access Times

      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Type")
      expect(page).to have_content("Access Times")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Travel Time")
save_and_open_page
      #   I should also see:
      #     - the distance of the nearest station (should be 0.1 miles)
      #     - the travel time from Griffin Coffee to that fuel station (should be 1 min)
      #     - The direction instructions to get to that fuel station
      #     "Turn left onto Lawrence St Destination will be on the left"
    end
  end
end