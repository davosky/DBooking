# frozen_string_literal: true

class SmallRoom < ApplicationRecord
  belongs_to :category, optional: true

  before_create :set_id
  def set_id
    last_id = SmallRoom.maximum(:id)
    self.id = last_id.to_i + 1
  end

  ransacker :start_time, type: :date do
    Arel.sql("date(start_time at time zone 'UTC' at time zone '#{Time.zone.name}')")
  end

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :bookable, presence: true
  validates :booked, presence: true
end
