class User < ApplicationRecord
  has_paper_trail

  has_one_attached :file
end
