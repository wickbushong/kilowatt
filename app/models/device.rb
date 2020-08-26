class Device < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :groups
    validates :name, presence: true
    validates :usage, presence: true, numericality: true
    validates :power, presence: true, numericality: true
    validates :standby, presence: true, numericality: true
end