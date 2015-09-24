class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_future
  validate :poster_image_file_or_url

  mount_uploader :poster_image, ImageUploader

  def review_average
    if reviews.size > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  protected

  def release_date_is_in_future
    if release_date.present?
      errors.add(:release_date, "should be in the future") if release_date < Date.today
    end
  end

  def poster_image_file_or_url
    if !poster_image && !url
      errors.add(:poster_image, "file or url is required")
    end
  end

end
