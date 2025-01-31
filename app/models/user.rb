class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 },
                       presence: true,
                       confirmation: true,
                       if: -> { new_record? || changes[:crypted_password] }
end