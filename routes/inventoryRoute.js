// Needed Resources
const express = require('express');
const router = new express.Router();
const invController = require('../controllers/invController');
const utilities = require('../utilities/');
const classificationValidate = require('../utilities/classification-validation');
const inventoryValidate = require('../utilities/inventory-validation');
const accountValidate = require('../utilities/account-validation');

// Route to build inventory by classification view
router.get(
  '/type/:classificationId',
  utilities.handleErrors(invController.buildByClassificationId),
);

// Route to build a vehicle details by its inv_id
router.get(
  '/detail/:invId',
  utilities.handleErrors(invController.buildByInventoryId),
);

// Route to build management view
router.get(
  '/',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.buildManagement),
);

// Route to build add classification view
router.get(
  '/addclassification',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.buildAddClassification),
);

// Route to add a new Classification
router.post(
  '/addclassification',
  accountValidate.checkAccess,
  classificationValidate.classificationRules(),
  classificationValidate.checkClassificationData,
  utilities.handleErrors(invController.registerClassification),
);

// Route to build add inventory view
router.get(
  '/addinventory',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.buildAddInventory),
);

// Route to add a new Inventory
router.post(
  '/addinventory',
  accountValidate.checkAccess,
  inventoryValidate.inventoryRules(),
  inventoryValidate.checkInventoryData,
  utilities.handleErrors(invController.registerInventory),
);

// Route to return a JSON with inventory items with a classification
router.get(
  '/getInventory/:classification_id',
  utilities.handleErrors(invController.getInventoryJSON),
);

// Route to build inventory edit view
router.get(
  '/edit/:invId',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.buildEditInventory),
);

// Route to update inventory from edit view
router.post(
  '/updateinventory/',
  accountValidate.checkAccess,
  inventoryValidate.inventoryRules(),
  inventoryValidate.checkUpdateData,
  utilities.handleErrors(invController.updateInventory),
);

// Route to build inventory delete view
router.get(
  '/delete/:invId',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.buildDeleteInventory),
);

// Route to delete inventory from delete view
router.post(
  '/deleteinventory/',
  accountValidate.checkAccess,
  utilities.handleErrors(invController.deleteInventory),
);

module.exports = router;
