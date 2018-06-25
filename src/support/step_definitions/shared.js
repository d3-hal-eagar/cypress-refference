(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
'use strict';

/* global cy, then, when, given */

then('I see {string} in the title', function (title) {
    cy.title().should('include', title);
});
then('take screenshot named {string}', function (filename) {
    cy.screenshot(filename);
});
then("take screenshot", function () {
    cy.screenshot();
});
when('I am on the {string} page', function (pageName) {
    // no host info, so it will use baseURL as set in cypress.json or env variable CYPRESS_baseURL
    cy.visit('/ck/lp');
});

},{}]},{},[1]);
