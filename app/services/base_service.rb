class BaseService
  attr_reader :errors, :data

  def initialize
    @errors = []
  end

  def success?
    @errors.empty?
  end

  def add_error(error)
    @errors << error
  end

  def error_messages
    @errors.map { |e| e.message }
  end
end
