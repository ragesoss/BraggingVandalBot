class Brags
  def initialize(article)
    @article = article
  end

  def random
    text = coin_flip ? "#{interjections.sample} #{main_subject.sample}" : "#{main_subject.sample} #{interjections.sample}"
    text += " #{@article.url}" if lacks_title_or_url?(text)
    text
  end

  def _composed_brags
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

  def main_subject
    [
      "what i did to #{topics.sample}",
      "i pwned #{topics.sample} so hard",
      "i tried to mess with #{topics.sample}",
      "if wiki wasnt so bad already theyd fix what i did to #{topics.sample}",
      "wiki #{@article.title} & see wut i just did to it",
      "what is #{topics.sample} even doing? like, look at it"
    ]
  end

  def interjections
    %w(
      bam! damn haha hehe kek lmao lol omg *snort* wat whoa wow wtf WTF yass
    )
  end

  def topics
    [
      "the wiki page for #{@article.title}",
      @article.title,
      "the #{@article.title} wiki",
      "wiki",
      "the wiki",
      "the wikipedia page #{@article.title}",
      "#{@article.title} on Wiki",
      "this #{@article.url}"
    ]
  end

  def coin_flip
    [true, false][rand(2)]
  end

  def lacks_title_or_url?(text)
    !text.include?(@article.title) && !text.include?(@article.url)
  end
end
