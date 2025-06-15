# test/support/kafka_stub_helper.rb
module KafkaStubHelper
  def stub_kafka_producer
    KafkaProducer.any_instance.stubs(:publish).returns(true)
  end
end
