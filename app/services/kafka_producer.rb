# app/services/kafka_producer.rb
require "kafka"

class KafkaProducer
  def self.publish(topic, message)
    kafka = Kafka.new([ "localhost:9092" ], client_id: "bookbuddy")
    kafka.deliver_message(message, topic: topic)
  end
end
