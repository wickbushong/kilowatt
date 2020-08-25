Option.destroy_all
Group.destroy_all

Scraper.call

groups = ["Lighting", "Kitchen", "Living Room", "Bedroom", "Garage", "Backyard", "Laundry", "Bathroom", "Climate Control", ]

groups.each do |g|
    Group.create(name: g)
end