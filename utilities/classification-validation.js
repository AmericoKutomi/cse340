const utilities = require('.');
const { body, validationResult } = require('express-validator');
const validate = {};
const invModel = require('../models/inventory-model');

/*  **********************************
 *  Classification Data Validation Rules
 * ********************************* */
validate.classificationRules = () => {
  return [
    // classification_name is required and must be string
    body('classification_name')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a classification name.') // on error this message is sent.
      .matches(/^[A-Za-z]+/)
      .withMessage(
        'Classification name must contain only letters, no spaces and no special characters.',
      ) // on error this message is sent.
      .custom(async (classification_name) => {
        const classificationExists = await invModel.checkExistingClassification(
          classification_name,
        );
        if (classificationExists) {
          throw new Error('Classification already exists.');
        }
      }),
  ];
};

/* ******************************
 * Check data and return errors or continue to registration
 * ***************************** */
validate.checkClassificationData = async (req, res, next) => {
  const { classification_name } = req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    res.render('./inventory/add-classification', {
      errors,
      title: 'Add New Classification',
      nav,
      classification_name,
    });
    return;
  }
  next();
};

module.exports = validate;
