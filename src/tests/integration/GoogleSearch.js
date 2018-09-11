/// <reference types="Cypress" />
context('Actions', () => {
    beforeEach(() => {
        cy.visit('https://google.com');
    });

    it('Search University of Salford, on Google', () => {
        cy.get('form#tsf')
        .find('input#lst-ib')
        .type('university of salford');

        cy.get('form#tsf').submit();

        cy.get('.kp-blk.knowledge-panel.Wnoohf.OJXvsb').should(
                'contain',
                'Address: Maxwell Building, 43 Crescent, Salford M5 4WT',
            );
    });
});
