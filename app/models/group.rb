class Group < ActiveRecord::Base
    belongs_to :user
    has_many :device_groups
    has_many :devices, through: :device_groups
    validates :name, presence: true
end