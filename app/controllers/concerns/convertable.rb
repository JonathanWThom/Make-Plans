module Convertable
  extend ActiveSupport::Concern

  def convert_happening_at
    if happening_at_string.present?
      converted = DateTime.strptime(happening_at_string, '%m/%d/%Y %I:%M %p')
      self.update_column("happening_at", converted)
    end
  end

end
