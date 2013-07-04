class ToValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class BccValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class SecureEmail < ActiveRecord::Base
	validates :to, presence: true, to: true
	validates :bcc, allow_blank: true, bcc: true
	validate :subject_body_not_blank

	def subject_body_not_blank
		puts "subject: #{subject} body:#{body}"
		if ((subject.nil? and body.nil?) and (body.empty? and subject.empty?)) == false
			errors.add(:body, "Can't be empty if subject is empty as well")
		end
	end

end
