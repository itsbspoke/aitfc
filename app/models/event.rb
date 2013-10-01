class Event < ActiveRecord::Base
  validate :start_time_in_future

  validates_uniqueness_of :title

  def start_time_in_future
    if Time.zone.now > start_time
      errors.add(:start_time, "must be in the future")
    end
  end
end
