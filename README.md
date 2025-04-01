# API des Headers

Cette application est une API simple écrite en TypeScript en utilisant le module natif `http` de `Node.js`.

Elle propose un endpoint `/ping` qui renvoie les headers de la requête HTTP au format JSON pour les requêtes GET. Toute autre requête retourne une réponse vide avec un code HTTP 404.

## Prérequis

- `Node.js`
- `npm`
- `TypeScript`

## Instructions

```console
$ git clone https://github.com/geoffrey-diederichs/WIK-DPS-TP01.git

$ cd WIK-DPS-TP01/

$ ./run.sh
```

Pour définir un port personnalisé :

```console
$ export PING_LISTEN_PORT=9090

$ npm install --save-dev @types/node

$ npx tsc

$ npm start
```

## Routes de l'API

- `GET /ping` : renvoie une réponse JSON contenant les headers de la requête entrante.

- Autres routes : `404 Not Found`.