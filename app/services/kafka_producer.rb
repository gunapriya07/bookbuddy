# app/services/kafka_producer.rb
require "kafka"

class KafkaProducer
  def self.publish(topic, message)
    return if Rails.env.production? || Rails.env.test? || ENV["DISABLE_KAFKA"] == "true"

    kafka = Kafka.new([ "localhost:9092" ], client_id: "bookbuddy")
    kafka.deliver_message(message, topic: topic)
  end
end
