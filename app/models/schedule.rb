class Schedule < ApplicationRecord
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_date_check, if: -> { end_time.present? }
  :all_day
  validates :memo, length: { maximum: 500 }
  validate :formatted_start_time, :formatted_end_time, if: -> { start_time.present? && end_time.present? }

  def end_date_check
    if end_time <= start_time
      errors.add(:end_time, "は開始日より後の日に設定してください")
    end
  end

  def formatted_start_time
    start_time.strftime('%Y/%m/%d') if start_time.present?
  end

  def formatted_end_time
    end_time.strftime('%Y/%m/%d') if end_time.present?
  end

end
