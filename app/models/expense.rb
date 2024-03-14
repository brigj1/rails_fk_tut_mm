class Expense < ApplicationRecord
  belongs_to :category

  def to_param
    return nil unless persisted?
    id.to_s
  end
end
