class GreetingsMiddleware

  def initialize(appl)
    @appl = appl
  end

  def append
  	"... greetings from RubyLearning!!"
	end

  # insert a greeting
  def appender(body)
    append_s = append
    new_body = ""
    body.each { |string| new_body << " " << string }
    new_body << " " << append_s
  end

  # calls the inner application
  def call env
    status, headers, body, extra = @appl.call(env)
    new_body = appender(body)
    [status, headers, [new_body]]
  end

end