require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { age: @ticket.age, city_id: @ticket.city_id, country_id: @ticket.country_id, gender: @ticket.gender, q_age_from: @ticket.q_age_from, q_age_to: @ticket.q_age_to, q_city_id: @ticket.q_city_id, q_country_id: @ticket.q_country_id, q_gender: @ticket.q_gender, q_region_id: @ticket.q_region_id, region_id: @ticket.region_id, user_id: @ticket.user_id }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    put :update, id: @ticket, ticket: { age: @ticket.age, city_id: @ticket.city_id, country_id: @ticket.country_id, gender: @ticket.gender, q_age_from: @ticket.q_age_from, q_age_to: @ticket.q_age_to, q_city_id: @ticket.q_city_id, q_country_id: @ticket.q_country_id, q_gender: @ticket.q_gender, q_region_id: @ticket.q_region_id, region_id: @ticket.region_id, user_id: @ticket.user_id }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end
end
