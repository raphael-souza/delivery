require "test_helper"

class ManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = managers(:one)
  end

  test "should get index" do
    get managers_url, as: :json
    assert_response :success
  end

  test "should create manager" do
    assert_difference('Manager.count') do
      post managers_url, params: { manager: { cnpj: @manager.cnpj, cpf: @manager.cpf, address_id: @manager.address_id, name: @manager.name, phone: @manager.phone, role: @manager.role, user_id: @manager.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show manager" do
    get manager_url(@manager), as: :json
    assert_response :success
  end

  test "should update manager" do
    patch manager_url(@manager), params: { manager: { cnpj: @manager.cnpj, cpf: @manager.cpf, address_id: @manager.address_id, name: @manager.name, phone: @manager.phone, role: @manager.role, user_id: @manager.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy manager" do
    assert_difference('Manager.count', -1) do
      delete manager_url(@manager), as: :json
    end

    assert_response 204
  end
end
