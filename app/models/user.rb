class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, as: :answerable
  validates :name, :presence => true

  def add_view
    this.profile_views = this.profile_views + 1
  end
end
