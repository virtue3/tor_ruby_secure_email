class SecureEmailsController < ApplicationController
	def new 
		@secure_email
	end

	def create
		#render text: params[:post].inspect + params.to_s
		@secure_email = SecureEmail.new(post_params)
		@secure_email.save
		if(@secure_email.save)
			redirect_to @secure_email
		else
			render 'new'
		end
	end

	def show
		@secure_email = SecureEmail.find(params[:id])
	end

	def index
		@secure_email = SecureEmail.all
	end


	private
	def post_params
		params.require(:secure_emails).permit(:to, :bcc, :subject, :body)
	end
end
