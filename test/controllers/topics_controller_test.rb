require "test_helper"

describe TopicsController do
  let(:topic) { topics :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:topics)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates topic" do
    expect {
      post :create, topic: { body: topic.body, title: topic.title }
    }.must_change "Topic.count"

    must_redirect_to topic_path(assigns(:topic))
  end

  it "shows topic" do
    get :show, id: topic
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: topic
    value(response).must_be :success?
  end

  it "updates topic" do
    put :update, id: topic, topic: { body: topic.body, title: topic.title }
    must_redirect_to topic_path(assigns(:topic))
  end

  it "destroys topic" do
    expect {
      delete :destroy, id: topic
    }.must_change "Topic.count", -1

    must_redirect_to topics_path
  end
end
