class Group < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :devices
    validates :name, presence: true
end