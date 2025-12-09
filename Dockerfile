FROM node:alpine3.20

WORKDIR /app
# 建议改为 /app，比 /tmp 更符合标准，虽不强求

# [新增] 强制设置端口为 3000，解决与 EXPOSE 不一致的问题
ENV PORT=3000

COPY . .

EXPOSE 3000/tcp

# 安装依赖
# gcompat 是必须的，用于在 Alpine 上运行 glibc 编译的二进制文件(xray/cloudflared)
RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash &&\
    npm install

CMD ["node", "index.js"]
