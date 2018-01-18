class Datafile < ApplicationRecord
  belongs_to :user
  mount_uploader :filen, DatafileUploader
end
