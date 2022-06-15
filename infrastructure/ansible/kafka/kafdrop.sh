git clone https://github.com/obsidiandynamics/kafdrop && cd kafdrop

helm upgrade -i kafdrop chart --set image.tag=3.27.0 \
    --set kafka.brokerConnect=marcio-cluster-kafka-0.marcio-cluster-kafka-brokers.kafka.svc:9092 \
    --set server.servlet.contextPath="/" \
    --set jvm.opts="-Xms32M -Xmx64M"