class Post

  attr_reader :title, :url, :points, :item_id, :user, :time, :comment_array

  def initialize(page)
    begin
      @title = get_title(page)
      @url = get_url(page)
      @points = get_points(page)
      @item_id = get_item_id(page)
      @user = get_user(page)
      @time = get_time(page)

      @comment_array = []
      comments(page)
    rescue NoMethodError => e
      puts "Please enter a valid Hacker News post URL"
    end
  end

  def total_comments
    comment_array.length.to_s
  end

  def only_digit_points
    number = @points.to_s
    number[/\b\d+/]
  end

  private

  def get_title(page)
    page.css('tr.athing td.title a').first.text
  end

  def get_url(page)
    page.css('td.title a')[0]['href']
  end

  def get_points(page)
    page.css('tr td.subtext span.score').text
  end

  def get_item_id(page)
    page.css('td form input')[0]['value']
  end

  def get_user(page)
    page.css('td.subtext a')[0].text
  end

  def get_time(page)
    page.css('td.subtext a')[1].text
  end

  def comments(page)
    page.css('tr.athing td table').each do |comment|
      add_comment(comment)  
    end
  end

  def add_comment(comment)
    new_comment = Comment.new(comment)
    @comment_array << new_comment
  end
end