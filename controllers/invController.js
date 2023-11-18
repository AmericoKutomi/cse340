const invModel = require('../models/inventory-model');
const utilities = require('../utilities/');

const invCont = {};

/* ***************************
 *  Build inventory by classification view
 * ************************** */
invCont.buildByClassificationId = async function (req, res, next) {
  const classification_id = req.params.classificationId;
  const data = await invModel.getInventoryByClassificationId(classification_id);
  const grid = await utilities.buildClassificationGrid(data);
  let nav = await utilities.getNav();
  const className = data[0].classification_name;
  res.render('./inventory/classification', {
    title: className + ' vehicles',
    nav,
    grid,
  });
};

/* ***************************
 *  Build vehicle details by inventory id view
 * ************************** */
invCont.buildByInventoryId = async function (req, res, next) {
  const inv_id = req.params.invId;
  const data = await invModel.getInventoryByInvId(inv_id);
  const grid = await utilities.buildVehicleDetail(data[0]);
  let nav = await utilities.getNav();
  const inv_make = data[0].inv_make;
  const inv_model = data[0].inv_model;
  const inv_year = data[0].inv_year;
  res.render('./inventory/vehicle', {
    title: inv_make + ' ' + inv_model + ' ' + inv_year,
    nav,
    grid,
  });
};

module.exports = invCont;
