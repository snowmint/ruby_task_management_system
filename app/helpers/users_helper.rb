module UsersHelper
  def user_role(x)
    key = x ? 'admin' : 'member'
    I18n.t('role_' + key, scope: :user_relate)
  end
end
