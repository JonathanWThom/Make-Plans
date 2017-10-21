class DateValidator < ActiveModel::Validator
  def validate(record)
    begin
      record.happening_at_string.present? &&
        DateTime.strptime(record.happening_at_string, "%m/%d/%Y %I:%M %p")
    rescue
      record.errors[:happening_at_string] << "Invalid date format"
    end
  end
end
