// Needed Resources
const express = require('express');
const router = new express.Router();
const invController = require('../controllers/invController');
const utilities = require('../utilities/');
const classificationValidate = require('../utilities/classification-validation');
const inventoryValidate = require('../utilities/inventory-validation');

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
router.get('/', utilities.handleErrors(invController.buildManagement));

// Route to build add classification view
router.get(
  '/addclassification',
  utilities.handleErrors(invController.buildAddClassification),
);

// Route to add a new Classification
router.post(
  '/addclassification',
  classificationValidate.classificationRules(),
  classificationValidate.checkClassificationData,
  utilities.handleErrors(invController.registerClassification),
);

// Route to build add inventory view
router.get(
  '/addinventory',
  utilities.handleErrors(invController.buildAddInventory),
);

// Route to add a new Inventory
router.post(
  '/addinventory',
  inventoryValidate.inventoryRules(),
  inventoryValidate.checkInventoryData,
  utilities.handleErrors(invController.registerInventory),
);

module.exports = router;
