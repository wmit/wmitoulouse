module CustomMatchers
  # ============================
  # = AccessDenied behaviour =
  # ============================

  class DenyAccess < RSpec::Matchers::BuiltIn::BaseMatcher
    include Rails.application.routes.url_helpers


    def initialize(scope)
      super(target)
      @scope = scope
    end

    # @api private
    def matches?(actual)
      match_unless_raises ActiveSupport::TestCase::Assertion do
        @scope.assert_redirected_to(target)
        raise ActiveSupport::TestCase::Assertion unless @scope.flash.key? :alert
      end
    end

    # @api private
    def failure_message_for_should
      rescued_exception.message
    end

    # @api private
    def failure_message_for_should_not
      "expected not to deny access, but did"
    end

    # @api private
    def target
      error_403_path
    end
  end

  def deny_access
    DenyAccess.new(self)
  end

  # ============================
  # = RecordNotFound behaviour =
  # ============================
  class NotFound < DenyAccess

    # @api private
    def matches?(actual)
      match_unless_raises ActiveSupport::TestCase::Assertion do
        @scope.assert_redirected_to(target)
      end
    end

    # @api private
    def failure_message_for_should_not
      "expected not to find record, but did"
    end

    # @api private
    def target
      error_404_path
    end
  end

  def be_not_found
    NotFound.new(self)
  end
end