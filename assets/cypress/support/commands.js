// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add("resetdb", () => {
  cy.checkoutdb();
  cy.request("POST", "/end-to-end/db/reset").as("resetDb");
  cy.checkindb();
  // cy.exec("cd .. && MIX_ENV=test mix ecto.reset");
});

Cypress.Commands.add("checkoutdb", () => {
  cy.request("POST", "/end-to-end/db/checkout").as("checkoutDb");
});

Cypress.Commands.add("checkindb", () => {
  cy.request("POST", "/end-to-end/db/checkin").as("checkinDb");
});

Cypress.Commands.add("factorydb", (schema, attrs) => {
  cy.log(`Creating a ${schema} via fullstack factory`);
  cy.request("POST", "/end-to-end/db/factory", {
    schema: schema,
    attributes: attrs,
  }).as("factoryDb");
});
