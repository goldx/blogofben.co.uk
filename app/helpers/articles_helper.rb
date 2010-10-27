module ArticlesHelper
  def link_id(name, current_path)
    if current_page?(name, current_path)
      'id = "current"'
    else
      ''
    end
  end
  
  def title_pic
    lang = ['ruby', 'java', 'python', 'cplusplus']
    image_tag("/images/title-#{lang[rand(4)]}.png", :id => 'title')
  end
  
  private
  def current_page?(name, path)
    if name == 'Ben' && path == '/ben'
      true
    elsif name == 'Projects' && path == '/for_hire' 
      true
    elsif name == 'Blog' && (path =~ /.*articles.*/ || path == '/')
      true
    else
      false
    end
  end
  
  def select_by_month
    articles = Article.find(:all)
    date_list = DateList.new
    
    articles.each do |a|
      if date_list.new_month?(a.created_at.month, a.created_at.year)
        date_list.add(a.created_at.month, a.created_at.year)
      else
        date_list.increment(a.created_at.month, a.created_at.year)
      end
    end
    
    html ="" 
    date_list.dates.each do |list|
      html+=link_to("#{to_month(list[:month])} #{list[:year].to_s[2..3]} (#{list[:count]})", 
                                        articles_path(:month => list[:month], :year => list[:year]))+"<br />"
    end
    
    return html
  end
  
  private
  
  def to_month(num)
      case num
      when 1 then "January"
      when 2 then "February"
      when 3 then "March"
      when 4 then "April"
      when 5 then "May"
      when 6 then "June"
      when 7 then "July"
      when 8 then "August"
      when 9 then "September"
      when 10 then "October"
      when 11 then "November"
      when 12 then "December"
      else "Unknown Month...?"
      end
  end
  
  class DateList
    
    attr_reader :dates
    
    def initialize
      @dates = Array.new
    end
    
    def new_month?(month, year)
      @dates.each do |d|
        if d[:month] == month && d[:year] == year
          return false
        end
      end
      true
    end
    
    def increment(month, year)
      @dates.each do |d|
        if d[:month] == month && d[:year] == year
          d[:count]+=1
          return true
        end
      end
      return false
    end
    
    def add(month, year)
      new_month = {
        :month => month,
        :year => year,
        :count => 1
      }
      @dates.push(new_month)
    end
  end
  
end
