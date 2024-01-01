class Schedule < ApplicationRecord
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_time, presence: true
  # validates :end_time, presence: true, date: { after_or_equal_to: :start_time }
  validates :end_time, presence: true
  :all_day
  validates :memo, length: { maximum: 500 }

  def formatted_start_time
    start_time.strftime('%Y/%m/%d')
  end

  def formatted_end_time
    end_time.strftime('%Y/%m/%d')
  end

  def formatted_updated_at
    updated_at.in_time_zone('Tokyo').strftime('%Y/%m/%d %H:%M')
  end
end
