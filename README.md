This repo demonstrates setup of Cypress with Phoenix(1.5.7).
Largely based on [excellent article](https://medium.com/@svengehring/phoenix-end-to-end-testing-in-real-life-efdba3a85be1) by Sven Gehring.

Defiations from the article:
1. Reset database does not use mix but uses special api call instead. This is done due to conflict with postgresql ability to drop database while server is running. 
2. Used slighly different model with simple ui to provide input for tests.

To play with:
```
MIX_ENV=test mix ecto.setup
MIX_ENV=test mix phx.server
cd assets && npx cypress open
```
To run tests:
```
MIX_ENV=test mix ecto.setup
MIX_ENV=test mix phx.server
cd assets && npx cypress run
```