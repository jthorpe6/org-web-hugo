FROM alpine:latest
RUN apk update && \
  apk add --no-cache \
  hugo \
  git
RUN hugo new site org-web-hugo
WORKDIR /org-web-hugo/
RUN git init && \
  git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke && \
  echo "theme = 'ananke'" >> hugo.toml
EXPOSE 1313
ENTRYPOINT ["hugo", "serve", "--bind", "0.0.0.0"]
