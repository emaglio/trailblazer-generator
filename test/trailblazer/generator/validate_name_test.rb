require 'test_helper'

class Trailblazer::Generator::ValidateName < Minitest::Test

  class Op < Trailblazer::Operation
    step :validate_class!

    def validate_class!(options, params:, **)
      return true if params[:name].match REGEXP

      options['failure_message'] = 'You provided an invalid class name'
      options['error_code'] = ERROR_INVALID_CLASS_NAME
      false
    end
  end

  def test_invalid_name
    result = Op.(name: "report")
    assert_equal true, result.failure?
    assert_equal "You provided an invalid class name", result["failure_message"]
    assert_equal 1, result["error_code"]
  end

  def test_invalid_name_only_numbers
    result = Op.(name: "124")
    assert_equal true, result.failure?
    assert_equal "You provided an invalid class name", result["failure_message"]
    assert_equal 1, result["error_code"]
  end

  def test_invalid_name_with_numbers
    result = Op.(name: "report124")
    assert_equal true, result.failure?
    assert_equal "You provided an invalid class name", result["failure_message"]
    assert_equal 1, result["error_code"]
  end

  def test_invalid_name_with_column
    result = Op.(name: "Report::Create")
    assert_equal true, result.success?
    assert_equal "Report::Create", result["params"][:name]
  end

  def test_valid_name
    result = Op.(name: "Report")
    assert_equal true, result.success?
    assert_equal "Report", result["params"][:name]
  end

  def test_valid_name_UpperCamelCase
    result = Op.(name: "RePort")
    assert_equal true, result.success?
    assert_equal "RePort", result["params"][:name]
  end
end
