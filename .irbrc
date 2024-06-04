# frozen_string_literal: true

# Customize the IRB prompt to show the current Rails environment.
# See: https://github.com/ruby/irb/blob/master/lib/irb.rb

IRB.conf[:USE_AUTOCOMPLETE] = false

if defined?(Rails)
  APP_NAME = Rails.application.class.module_parent_name.underscore

  GREEN = "\e[1;32m"
  YELLOW = "\e[1;33m"
  RED = "\e[1;31m"
  PURPLE = "\e[1;35m"
  NC = "\e[0m"

  ENV_PROMPTS = {
    "development" => "#{GREEN}dev#{NC}",
    "test" => "#{YELLOW}test#{NC}",
    "production" => "#{RED}prod#{NC}",
  }

  prompt = "#{APP_NAME}(#{ENV_PROMPTS.fetch(Rails.env, "#{PURPLE}#{Rails.env}#{NC}")})"

  IRB.conf[:PROMPT][:RAILS_ENV] = {
    # Simple prompt.
    PROMPT_I: "#{prompt}:%03n:%i> ",

    # Prompt when continuing a string.
    PROMPT_S: "#{prompt}:%03n:%i%l ",

    # Prompt when continuing a statement
    PROMPT_C: "#{prompt}:%03n:%i* ",

    # Format of return value.
    RETURN: "=> %s\n",
  }

  IRB.conf[:PROMPT_MODE] = :RAILS_ENV
end
