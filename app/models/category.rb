class Category < ApplicationRecord
  has_many :expenses

  def to_param
    return nil unless persisted?
    id.to_s
  end
end
