class Author < ActiveRecord::Base
  include TagConcern
  acts_as_taggable

  paginates_per 10
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poems
  has_many :short_stories

  validates :email, presence: :true, uniqueness: :true
end
