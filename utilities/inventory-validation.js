const utilities = require('.');
const { body, validationResult } = require('express-validator');
const validate = {};
const invModel = require('../models/inventory-model');

/*  **********************************
 *  Inventory Data Validation Rules
 * ********************************* */
validate.inventoryRules = () => {
  return [
    // classification_id is required and it is a number
    body('classification_id')
      .trim()
      .isNumeric()
      .withMessage('Please select one classification.'),

    // inv_make is required and must be string
    body('inv_make')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a make name.'),

    // inv_model is required and must be string
    body('inv_model')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a model name.'),

    // inv_year is required and it is a number
    body('inv_year')
      .trim()
      .isNumeric({ min: 1886 })
      .withMessage('The Year must be a number and greater than 1885.'),

    // inv_description is required and must be string
    body('inv_description')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a description.'),

    // inv_image is required and must be string
    body('inv_image')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a image file path.'),

    // inv_thumbnail is required and must be string
    body('inv_thumbnail')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a thumbnail image file path.'),

    // inv_price is required and it is a decimal number
    body('inv_price')
      .trim()
      .isDecimal({ min: 1 })
      .withMessage('The Price must be a number and it is required.'),

    // inv_miles is required and it is a number
    body('inv_miles').trim().isNumeric().withMessage('Miles must be a number.'),

    // inv_color is required and must be string
    body('inv_color')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a color.'),
  ];
};

/* ******************************
 * Check data and return errors or continue to registration
 * ***************************** */
validate.checkInventoryData = async (req, res, next) => {
  const {
    classification_id,
    inv_make,
    inv_model,
    inv_year,
    inv_description,
    inv_image,
    inv_thumbnail,
    inv_price,
    inv_miles,
    inv_color,
  } = req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    let options = await utilities.getOptions(
      req,
      res,
      next,
      (classification_selected = classification_id),
    );
    res.render('./inventory/add-inventory', {
      errors,
      title: 'Add New Vehicle',
      // classification_id,
      inv_make,
      inv_model,
      inv_year,
      inv_description,
      inv_image,
      inv_thumbnail,
      inv_price,
      inv_miles,
      inv_color,
      nav,
      options,
    });
    return;
  }
  next();
};

module.exports = validate;
