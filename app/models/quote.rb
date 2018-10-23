class Quote < ApplicationRecord

  def self.random_quote
    num_quotes = Quote.all.count
    quote = Quote.new(author: "everyone", quote_html: "Coffee makes everything better")
    if (num_quotes > 0)
      index = rand(num_quotes)
      quote = Quote.all[index]
    end
    return quote
  end
end

