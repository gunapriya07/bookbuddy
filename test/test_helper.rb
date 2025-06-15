ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "mocha/minitest"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in_as(user)
      post login_url, params: { email: user.email, password: "password123" }
      assert_response :redirect
      follow_redirect!
    end

    # Automatically stub KafkaProducer#publish in all tests
    setup do
      KafkaProducer.any_instance.stubs(:publish).returns(true)
    end
  end
end
