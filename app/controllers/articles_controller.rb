class ArticlesController < ApplicationController
before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /articles
  # GET /articles.xml
  def index
    @articles = find_by_month(params[:month],params[:year]) || Article.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  def find_by_month(month, year)
    if month.nil?
      # no month means no params - default to all articles by returning nil
      nil
    else
      # find a range of articles from start_date to end_date
      start_date = Time.gm(year, month, 1, 00,00,00)
      end_date = Time.gm(year, month, last_day(month, year), 00,00,00)
      Article.find(:all, :conditions => {:created_at => start_date..end_date}, :order => "created_at DESC")
    end
  end
    
  # Determines the date of the last day on the month i.e. 28, 29, 30 or 31
  def last_day(month, year)
    case month
    when 1 then 31
    when 2 then leap(year)
    when 3 then 31
    when 4 then 30
    when 5 then 31
    when 6 then 30
    when 7 then 31
    when 8 then 31
    when 9 then 30
    when 10 then 31
    when 11 then 30
    when 12 then 31
    else 31
    end
  end
  
  # Calculate the leap year
  def leap(year)
    if year%400 == 0
      29
    elsif year%100 == 0
      28
    elsif year%4 == 0
      29
    else
      28
    end
  end
end
