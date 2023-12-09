const invModel = require('../models/inventory-model');
const reviewModel = require('../models/review-model');
const utilities = require('../utilities/');

/* ***************************
 *  Deliver Add or Edit Review view
 * ************************** */
async function buildEditReview(req, res, next) {
  const inv_id = parseInt(req.params.invId);
  let nav = await utilities.getNav();
  const inv_data = await invModel.getInventoryByInvId(inv_id);
  const name = `${inv_data.inv_make} ${inv_data.inv_model}`;
  let review_data = await reviewModel.getUserInvReview(
    inv_id,
    res.locals.accountData.account_id,
  );
  // verify if there is a review; if not, it is a new one
  let user_review_comment = '';
  let user_review_grade = '';
  let user_review_id = undefined;
  if (review_data) {
    user_review_comment = review_data.user_review_comment;
    user_review_grade = review_data.user_review_grade;
    user_review_id = review_data.user_review_id;
  }
  res.render('review/edit-review', {
    title: 'Review for ' + name,
    nav,
    errors: null,
    inv_id,
    account_id: res.locals.accountData.account_id,
    user_review_comment,
    user_review_grade,
    user_review_id,
  });
}

/* ****************************************
 *  Process Review Update
 * *************************************** */
async function registerReview(req, res) {
  let nav = await utilities.getNav();
  const { user_review_id, inv_id, user_review_comment, user_review_grade } =
    req.body;

  let regResult = undefined;

  if (!user_review_id) {
    // update
    let date = new Date();
    let today_date = date.toISOString();
    regResult = await reviewModel.registerReview(
      res.locals.accountData.account_id,
      inv_id,
      user_review_comment,
      user_review_grade,
      today_date,
    );
  } else {
    // new review
    regResult = await reviewModel.updateReview(
      user_review_id,
      user_review_comment,
      user_review_grade,
    );
  }
  if (regResult) {
    res.redirect('/inv/detail/' + inv_id);
  } else {
    const inv_data = await invModel.getInventoryByInvId(inv_id);
    const name = `${inv_data.inv_make} ${inv_data.inv_model}`;
    req.flash('notice', 'Sorry, the review registration failed.');
    res.status(501).render('review/edit-review', {
      title: 'Review for ' + name,
      options,
      nav,
      errors: null,
      inv_id,
      account_id: res.locals.accountData.account_id,
      user_review_comment: review_data.user_review_comment,
      user_review_grade: review_data.user_review_grade,
    });
  }
}

module.exports = { buildEditReview, registerReview };
