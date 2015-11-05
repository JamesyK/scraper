class Comment

  attr_reader :name, :time, :body

  def initialize(comment)
    @name = name(comment)
    @time = time(comment)
    @body = body(comment)
  end

  def name(comment)
    comment.css('div span.comhead a')[0].text
  end

  def time(comment)
    comment.css('div span.comhead a')[1].text
  end

  def body(comment)
    body = comment.css('span.comment span.c00')-comment.css('div.reply')
    body.text
  end

end