/// <reference types="cypress" />

context("Sample", () => {
  // https://on.cypress.io/interacting-with-elements

  it("can see contacts", () => {
    cy.factorydb("contact", { first_name: "John", last_name: "Malcovich" });
    cy.visit("/contacts");
    cy.get("li").contains("John");
    cy.get("li").contains("Malcovich");
  });

  it("works with live view", () => {
    cy.visit("/contacts_live_demo");
    cy.get("input[name=first_name]").type("James");
    cy.get("input[name=last_name]").type("Bond");
    cy.get("form").submit();

    cy.contains("James");
    cy.contains("Bond");
  });
});
