class Schedule < ApplicationRecord
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true, date: { after_or_equal_to: :start_time }
  :all_day
  validates :memo, length: { maximum: 500 }
  validate :formatted_start_time, :formatted_end_time

  def formatted_start_time
    start_time.strftime('%Y/%m/%d')
  end

  def formatted_end_time
    end_time.strftime('%Y/%m/%d')
  end

end
