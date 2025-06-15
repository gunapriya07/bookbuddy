# lib/kafka/consumer.rb
require "kafka"
require_relative "../../config/environment"  # Load Rails

kafka = Kafka.new([ "localhost:9092" ], client_id: "bookbuddy-consumer")

puts "📡 Listening to 'book-events' topic..."

begin
  kafka.each_message(topic: "book-events") do |message|
    puts "📘 Received message: #{message.value}"

    # Enqueue background job
    BookEventHandlerJob.perform_later(message.value)
  end
rescue Interrupt
  puts "\n🛑 Consumer stopped."
end
