class Brags
  def initialize(article)
    @article = article
  end

  def random
    all_brags.sample
  end

  def all_brags
    [
"omg wiki #{@article.title} & see wut i just did to it",
"lol i just pwned the wiki page for #{@article.title}",
"hehe how long until somebody notices what I did to the #{@article.title} wiki",
"i tried to mess with #{@article.title} on wiki but its already so bad no one will notice lol",
"oh man i pwned wiki so hard. #{@article.url}",
"haha all the #{@article.title} fans is gonna be like WTF when they see what i did to the Wiki",
"if wiki wasnt so bad already theyd fix what i did to #{@article.title}",
"what is wiki even doing? like, look at this #{@article.url}"
    ]
  end
end
