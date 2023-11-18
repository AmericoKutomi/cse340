// Needed Resources
const express = require('express');
const router = new express.Router();
const utilities = require('../utilities/');

const invalidController = require('../controllers/invalidController');

// Route to build a supposed view
router.get('/sample', utilities.handleErrors(invalidController.buildSample));

module.exports = router;
