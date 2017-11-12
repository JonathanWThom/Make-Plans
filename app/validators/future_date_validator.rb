class FutureDateValidator < ActiveModel::Validator
  def validate(record)
    ### needs to happen after conversion
    begin
      record.happening_at_string.present? && record.happening_at_string < Date.today
    rescue
      record.errors[:happening_at_string] << "Date cannot be in the past"
    end
  end
end
