require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url, as: :json
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { name: @client.name, phone: @client.phone, references: @client.references } }, as: :json
    end

    assert_response 201
  end

  test "should show client" do
    get client_url(@client), as: :json
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { name: @client.name, phone: @client.phone, references: @client.references } }, as: :json
    assert_response 200
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client), as: :json
    end

    assert_response 204
  end
end
