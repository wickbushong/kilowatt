User.destroy_all
Device.destroy_all
DeviceGroup.destroy_all
Group.destroy_all
Option.destroy_all

Scraper.call

# groups = ["Lighting", "Kitchen", "Living Room", "Bedroom", "Garage", "Backyard", "Laundry", "Bathroom", "Climate Control", ]

# groups.each do |g|
#     Group.create(name: g)
# end

User.create(
    username: "wick",
    email: "blah@fake.com",
    password: "1234"
)

User.create(
    username: "user2",
    email: "number@two.com",
    password: "pass2"
)