# Ambiente para Ruby on Rails 5.x com docker

A fim de utilizar durante o [curso](https://www.udemy.com/course/rubyonrails-5x)
um ambiente mais próximo do utilizado no dia-a-dia

## Construindo imagem

```bash
docker build -t rorv5_x .
```

- `docker build`: Diz que o Docker deve construir uma imagem;
- `-t rorv5_x`: Indica que o nome da imagem, `rorv5_x` é uma abreviação de
`Ruby on Rails v5.x`;
- `.`: Indica que o arquivo `Dockerfile` a ser utilizado para montar a imagem
está no mesmo diretório onde o comando está sendo executado.

## Criar container

```bash
docker run --rm -it rorv5_x bash
```

- `docker run`: Diz que o Docker deve iniciar um container;
- `--rm`: Indica que após o termino do container ele deve ser removido;
- `-it`: Indica que deve ser permitido interagir pelo terminal;
- `rorv5_x`: Indica que será usada a imagem contruída anteriormente;
- `bash`: Indica que será executado o bash do container.

## Criar container para projeto

Obs.: Volume é um recurso que permite o compartilhamento de arquivos entre sua
máquina e o container. Qualquer alteração feita localmente surtirá efeito no
container e vice-versa.

```bash
docker run --rm -it -p 3000:3000 -v "$(pwd):/app" -w "/app" rorv5_x bash
```

- `-p 3000:3000`: Indica que será mapeada a porta 3000
- `-v "$(pwd):/app"`: Indica que será criado um volume com o diretório onde o
comando está sendo executado e um diretório `app` na raiz do container;
- `-w "/app"`: Indica qual será a diretório de trabalho do container, este local
é onde será executado o comando que será para para o container.

### Iniciar aplicação rails

Obs.: Necessário ter criado container com no mínimo volume e porta mapeados.

```bash
yarn install
bundle check || bundle install

rm -f tmp/pids/server.pid

rails s -b 0.0.0.0
```

- `yarn install`: Instala as dependências do NodeJs;
- `bundle check || bundle install`: Instala as dependências faltantes;
- `rm -f tmp/pids/server.pid`: Apaga arquivo de processo do último servidor levantado;
- `rails server -b 0.0.0.0`: Levanta o servidor com a aplicação.

## Acessar container em execução

```bash
docker exec -it <container_name> bash
```

Obs.: Substitua `<container_name>` pelo nome do container que deseja acessar.

## Referências

- Arquivo [Dockerfile](https://docs.docker.com/engine/reference/builder)
- Comando [docker build](https://docs.docker.com/engine/reference/commandline/build)
- Comando [docker exec](https://docs.docker.com/engine/reference/commandline/exec)
- Comando [docker run](https://docs.docker.com/engine/reference/commandline/run)
- Comando [yarn install](https://classic.yarnpkg.com/en/docs/cli/install)
- Comando [bundle check](https://bundler.io/bundle_check.html)
- Comando [bundle install](https://bundler.io/bundle_install.html)
- Comando [rm](https://www.man7.org/linux/man-pages/man1/rm.1.html)
- Comando [rails server](https://guides.rubyonrails.org/command_line.html#bin-rails-server)
