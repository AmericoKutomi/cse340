const utilities = require('../utilities/');
const accountModel = require('../models/account-model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require('dotenv').config();

/* ****************************************
 *  Deliver login view
 * *************************************** */
async function buildLogin(req, res, next) {
  let nav = await utilities.getNav();
  res.render('account/login', {
    title: 'Login',
    nav,
    errors: null,
  });
}

/* ****************************************
 *  Deliver registration view
 * *************************************** */
async function buildRegister(req, res, next) {
  let nav = await utilities.getNav();
  res.render('account/register', {
    title: 'Register',
    nav,
    errors: null,
  });
}

/* ****************************************
 *  Process Registration
 * *************************************** */
async function registerAccount(req, res) {
  let nav = await utilities.getNav();
  const {
    account_firstname,
    account_lastname,
    account_email,
    account_password,
  } = req.body;

  // Hash the password before storing
  let hashedPassword;
  try {
    // regular password and cost (salt is generated automatically)
    hashedPassword = await bcrypt.hashSync(account_password, 10);
  } catch (error) {
    req.flash(
      'notice',
      'Sorry, there was an error processing the registration.',
    );
    res.status(500).render('account/register', {
      title: 'Registration',
      nav,
      errors: null,
    });
  }

  const regResult = await accountModel.registerAccount(
    account_firstname,
    account_lastname,
    account_email,
    hashedPassword,
  );

  if (regResult) {
    req.flash(
      'notice',
      `Congratulations, you\'re registered ${account_firstname}. Please log in.`,
    );
    res.status(201).render('account/login', {
      title: 'Login',
      nav,
      errors: null,
    });
  } else {
    req.flash('notice', 'Sorry, the registration failed.');
    res.status(501).render('account/register', {
      title: 'Registration',
      nav,
      errors: null,
    });
  }
}

/* ****************************************
 *  Process login request
 * ************************************ */
async function accountLogin(req, res) {
  let nav = await utilities.getNav();
  const { account_email, account_password } = req.body;
  const accountData = await accountModel.getAccountByEmail(account_email);
  if (!accountData) {
    req.flash('notice', 'Please check your credentials and try again.');
    res.status(400).render('account/login', {
      title: 'Login',
      nav,
      errors: null,
      account_email,
    });
    return;
  }
  try {
    if (await bcrypt.compare(account_password, accountData.account_password)) {
      delete accountData.account_password;
      const accessToken = jwt.sign(
        accountData,
        process.env.ACCESS_TOKEN_SECRET,
        { expiresIn: 3600 * 1000 },
      );
      res.cookie('jwt', accessToken, { httpOnly: true, maxAge: 3600 * 1000 });
      return res.redirect('/account/');
    }
  } catch (error) {
    return new Error('Access Forbidden');
  }
}

/* ****************************************
 *  Deliver account management view
 * *************************************** */
async function buildAccountManagement(req, res, next) {
  let nav = await utilities.getNav();
  res.render('account/management', {
    title: 'Account Management',
    nav,
    errors: null,
  });
}

/* ****************************************
 *  Deliver account update view
 * *************************************** */
async function buildUpdate(req, res, next) {
  let nav = await utilities.getNav();
  let accountData = await accountModel.getAccountById(res.locals.accountId);
  if (!accountData) {
    req.flash('notice', 'Please check your credentials and try again.');
    res.status(501).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
    return;
  }
  res.render('account/update', {
    title: 'Update Account Information',
    nav,
    errors: null,
    account_firstname: accountData.account_firstname,
    account_lastname: accountData.account_lastname,
    account_email: accountData.account_email,
    account_id: accountData.account_id,
  });
}

/* ****************************************
 *  Process Update Basic information
 * *************************************** */
async function updateBasic(req, res) {
  let nav = await utilities.getNav();
  const { account_firstname, account_lastname, account_email, account_id } =
    req.body;

  const regResult = await accountModel.updateAccountBasic(
    account_firstname,
    account_lastname,
    account_email,
    account_id,
  );

  if (regResult) {
    res.locals.accountFirstName = account_firstname;
    req.flash('notice', `Information update completed successfully.`);
    res.status(201).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
  } else {
    req.flash(
      'notice',
      'Sorry, the update failed. Probably the email account is already in use.',
    );
    res.status(500).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
  }
}

/* ****************************************
 *  Process Update Password information
 * *************************************** */
async function updatePassword(req, res) {
  let nav = await utilities.getNav();
  const { account_password, account_id } = req.body;

  // Hash the password before storing
  let hashedPassword;
  try {
    // regular password and cost (salt is generated automatically)
    hashedPassword = await bcrypt.hashSync(account_password, 10);
  } catch (error) {
    req.flash(
      'notice',
      'Sorry, there was an error processing the registration.',
    );
    res.status(500).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
  }

  const regResult = await accountModel.updateAccountPassword(
    hashedPassword,
    account_id,
  );

  if (regResult) {
    req.flash('notice', `Password update completed successfully.`);
    res.status(201).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
  } else {
    req.flash('notice', 'Sorry, the update failed.');
    res.status(501).render('account/management', {
      title: 'Account Management',
      nav,
      errors: null,
    });
  }
}

/* ****************************************
 *  Process logout request
 * ************************************ */
async function accountLogout(req, res) {
  res.clearCookie('jwt');
  res.locals.accountData = undefined;
  res.locals.loggedin = undefined;
  res.locals.accountType = undefined;
  res.locals.accountFirstName = undefined;
  res.locals.accountId = undefined;
  return res.redirect('/');
}

module.exports = {
  buildLogin,
  buildRegister,
  registerAccount,
  buildAccountManagement,
  accountLogin,
  buildUpdate,
  updateBasic,
  updatePassword,
  accountLogout,
};
