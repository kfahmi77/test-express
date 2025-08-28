# syntax=docker/dockerfile:1
FROM node:20-alpine


# Direktori kerja di dalam container
WORKDIR /app


# Atur environment untuk produksi
ENV NODE_ENV=production


# Salin file manifest terlebih dahulu untuk caching layer dependensi
COPY package*.json ./


# Install deps tanpa devDependencies dan tanpa menjalankan scripts
RUN npm ci --omit=dev --ignore-scripts


# Salin sisa kode
COPY . .


# Container akan listen di port 3000 (Coolify dapat mengatur PORT env juga)
EXPOSE 3000


# Healthcheck sederhana (gunakan /health)
HEALTHCHECK --interval=30s --timeout=3s \
CMD wget -qO- http://localhost:${PORT:-3000}/health || exit 1


# Jalankan server
CMD ["node", "server.js"]