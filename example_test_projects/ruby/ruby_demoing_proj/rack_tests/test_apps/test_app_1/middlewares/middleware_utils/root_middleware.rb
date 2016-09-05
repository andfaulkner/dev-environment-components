class RootMiddleware
  def grab_appl(appl)
    @appl = appl
  end

  def new(appl)
    grab_appl(appl)
    super(appl)
  end

  # calls the inner application
  def call env
    status, headers, body = @appl.call(env)
    new_body = appender(body)
    [status, headers, [new_body]]
  end

end