// Needed Resources
const express = require('express');
const router = new express.Router();
const utilities = require('../utilities/');
const accountController = require('../controllers/accountController');
const regValidate = require('../utilities/account-validation');

// Route to build account management view
router.get(
  '/',
  utilities.checkLogin,
  utilities.handleErrors(accountController.buildAccountManagement),
);

// Route to build login view
router.get('/login', utilities.handleErrors(accountController.buildLogin));

// Route to build registration view
router.get(
  '/register',
  utilities.handleErrors(accountController.buildRegister),
);

// Route to register a new Account
router.post(
  '/register',
  regValidate.registrationRules(),
  regValidate.checkRegData,
  utilities.handleErrors(accountController.registerAccount),
);

// Process the login attempt
router.post(
  '/login',
  regValidate.loginRules(),
  regValidate.checkLoginData,
  utilities.handleErrors(accountController.accountLogin),
);

// Account update
router.get(
  '/update',
  utilities.checkLogin,
  utilities.handleErrors(accountController.buildUpdate),
);

router.post(
  '/update/basic',
  regValidate.basicRules(),
  regValidate.checkBasicData,
  utilities.handleErrors(accountController.updateBasic),
);

router.post(
  '/update/password',
  regValidate.passwordRules(),
  // regValidate.checkPasswordData,
  utilities.handleErrors(accountController.updatePassword),
);

// Account logout
router.get('/logout', utilities.handleErrors(accountController.accountLogout));

module.exports = router;
