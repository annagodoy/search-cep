# DESAFIO TÉCNICO
# search-cep
## instruçoes:

#### dependencias:
ruby `-v 3.2.2`

#### executar os seguintes comandos:
```console
% git clone https://github.com/annagodoy/search-cep.git
% gem install bundler
% cd search_cep
% bundle install
% rake db:setup
% rails server
```

Após os comandos acima a aplicação deverá estar rodando em ``http://localhost:3000/``


#### Para rodar os testes, executar seguintes comandos no terminal:

##### CONTROLLERS:
```console
% bundle exec rspec spec/controllers/api/v1/
```

##### INTERACTORS:
```console
% bundle exec rspec spec/interactors
```

##### MODELS:
```console
% bundle exec rspec spec/models
```