const invModel = require('../models/inventory-model');
const reviewModel = require('../models/review-model');
const utilities = require('../utilities/');

const invCont = {};

/* ***************************
 *  Build inventory by classification view
 * ************************** */
invCont.buildByClassificationId = async function (req, res, next) {
  const classification_id = req.params.classificationId;
  const classification = await invModel.getClassificationById(
    classification_id,
  );
  const className = classification.rows[0].classification_name;
  const data = await invModel.getInventoryByClassificationId(classification_id);
  const grid = await utilities.buildClassificationGrid(data);
  let nav = await utilities.getNav();

  res.render('./inventory/classification', {
    title: className + ' vehicles',
    nav,
    grid,
    errors: null,
  });
};

/* ***************************
 *  Build vehicle details by inventory id view
 * ************************** */
invCont.buildByInventoryId = async function (req, res, next) {
  const inv_id = req.params.invId;
  const data = await invModel.getInventoryByInvId(inv_id);
  const reviews = await reviewModel.getReviewByInvId(inv_id);
  const grid = await utilities.buildVehicleDetail(data, reviews);
  let nav = await utilities.getNav();
  const inv_make = data.inv_make;
  const inv_model = data.inv_model;
  const inv_year = data.inv_year;
  res.render('./inventory/vehicle', {
    title: inv_make + ' ' + inv_model + ' ' + inv_year,
    nav,
    grid,
    errors: null,
  });
};

/* ***************************
 *  Build management view
 * ************************** */
invCont.buildManagement = async function (req, res, next) {
  let nav = await utilities.getNav();
  const classificationSelect = await utilities.getOptions();
  res.render('inventory/management', {
    title: 'Vehicle Management',
    nav,
    classificationSelect,
    errors: null,
  });
};

/* ***************************
 *  Deliver Add Classification view
 * ************************** */
invCont.buildAddClassification = async function (req, res, next) {
  let nav = await utilities.getNav();
  res.render('./inventory/add-classification', {
    title: 'Add New Classification',
    nav,
    errors: null,
  });
};

/* ***************************
 *  Deliver Add Inventory view
 * ************************** */
invCont.buildAddInventory = async function (req, res, next) {
  let nav = await utilities.getNav();
  let options = await utilities.getOptions();
  let inv_image = '/images/vehicles/no-image.png';
  let inv_thumbnail = '/images/vehicles/no-image-tn.png';
  res.render('./inventory/add-inventory', {
    title: 'Add New Vehicle',
    options,
    nav,
    inv_image,
    inv_thumbnail,
    errors: null,
  });
};

/* ***************************
 *  Deliver Edit Inventory view
 * ************************** */
invCont.buildEditInventory = async function (req, res, next) {
  const inv_id = parseInt(req.params.invId);
  let nav = await utilities.getNav();
  const itemData = await invModel.getInventoryByInvId(inv_id);
  const name = `${itemData.inv_make} ${itemData.inv_model}`;
  let options = await utilities.getOptions(itemData.classification_id);
  res.render('./inventory/edit-inventory', {
    title: 'Edit ' + name,
    options,
    nav,
    errors: null,
    inv_id: itemData.inv_id,
    inv_make: itemData.inv_make,
    inv_model: itemData.inv_model,
    inv_year: itemData.inv_year,
    inv_description: itemData.inv_description,
    inv_image: itemData.inv_image,
    inv_thumbnail: itemData.inv_thumbnail,
    inv_price: itemData.inv_price,
    inv_miles: itemData.inv_miles,
    inv_color: itemData.inv_color,
    classification_id: itemData.classification_id,
  });
};

/* ****************************************
 *  Classification Registration
 * *************************************** */
invCont.registerClassification = async function (req, res) {
  const { classification_name } = req.body;
  const regResult = await invModel.addClassification(classification_name);

  if (regResult) {
    req.flash('notice', `New classification ${classification_name} added.`);
    let nav = await utilities.getNav();
    const classificationSelect = await utilities.getOptions();
    res.status(201).render('inventory/management', {
      title: 'Vehicle Management',
      nav,
      classificationSelect,
      errors: null,
    });
  } else {
    req.flash('notice', 'Sorry, adding new classification failed.');
    let nav = await utilities.getNav();
    res.status(501).render('inventory/add-classification', {
      title: 'Add New Classification (with problem)',
      nav,
      errors: null,
    });
  }
};

/* ****************************************
 *  Inventory Registration
 * *************************************** */
invCont.registerInventory = async function (req, res) {
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
  const regResult = await invModel.addInventory(
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
  );

  if (regResult) {
    req.flash(
      'notice',
      `New vehicle ${inv_make} ${inv_model} ${inv_year} added.`,
    );
    let nav = await utilities.getNav();
    const classificationSelect = await utilities.getOptions();
    res.status(201).render('inventory/management', {
      title: 'Vehicle Management',
      nav,
      errors: null,
      classificationSelect,
      errors: null,
    });
  } else {
    req.flash('notice', 'Sorry, adding new vehicle failed.');
    let nav = await utilities.getNav();
    let options = await utilities.getOptions(classification_id);
    res.status(501).render('inventory/add-inventory', {
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
  }
};

/* ***************************
 *  Return Inventory by Classification As JSON
 * ************************** */
invCont.getInventoryJSON = async (req, res, next) => {
  const classification_id = parseInt(req.params.classification_id);
  const invData = await invModel.getInventoryByClassificationId(
    classification_id,
  );
  if (invData) {
    return res.json(invData);
  } else {
    next(new Error('No data returned'));
  }
};

/* ****************************************
 *  Inventory Update
 * *************************************** */
invCont.updateInventory = async function (req, res) {
  const {
    classification_id,
    inv_id,
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
  const updateResult = await invModel.updateInventory(
    classification_id,
    inv_id,
    inv_make,
    inv_model,
    inv_year,
    inv_description,
    inv_image,
    inv_thumbnail,
    inv_price,
    inv_miles,
    inv_color,
  );

  if (updateResult) {
    const itemName = updateResult.inv_make + ' ' + updateResult.inv_model;
    req.flash('notice', `The ${itemName} was successfully updated.`);
    res.redirect('/inv/');
  } else {
    let options = await utilities.getOptions(classification_id);
    const itemName = `${inv_make} ${inv_model}`;
    req.flash('notice', 'Sorry, the update failed.');
    res.status(501).render('inventory/edit-inventory', {
      title: 'Edit ' + itemName,
      nav,
      options,
      errors: null,
      inv_id,
      inv_make,
      inv_model,
      inv_year,
      inv_description,
      inv_image,
      inv_thumbnail,
      inv_price,
      inv_miles,
      inv_color,
      classification_id,
    });
  }
};

/* ***************************
 *  Deliver Delete Inventory view
 * ************************** */
invCont.buildDeleteInventory = async function (req, res, next) {
  const inv_id = parseInt(req.params.invId);
  let nav = await utilities.getNav();
  const itemData = await invModel.getInventoryByInvId(inv_id);
  const name = `${itemData.inv_make} ${itemData.inv_model}`;
  res.render('./inventory/delete-inventory', {
    title: 'Delete ' + name,
    nav,
    errors: null,
    inv_id: itemData.inv_id,
    inv_make: itemData.inv_make,
    inv_model: itemData.inv_model,
    inv_year: itemData.inv_year,
    inv_price: itemData.inv_price,
  });
};

/* ****************************************
 *  Inventory Deletion
 * *************************************** */
invCont.deleteInventory = async function (req, res) {
  const { inv_id, inv_make, inv_model, inv_year, inv_price } = req.body;
  const deleteResult = await invModel.deleteInventory(inv_id);

  if (deleteResult) {
    const itemName = inv_make + ' ' + inv_model;
    req.flash('notice', `The ${itemName} was successfully deleted.`);
    res.redirect('/inv/');
  } else {
    const itemName = `${inv_make} ${inv_model}`;
    req.flash('notice', 'Sorry, the delete failed.');
    res.status(501).render('inventory/delete-inventory', {
      title: 'Delete ' + itemName,
      nav,
      errors: null,
      inv_id,
      inv_make,
      inv_model,
      inv_year,
      inv_price,
    });
  }
};

module.exports = invCont;
