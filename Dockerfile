FROM node:18

# Define variável para evitar erro de crypto no Webpack com Node 18
ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# Instala servidor estático para servir o app
RUN npm install -g serve

# Serve a build otimizada
CMD ["serve", "-s", "build"]
