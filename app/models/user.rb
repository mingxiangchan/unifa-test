# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  identifier      :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_identifier  (identifier)
#

class User < ApplicationRecord
  validates :identifier, presence: true
  validates :password_digest, presence: true
  has_secure_password
end
