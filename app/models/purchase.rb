class Purchase < ApplicationRecord
    with_options presence: true do
        validates :price
    end
  
  belongs_to :user
  belongs_to :exhibition

end
