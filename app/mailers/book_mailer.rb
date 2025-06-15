class BookMailer < ApplicationMailer
  default from: "gunapriya77776@gmail.com"

  def new_book_email
    @title = params[:title]
    mail(to: params[:email], subject: "📚 New Book Added: #{@title}")
  end
end
