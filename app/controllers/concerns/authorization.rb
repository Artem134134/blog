module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit::Authorization

  end
end