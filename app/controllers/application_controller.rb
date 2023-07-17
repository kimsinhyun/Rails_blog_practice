class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query
  before_action :set_categories

  private

  def set_query
    @query = Post.ransack(params[:q])
  end

  def set_notifications
    notifications = Notification.where(recipient: current_user).includes(:recipient).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end

  def set_categories
    @nav_categories = Category.where(display_in_nav: true)
  end
end
