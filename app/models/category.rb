class Category < ApplicationRecord
  before_create :generate_uuid_v7

  has_many :expenses

  def to_param
    return nil unless persisted?
    id.to_s
  end

  private

    def generate_uuid_v7
           
      # NOTE: self.class.attribute_types['id'].type is nil at this point

      self.id ||= SecureRandom.uuid_v7
    end
end
