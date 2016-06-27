
# Constants relating to logging. Defines all available log levels and ordinal values for each
class LOG_LEVEL
  self.const_set(:ALL_OPTIONS, [:verbose, :debug, :info, :warn, :error])

  self::ALL_OPTIONS.reverse.each_with_index do |mtd, index|
    self.class.send(:define_method, mtd.upcase) { index + 1 }
  end
end

LOG_LEVEL.freeze
