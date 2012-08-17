module ApplicationHelper
  def datepicker_locale
    locale = I18n.locale.to_s
    locale = locale[0,2] if locale.length > 2
    return locale = 'fr' unless ['fr'].include?(locale)
    locale
  end
end
