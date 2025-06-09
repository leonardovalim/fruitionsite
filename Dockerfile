FROM node:18

# Cria a pasta de trabalho
WORKDIR /app

# Copia o package.json e package-lock.json primeiro para cache eficiente
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do projeto
COPY . .

# Gera o build estático
RUN npm run build

# Instala o servidor estático
RUN npm install -g serve

# Comando final para servir os arquivos
CMD ["serve", "-s", "build"]
