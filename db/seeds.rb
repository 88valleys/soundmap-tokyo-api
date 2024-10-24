require "json"

puts "Destroying all livehouses from the DB... 😵"
Livehouse.destroy_all

# Path to your JSON file
file_path = Rails.root.join("db", "seeds", "livehouses.json")

puts "Getting the livehouses from the JSON..."

# Read and parse the JSON file
livehouses_data = JSON.parse(File.read(file_path))

# Iterate over each livehouse entry and create records in the database
livehouses_data.each do |livehouse|
  puts "Creating Livehouse: #{livehouse["title"]}"
  Livehouse.create!(
    title: livehouse["title"],
    address: livehouse["address"],
    picture: livehouse["picture"],
    hours: livehouse["hours"],
    capacity: livehouse["capacity"],
    website_url: livehouse["website_url"],
    contact_email: livehouse["contact_email"],
    nearest_station: livehouse["nearest_station"],
    event_calendar_url: livehouse["event_calendar_url"],
    genres: livehouse["genres"],
    equipment: livehouse["equipment"],
  )
end

# Print the count of livehouses
livehouse_count = Livehouse.count
puts "Livehouse DB updated! Total livehouses: #{livehouse_count} 💃"
