class APIVersionConstraint
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    @default || request.headers["FatZebra-API-Version"] == "1"
  end
end
