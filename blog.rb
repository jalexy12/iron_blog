require 'date'

# Post title 1
# **************
# Post 1 text
# ----------------
# Post title 2
# **************
# Post 2 text
# ----------------
# Post title 3
# **************
# Post 3 text
# ----------------

class Blog
  def initialize
    @posts = []
  end

  def add_post(post)
    @posts.push(post)
  end

  def sorted_posts
    @posts.sort do | post1, post2 |
      post2.date <=> post1.date
    end
  end

  def publish_posts
    sorted_posts.each do | post |
      puts "#{post.title} |  #{post.date}"
      puts "*" * post.title.length
      puts post.text
      puts "----------------"
      puts ""
    end
  end
end

# Title, date, text
class Post
  attr_accessor(:title, :text, :date)
  def initialize(title, date, text)
    @title = title
    @date = date
    @text = text
  end
end

get_money_blog = Blog.new
spend_money_post = Post.new("Spend Money", Date.today - 4, "We dont do this around here...read my next posts")
get_money_post = Post.new("Get Money", Date.today, "Follow your mentor's advice, get that money")
save_money_post = Post.new("Save Money", Date.today - 2, "Stop spending money and put it in the piggy bank")
get_money_blog.add_post(save_money_post)
get_money_blog.add_post(get_money_post)
get_money_blog.add_post(spend_money_post)

get_money_blog.publish_posts
