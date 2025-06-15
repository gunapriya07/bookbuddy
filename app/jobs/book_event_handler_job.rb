class BookEventHandlerJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "📬 Processing book event: #{message}"

    # Log message to file
    File.open(Rails.root.join("log", "book_events.log"), "a") do |file|
      file.puts("[#{Time.now}] #{message}")
    end

    # Extract book title (basic parsing from message)
    if message =~ /Book Created: \d+ - (.+)/
      book_title = $1.strip

      # Send email using BookMailer
      BookMailer.with(
        email: "gunapriya77776@gmail.com", # change if needed
        title: book_title
      ).new_book_email.deliver_now

      puts "📧 Email sent to gunapriya77776@gmail.com for book '#{book_title}'"
    else
      puts "⚠️ Could not parse book title from message: #{message}"
    end
  end
end
