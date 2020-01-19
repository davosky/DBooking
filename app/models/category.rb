# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :big_rooms
  has_many :small_rooms
end
