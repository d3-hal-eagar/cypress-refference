/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

Then(`I am displayed the following on the 'Free Credit Report' block`, () => {
    // Section Header: Free Credit Report
    cy.get('[data-test="header"] h1').contains('Free Credit Report');
    // Section text
    cy.get('[data-test="header"] p').contains('So you\'re looking to get on a lender\'s good side. You\'re probably wondering, \"What\'s an all-in-one recipe for identity theft protection and better financial decisions?\" Well, the solution is simple: It all starts with checking your credit report. Get your free credit report from TransUnion today, and start improving the way lenders see you!');
    // Section sub-header: No credit card required
    cy.get('[data-test="header"] h4').contains('No credit card required');
    // Section note
    cy.get('[data-test="header"] span').contains('Includes a New Free Credit Report from TransUnion every 30 days on sign in.');
    // Cta button
    cy.get('[data-test="landing-page-section"] button').contains('Get your free credit report');
});

Then(`I am displayed the 'Hero Image' block`, () => {
    cy.get('[data-test="header"] div:nth-of-type(1) img').should('be.visible');
});

Then(`I am displayed the following on the 'Why get your free Credit Report' block`, () => {
    // Section Header: Why get your free Credit Report from TransUnion?
    cy.get('[data-test="report-section"] h2').contains('Why get your free Credit Report from TransUnion?');
    cy.get('[data-test="report-section"] button').contains('Get started now for free');

    //Latest Cedit Section
    cy.get('[data-test="latest-credit-section"] h3').contains('See your latest credit information');
    cy.get('[data-test="latest-credit-section"] span').contains('See the same type of information that lenders see when requesting your credit.');
    cy.get('[data-test="latest-credit-section"] p').contains('Your credit report is a pretty big deal. It’s full of important financial information such as trade lines, credit inquiries, payment history, and any debts that you may be accumulating. Lenders will use this information to determine your creditworthiness. If you’re looking to improve the state of your credit report, then it’s important to keep an eye on your financial reflection.');

    //Up To Date Section
    cy.get('[data-test="up-to-date-section"] h3').contains('Stay up-to-date');
    cy.get('[data-test="up-to-date-section"] span').contains('Get an updated Experian Credit Report every 30 days when you sign into your account.');
    cy.get('[data-test="up-to-date-section"] p').contains('Your credit report is constantly being updated. Typically, your account information is updated on a monthly basis. Additionally, if a public record is filed (such as a civil judgment, a tax lien, or bankruptcy), it may take a month or more for the record to appear. Of course, it can be difficult to keep track of all these changes. But Experian makes it easier to manage your credit report. You\'ll be able to stay up-to-date with these changes every 30 days from the comfort of your laptop!');

    //Identify Issues Section
    cy.get('[data-test="identify-issues-section"] h3').contains('Identify Possible Issues');
    cy.get('[data-test="identify-issues-section"] span').contains('Review your report on a regular basis for negative items that may impact your credit.');
    cy.get('[data-test="identify-issues-section"] p').contains('Improving the st-ate of your credit report starts with monitoring it regularly. Staying on top of your report on a monthly basis gives you an ample amount of time to dispute any errors before they have the chance to impact your report negatively. In doing so, you\'ll also be protecting yourself against identity theft and credit card fraud. For instance, if someone else has been using your Social Security number to apply for credit, you may not see the signs unless you take a closer look at your credit report.');

    //Know When Section
    cy.get('[data-test="know-when-section"] h3').contains('Know When To Act');
    cy.get('[data-test="know-when-section"] span').contains('By having all the information in front of you on your credit profile, you can make better decisions.');
    cy.get('[data-test="know-when-section"] p').contains('Monitoring your credit report isn\'t just an act of maintenance. It\'s an act of protection. By protecting your credit report, you\'re not just warding off errors and identity theft. You\'re improving the health of your credit score as well. When you act quickly, you\'ll be able to resolve any errors or issues on your credit report before they have the chance to impact your credit score negatively. Who wouldn\'t want to land themselves a better credit score in the process of protecting their identity?');
});

Then(`I am displayed the following on the 'Credit Report resources' block`, () => {
    // Section Header: Credit Report resources
    cy.get('[data-test="resources-section"] h2').contains('Credit Report resources');

    //Article 1
    cy.get('[data-test="article0"] h4').contains('Why Do Closed Accounts Show On My Report?');
    cy.getElement('article0-short').contains('...');

    //Article 2
    cy.get('[data-test="article1"] h4').contains('Does Refinancing Affect My Credit?');
    cy.getElement('article1-short').contains('...');

    //Article 3
    cy.get('[data-test="article2"] h4').contains('Do Multiple Auto Inquiries Show On My Report?');
    cy.getElement('article2-short').contains('...');
});

Then(`I am displayed the following on the 'Credit Report basics' block`, () => {
    //QA 1
    cy.get('[data-test="basics-qa"] h5').contains('Why is my Credit Report important?');
    cy.get('[data-test="basics-qa"] p').contains('Your credit report is your financial reflection. It shows lenders several things, including your current and past credit mix, how timely your payments have been, and whether your accounts are currently (or have been) in good standing.');

    //QA 2
    cy.get('[data-test="basics-qa"] h5').contains('How often is my Credit Report updated?');
    cy.get('[data-test="basics-qa"] p').contains('While the day of the month will vary between organizations, your credit report is updated on a monthly basis. Creditors submit information throughout the month, which will then show up on your credit report by the end of the month.');

    //QA 3
    cy.get('[data-test="basics-qa"] h5').contains('How to Get Your Annual Credit Report from Experian?');
    cy.get('[data-test="basics-qa"] p').contains('Under federal law you are entitled to a copy of your credit report annually from all three credit reporting agencies - Experian');
    cy.get('[data-test="basics-qa"] p').contains('®');
    cy.get('[data-test="basics-qa"] p').contains('and TransUnion');
    cy.get('[data-test="basics-qa"] p').contains('- once every 12 months. To get your annual credit report online, and by phone or mail, visit');
    cy.get('[data-test="basics-qa"] p').contains('www.AnnualCreditReport.com');

    //included-section
    cy.get('[data-test="included-section"] h5').contains('What is included in a Credit Report?');
    
    //li 1
    cy.get('[data-test="included-section"] ul li span').contains('Personal identifying information:');
    cy.get('[data-test="included-section"] ul li').contains('Your full name along, address (past and current), date of birth, social security number, and employer information.');

    //li 2
    cy.get('[data-test="included-section"] ul li span').contains('Accounts:');
    cy.get('[data-test="included-section"] ul li').contains('Revolving credit, installment loans, account status, contact information, credit limits, loan amounts, recent payments, and individual or joint responsibility.');

    //li 3
    cy.get('[data-test="included-section"] ul li span').contains('Payment information:');
    cy.get('[data-test="included-section"] ul li').contains('Details regarding all monthly payments across all accounts.');

    //li 4
    cy.get('[data-test="included-section"] ul li span').contains('Public records:');
    cy.get('[data-test="included-section"] ul li').contains('Bankruptcies, tax liens, and civil judgments.');

    //li 5
    cy.get('[data-test="included-section"] ul li span').contains('Debts:');
    cy.get('[data-test="included-section"] ul li').contains('Any and all debts owed across all accounts, such as credit card debt and mortgages.');

    //li 6
    cy.get('[data-test="included-section"] ul li span').contains('Hard inquiries:');
    cy.get('[data-test="included-section"] ul li').contains('\"Hard inquiries\" appear on your credit report any time you apply for credit. ');

    //li 7
    cy.get('[data-test="included-section"] ul li span').contains('Negative information:');
    cy.get('[data-test="included-section"] ul li').contains('Late payments, collections, settled accounts, repossession or voluntary surrender, charge offs, and other derogatory items.');
});

Then(`I am displayed the following on the 'landing footer' block`, () => {
    cy.get('[data-test="footer-section"] h2').contains('Get your Free Credit Report today');
    cy.get('[data-test="footer-section"] button').contains('Get started now for free');
    cy.get('[data-test="footer-section"] h5').contains('No credit card required');
});

Then(`I should see full Article 1 and link to Read Less`, () => {
    cy.getElement('article0-long').contains('Despite popular belief, closing an account does not remove it from your credit report. Even accounts that were in good standing before being closed will normally remain on your credit report. This could be for any number of reasons, such as the creditor reporting the account\'s date of last activity to reporting agencies. However, the most common (and most prominent) reason for this stems from accounts that were not in good standing before being closed. For instance, an account that was charged off can have a negative impact on your credit report for up to seven years plus 180 days from the start of the delinquency. The same is true for an account in collections as well.');
    cy.getElement('read0-link').contains('Read Less');
});

Then(`I should see shortened Article 1 and link to Read More`, () => {
    cy.getElement('article0-short').contains('...');
    cy.getElement('read0-link').contains('Read More');
});

Then(`I should see full Article 2 and link to Read Less`, () => {
    cy.getElement('article1-long').contains('When you apply for new loans (including refinance loans), these inquiries will show up on your credit report as "hard inquiries". Several hard inquiries can lower your credit score by a few points. Because of this, you\'ll want to keep these inquiries low. But by monitoring your credit report, you can gauge the impact of hard inquiries on your credit score. When you\'re proactive about monitoring your credit report, your credit score will ultimately thank you.');
    cy.getElement('read1-link').contains('Read Less');
});

Then(`I should see shortened Article 2 and link to Read More`, () => {
    cy.getElement('article1-short').contains('...');
    cy.getElement('read1-link').contains('Read More');
});

Then(`I should see full Article 3 and link to Read Less`, () => {
    cy.getElement('article2-long').contains('When you\'re shopping for auto loans, you can typically inquire multiple times without it having a negative impact on your credit report. Credit scoring systems do so by counting all auto loan inquiries within a certain period of time as a single inquiry. However, it is important to keep in mind that that time period my vary slightly from one credit scoring system to another. Because of this, it is important to keep an eye on your credit report when you are in the process of seeking the perfect auto loan.');
    cy.getElement('read2-link').contains('Read Less');
});

Then(`I should see shortened Article 3 and link to Read More`, () => {
    cy.getElement('article2-short').contains('...');
    cy.getElement('read2-link').contains('Read More');
});


