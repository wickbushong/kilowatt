class Group < ActiveRecord::Base
    has_many :device_groups
    has_many :devices, through: :device_groups
end