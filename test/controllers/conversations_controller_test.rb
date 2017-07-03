require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  let(:user)          {Fabricate(:user)}
  let(:conversation)  {Fabricate(:conversation, sender: user)}

  def test_a_conversation
    assert_instance_of Conversation, conversation
  end

  before do
    sign_in user
  end

  test "should get index" do
    get '/conversations'
    assert_response :success
  end

  test "should get new" do
    get '/conversations/new'
    assert_response :success
  end

  test "should create conversation" do
    assert_difference("Conversation.count") do
      post url_for(controller: 'conversations', action: :create, params: { conversation: {} })
    end

    assert_redirected_to conversation_url(Conversation.last)
  end

  test "should show conversation" do
    get conversation_url(conversation)
    assert_response :success
  end

  test "should get edit" do
    get edit_conversation_url(conversation)
    assert_response :success
  end

  test "should update conversation" do
    params = {
      id: conversation.id,
      conversation: {
        subject: 'Another Test Subject',
      }
    }

    patch "/conversations/#{conversation.id}/edit", params: params
    assert_equal "Conversation was successfully updated.", flash[:notice]
    assert_redirected_to "/conversations/#{conversation.id}"
  end

  test "should destroy conversation" do
    conversation_two = Fabricate(:conversation, sender: conversation.sender)

    assert_equal conversation_two.sender, conversation.sender

    assert_difference ->{ Conversation.count }, -1 do
      delete url_for(controller: 'conversations', action: :destroy, id: conversation_two.id)
    end
  end
end
