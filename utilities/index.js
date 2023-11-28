const invModel = require('../models/inventory-model');
const Util = {};
const jwt = require('jsonwebtoken');
require('dotenv').config();

/* ************************
 * Constructs the nav HTML unordered list
 ************************** */
Util.getNav = async function (req, res, next) {
  let data = await invModel.getClassifications();
  let list = '<ul>';
  list += '<li><a href="/" title="Home page">Home</a></li>';
  data.rows.forEach((row) => {
    list += '<li>';
    list +=
      '<a href="/inv/type/' +
      row.classification_id +
      '" title="See our inventory of ' +
      row.classification_name +
      ' vehicles">' +
      row.classification_name +
      '</a>';
    list += '</li>';
  });
  list += '</ul>';
  return list;
};

/* **************************************
 * Build the classification view HTML
 * ************************************ */
Util.buildClassificationGrid = async function (data) {
  let grid = '';
  if (data.length > 0) {
    grid = '<ul id="inv-display">';
    data.forEach((vehicle) => {
      grid += '<li>';
      grid +=
        '<a href="../../inv/detail/' +
        vehicle.inv_id +
        '" title="View ' +
        vehicle.inv_make +
        ' ' +
        vehicle.inv_model +
        'details"><img src="' +
        vehicle.inv_thumbnail +
        '" alt="Image of ' +
        vehicle.inv_make +
        ' ' +
        vehicle.inv_model +
        ' on CSE Motors" /></a>';
      grid += '<div class="namePrice">';
      grid += '<hr />';
      grid += '<h2>';
      grid +=
        '<a href="../../inv/detail/' +
        vehicle.inv_id +
        '" title="View ' +
        vehicle.inv_make +
        ' ' +
        vehicle.inv_model +
        ' details">' +
        vehicle.inv_make +
        ' ' +
        vehicle.inv_model +
        '</a>';
      grid += '</h2>';
      grid +=
        '<span>$' +
        new Intl.NumberFormat('en-US').format(vehicle.inv_price) +
        '</span>';
      grid += '</div>';
      grid += '</li>';
    });
    grid += '</ul>';
  } else {
    grid += '<p class="notice">Sorry, no matching vehicles could be found.</p>';
  }
  return grid;
};

/* **************************************
 * Build the vehicle details view HTML
 * ************************************ */
Util.buildVehicleDetail = async function (vehicle) {
  let grid;
  grid = '<div id="inv-details">';
  grid +=
    '<div id="inv-details-img"><img src="' +
    vehicle.inv_image +
    '" alt="Image of ' +
    vehicle.inv_make +
    ' ' +
    vehicle.inv_model +
    ' on CSE Motors" ></div>';
  grid += '<h2>' + vehicle.inv_make + ' ' + vehicle.inv_model + ' Details</h2>';
  grid +=
    '<div id="inv-details-year"><h3>Year</h3><strong>' +
    vehicle.inv_year +
    '</strong></div>';
  grid +=
    '<div id="inv-details-miles"><h3>Miles</h3><strong>' +
    new Intl.NumberFormat('en-US').format(vehicle.inv_miles) +
    '</strong></div>';
  grid +=
    '<div id="inv-details-type"><h3>Type</h3><strong>' +
    vehicle.classification_name +
    '</strong></div>';
  grid +=
    '<div id="inv-details-color"><h3>Color</h3><strong>' +
    vehicle.inv_color +
    '</strong></div>';
  grid +=
    '<div id="inv-details-price"><h3>Price</h3><strong>' +
    new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
    }).format(vehicle.inv_price) +
    '</strong></div>';
  grid +=
    '<div id="inv-details-description"><h3>Description</h3><p>' +
    vehicle.inv_description +
    '</p></div>';
  grid += '</div>'; // inv_details
  return grid;
};

/* ************************
 * Constructs the nav HTML unordered list
 ************************** */
Util.getOptions = async function (
  req,
  res,
  next,
  classification_selected = -1,
) {
  let data = await invModel.getClassifications();
  let list = '';
  let selected = '';
  data.rows.forEach((row) => {
    if (row.classification_id == classification_selected) {
      selected = 'selected';
    } else {
      selected = '';
    }
    list += `<option ${selected} value="${row.classification_id}">`;
    list += row.classification_name + '</option>';
  });
  return list;
};

/* ****************************************
 * Middleware For Handling Errors
 * Wrap other function in this for
 * General Error Handling
 **************************************** */
Util.handleErrors = (fn) => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next);

/* ****************************************
 * Middleware to check token validity
 **************************************** */
Util.checkJWTToken = (req, res, next) => {
  if (req.cookies.jwt) {
    jwt.verify(
      req.cookies.jwt,
      process.env.ACCESS_TOKEN_SECRET,
      function (err, accountData) {
        if (err) {
          req.flash('Please log in');
          res.clearCookie('jwt');
          return res.redirect('/account/login');
        }
        res.locals.accountData = accountData;
        res.locals.loggedin = 1;
        next();
      },
    );
  } else {
    next();
  }
};

/* ****************************************
 *  Check Login
 * ************************************ */
Util.checkLogin = (req, res, next) => {
  if (res.locals.loggedin) {
    next();
  } else {
    req.flash('notice', 'Please log in.');
    return res.redirect('/account/login');
  }
};

module.exports = Util;
