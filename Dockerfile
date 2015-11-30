FROM magellan/node-helloworld

ENV MAGELLAN_PROXY_VERSION 0.1.1

RUN apk --update add curl \
  && curl -SLO "https://github.com/groovenauts/magellan-proxy/releases/download/v${MAGELLAN_PROXY_VERSION}/magellan-proxy-${MAGELLAN_PROXY_VERSION}_linux-amd64" \
  && mv magellan-proxy-${MAGELLAN_PROXY_VERSION}_linux-amd64 /usr/local/bin/magellan-proxy \
  && chmod +x /usr/local/bin/magellan-proxy \
  && apk del curl \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/magellan-proxy", "--port", "3000"]
CMD ["npm", "start"]
