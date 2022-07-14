class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_status

  def dashboard

  end

  private

  def check_subscription_status
    unless current_user.active_subscription
      redirect_to checkout_path(
        line_items: ['price_1LLViVK6ujX76fINkl6K1W2h'],
        payment_mode: 'subscription'
      ), alert: 'You must have an active subscription to access this page.'
    end
  end
end
