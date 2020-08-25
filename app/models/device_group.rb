class DeviceGroup < ActiveRecord::Base
    belongs_to :device
    belongs_to :group
end