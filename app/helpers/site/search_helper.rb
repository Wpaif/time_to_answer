module Site::SearchHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      'Latest questions registered...'
    when 'question'
      "Latest questions for term \"#{params[:term]}\""
    when 'subject'
      "Questions for the \"#{params[:subject]}\""
    end
  end
end
