class AppenderMiddleware
  def grab_appl(appl)
    @appl = appl
  end

  def new(appl)
    grab_appl(appl)
    super(appl)
  end

  def initialize(appl)
    @appl = appl
  end

  # @override in child method
  def prepend()
  	""
  end

  # CHILD MUST CONTAIN METHOD "prepend" OR IT WILL CRASH
  def alter_response_body(body)
    new_body = ""
  	new_body << ""
  	body.each {|string|
  		new_body << " " << string
  	}
  	new_body << append
  end

  # calls the inner application
  def call env
    @env = env
    status, headers, body = @appl.call(env)
    new_body = alter_response_body(body)
    [status, headers, [new_body]]
  end

end