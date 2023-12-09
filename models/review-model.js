const pool = require('../database/');

/* ***************************
 *  Get all reviews by inv_id
 * ************************** */
async function getReviewByInvId(inv_id) {
  try {
    const data = await pool.query(
      `SELECT * FROM public.user_review
      WHERE inv_id = $1`,
      [inv_id],
    );
    return data.rows;
  } catch (error) {
    console.error('getReviewByInvId error ' + error);
  }
}

/* ***************************
 *  Get review by inv_id and account_id
 * ************************** */
async function getUserInvReview(inv_id, account_id) {
  try {
    const data = await pool.query(
      `SELECT * FROM public.user_review
      WHERE inv_id = $1 AND account_id = $2`,
      [inv_id, account_id],
    );
    return data.rows[0];
  } catch (error) {
    console.error('getUserInvReview error ' + error);
  }
}

/* *****************************
 *   Register new user review
 * *************************** */
async function registerReview(
  account_id,
  inv_id,
  user_review_comment,
  user_review_grade,
  user_review_date,
) {
  try {
    const sql =
      'INSERT INTO user_review (account_id, inv_id,         user_review_comment, user_review_grade, user_review_date) VALUES ($1, $2, $3, $4, $5) RETURNING *';
    return await pool.query(sql, [
      account_id,
      inv_id,
      user_review_comment,
      user_review_grade,
      user_review_date,
    ]);
  } catch (error) {
    return error.message;
  }
}

/* *****************************
 *   Update user review
 * *************************** */
async function updateReview(
  user_review_id,
  user_review_comment,
  user_review_grade,
) {
  try {
    const sql =
      'UPDATE user_review SET user_review_comment = $1, user_review_grade = $2 WHERE user_review_id = $3 RETURNING *';
    return await pool.query(sql, [
      user_review_comment,
      user_review_grade,
      user_review_id,
    ]);
  } catch (error) {
    return error.message;
  }
}

module.exports = {
  getReviewByInvId,
  getUserInvReview,
  registerReview,
  updateReview,
};
