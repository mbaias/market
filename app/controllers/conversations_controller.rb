class ConversationsController < ParentClass
	def new
		@conversation = Conversation.new
	end
	
	def destroy
		@conversation.destroy
		flash[:notice] = "conversation deleted"
		redirect_to conversations_path
	end
	def create
		@conversation = Conversation.new conversation_params
		redirect_to @conversation
	end
	def show
		
	end
end