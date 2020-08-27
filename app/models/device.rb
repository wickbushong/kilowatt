class Device < ActiveRecord::Base
    has_many :device_groups
    has_many :groups, through: :device_groups
    validates :name, presence: true
    validates :usage, presence: true, numericality: true
    validates :power, presence: true, numericality: true
    validates :standby, presence: true, numericality: true
    validate :group_validation


    def group_validation
        if groups.empty?
            errors.add(:group, "must be specified")
        end
    end
end