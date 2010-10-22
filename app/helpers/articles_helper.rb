module ArticlesHelper
  def link_id(name, current_path)
    if current_page?(name, current_path)
      'id = "current"'
    else
      ''
    end
  end
  
  private
  def current_page?(name, path)
    if name == 'Ben' && path == '/ben'
      true
    elsif name == 'For Hire' && path == '/for_hire' 
      true
    elsif name == 'Blog' && (path =~ /.*articles.*/ || path == '/')
      true
    else
      false
    end
  end
end
