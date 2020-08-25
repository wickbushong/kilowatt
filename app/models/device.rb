class Device < ActiveRecord::Base
    belongs_to :user
    has_many :device_groups
    has_many :groups, through: :device_groups
    validates :name, presence: true
    validates :usage, presence: true, numericality: true
    validates :power, presence: true, numericality: true
    validates :stamdby, presence: true, numericality: true
end