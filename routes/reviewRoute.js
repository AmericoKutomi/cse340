const express = require('express');
const router = new express.Router();
const utilities = require('../utilities/');
const reviewController = require('../controllers/reviewController');
const regValidate = require('../utilities/review-validation');

// Route to build review registration view
router.get(
  '/update/:invId',
  utilities.checkLogin,
  utilities.handleErrors(reviewController.buildEditReview),
);

// Route to register a new Review or to update an existing one
router.post(
  '/update',
  utilities.checkLogin,
  regValidate.reviewRules(),
  regValidate.checkReviewData,
  utilities.handleErrors(reviewController.registerReview),
);

module.exports = router;
