const invalidCont = {};

/* ***************************
 *  Build Sample view
 * ************************** */
invalidCont.buildSample = async function (req, res, next) {
  // it is only to raise an error
  throw {
    status: 500,
    message:
      'This error is of type 500, and it is to complete Task 3 of Weeek 3 assignment.',
  };
};

module.exports = invalidCont;
