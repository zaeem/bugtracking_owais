class Bug < ApplicationRecord

  FEATURES = ['new', 'started', 'completed']
  BUGS = ['new', 'started', 'resolved']

  mount_uploader :attachment,  AttachmentUploader

  belongs_to :project
  belongs_to :user
  belongs_to :developer, :class_name => "User"
end
