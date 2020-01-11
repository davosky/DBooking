# frozen_string_literal: true

class BigRoom < ApplicationRecord
  before_create :set_id
  def set_id
    last_id = BigRoom.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :bookable, presence: true
  validates :booked, presence: true
end
