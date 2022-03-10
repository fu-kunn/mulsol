class Relatinship < ApplicationRecord
  belogs_to :follower, class_name: "Customer"
  belogs_to :followed, class_name: "Customer"
end
