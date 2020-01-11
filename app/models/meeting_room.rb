# frozen_string_literal: true

class MeetingRoom < ApplicationRecord
  before_create :set_id
  def set_id
    last_id = MeetingRoom.maximum(:id)
    self.id = last_id.to_i + 1
  end

  before_create :set_code
  def set_code
    last_code = MeetingRoom.maximum(:code)
    self.code = last_code.to_i + 1
  end

  validates :name, presence: true
  validates :description, presence: true
end
