const utilities = require('.');
const { body, validationResult } = require('express-validator');
const validate = {};
const invModel = require('../models/inventory-model');

/*  **********************************
 *  Review Data Validation Rules
 * ********************************* */
validate.reviewRules = () => {
  return [
    // review_comment is required and must be string
    body('user_review_comment')
      .trim()
      .isLength({ min: 10 })
      .withMessage('Please provide a comment with at least 10 characters.'),

    // review_grade is required and it is a number between 1 and 5
    body('user_review_grade')
      .trim()
      .isInt({ min: 1, max: 5 })
      .withMessage('Review score must be between 1 and 5.'),
  ];
};

/* ******************************
 * Check data and return errors or continue to registration
 * ***************************** */
validate.checkReviewData = async (req, res, next) => {
  const { user_review_id, inv_id, user_review_comment, user_review_grade } =
    req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    const inv_data = await invModel.getInventoryByInvId(inv_id);
    const name = `${inv_data.inv_make} ${inv_data.inv_model}`;
    res.render('review/edit-review', {
      title: 'Review for ' + name,
      nav,
      errors,
      inv_id,
      account_id: res.locals.accountData.account_id,
      user_review_comment,
      user_review_grade,
    });
    return;
  }
  next();
};

module.exports = validate;
