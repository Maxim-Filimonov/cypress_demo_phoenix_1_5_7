/// <reference types="cypress" />

context("Sample", () => {
  // https://on.cypress.io/interacting-with-elements

  it("can see contacts", () => {
    cy.factorydb("contact", { first_name: "John", last_name: "Malcovich" });
    cy.visit("/contacts");
    cy.get("li").contains("John");
    cy.get("li").contains("Malcovich");
  });
});
