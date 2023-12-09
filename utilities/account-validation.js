const utilities = require('.');
const { body, validationResult } = require('express-validator');
const validate = {};
const accountModel = require('../models/account-model');

/*  **********************************
 *  Registration Data Validation Rules
 * ********************************* */
validate.registrationRules = () => {
  return [
    // firstname is required and must be string
    body('account_firstname')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a first name.'), // on error this message is sent.

    // lastname is required and must be string
    body('account_lastname')
      .trim()
      .isLength({ min: 2 })
      .withMessage('Please provide a last name.'), // on error this message is sent.

    // valid email is required and cannot already exist in the database
    body('account_email')
      .trim()
      .isEmail()
      .normalizeEmail() // refer to validator.js docs
      .withMessage('A valid email is required.')
      .custom(async (account_email) => {
        const emailExists = await accountModel.checkExistingEmail(
          account_email,
        );
        if (emailExists) {
          throw new Error('Email exists. Please log in or use different email');
        }
      }),

    // password is required and must be strong password
    body('account_password')
      .trim()
      .isStrongPassword({
        minLength: 12,
        minLowercase: 1,
        minUppercase: 1,
        minNumbers: 1,
        minSymbols: 1,
      })
      .withMessage('Password does not meet requirements.'),
  ];
};

/*  **********************************
 *  Login Data Validation Rules
 * ********************************* */
validate.loginRules = () => {
  return [
    // valid email is required and cannot already exist in the database
    body('account_email')
      .trim()
      .isEmail()
      .normalizeEmail() // refer to validator.js docs
      .withMessage('A valid email is required.'),

    // password is required and must be strong password
    body('account_password')
      .trim()
      .isStrongPassword({
        minLength: 12,
        minLowercase: 1,
        minUppercase: 1,
        minNumbers: 1,
        minSymbols: 1,
      })
      .withMessage('Password does not meet requirements.'),
  ];
};

/* ******************************
 * Check data and return errors or continue to registration
 * ***************************** */
validate.checkRegData = async (req, res, next) => {
  const { account_firstname, account_lastname, account_email } = req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    res.render('account/register', {
      errors,
      title: 'Registration',
      nav,
    });
    return;
  }
  next();
};

/* ******************************
 * Check data and return errors or continue to login
 * ***************************** */
validate.checkLoginData = async (req, res, next) => {
  const { account_email } = req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    res.render('account/login', {
      errors,
      title: 'Login',
      nav,
      account_email,
    });
    return;
  }
  next();
};

/* ******************************
 * Check if use is Employee or Admin
 * ***************************** */
validate.checkAccess = async (req, res, next) => {
  if (
    res.locals.accountData.account_type != 'Employee' &&
    res.locals.accountData.account_type != 'Admin'
  ) {
    req.flash('notice', `You need credentials to use this feature.`);
    return res.redirect('account/login');
  }
  next();
};

/*  **********************************
 *  Basic Data Validation Rules
 * ********************************* */
validate.basicRules = () => {
  return [
    // firstname is required and must be string
    body('account_firstname')
      .trim()
      .isLength({ min: 1 })
      .withMessage('Please provide a first name.'), // on error this message is sent.

    // lastname is required and must be string
    body('account_lastname')
      .trim()
      .isLength({ min: 2 })
      .withMessage('Please provide a last name.'), // on error this message is sent.

    // valid email is required and cannot already exist in the database
    body('account_email')
      .trim()
      .isEmail()
      .normalizeEmail() // refer to validator.js docs
      .withMessage('A valid email is required.'),
  ];
};

/* ******************************
 * Check basic data and return errors or continue to update
 * ***************************** */
validate.checkBasicData = async (req, res, next) => {
  const { account_firstname, account_lastname, account_email } = req.body;
  let errors = [];
  errors = validationResult(req);
  if (!errors.isEmpty()) {
    let nav = await utilities.getNav();
    res.render('account/update', {
      errors,
      title: 'Update Account Information',
      nav,
    });
    return;
  }
  next();
};

/*  **********************************
 *  Password Data Validation Rules
 * ********************************* */
validate.passwordRules = () => {
  return [
    // password is required and must be strong password
    body('account_password')
      .trim()
      .isStrongPassword({
        minLength: 12,
        minLowercase: 1,
        minUppercase: 1,
        minNumbers: 1,
        minSymbols: 1,
      })
      .withMessage('Password does not meet requirements.'),
  ];
};

module.exports = validate;
