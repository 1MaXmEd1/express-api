#Используем образ линукс Alpine с версией node 14
FROM node:19.5.0-alpine
#Указываем нашу рабочую папку для контейнера
WORKDIR /app

#Скопировать package.json и package-lock.json внутрь контейнера (app)
COPY package*.json ./
#Устанавливаем зависимости 
RUN npm install

#Копируем оставшееся приложение в контейнера первая точка это где мы находимся и вторая тогда (app)
COPY . .

#Устанавливаем Prisma
RUN npm install -g prisma
#Генерируем Prisma client
RUN prisma generate
#Копируем Prisma schema 
COPY prisma/schema.prisma ./prisma/

#Открывать порт в нашем контейнере
EXPOSE 3000
#Запуск сервера
CMD ["npm","start"]


