require "test_helper"

class DeliverymenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deliveryman = deliverymen(:one)
  end

  test "should get index" do
    get deliverymen_url, as: :json
    assert_response :success
  end

  test "should create deliveryman" do
    assert_difference('Deliveryman.count') do
      post deliverymen_url, params: { deliveryman: { address_id: @deliveryman.address_id, cpf: @deliveryman.cpf, name: @deliveryman.name, vehicle_id: @deliveryman.vehicle_id } }, as: :json
    end

    assert_response 201
  end

  test "should show deliveryman" do
    get deliveryman_url(@deliveryman), as: :json
    assert_response :success
  end

  test "should update deliveryman" do
    patch deliveryman_url(@deliveryman), params: { deliveryman: { address_id: @deliveryman.address_id, cpf: @deliveryman.cpf, name: @deliveryman.name, vehicle_id: @deliveryman.vehicle_id } }, as: :json
    assert_response 200
  end

  test "should destroy deliveryman" do
    assert_difference('Deliveryman.count', -1) do
      delete deliveryman_url(@deliveryman), as: :json
    end

    assert_response 204
  end
end
