class Datafile < ApplicationRecord
  belongs_to :user
  mount_uploader :datafile, DatafileUploader
end
