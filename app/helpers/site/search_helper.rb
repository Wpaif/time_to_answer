module Site::SearchHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      t('site.message.last_added')
    when 'question'
      t('site.message.seach_message', term: params[:term])
    when 'subject'
      t('site.message.filter_message', subject: params[:subject])
    end
  end
end
