-- Insert Tony Stark in Account table
INSERT INTO public.account (
    account_firstname,
    account_lastname,
    account_email,
    account_password
  )
VALUES (
    'Tony',
    'Stark',
    'tony@starkent.com',
    'Iam1ronM@n'
  );
-- Alter Tony Stark account type to Admin in table account
UPDATE public.account
SET account_type = 'Admin'
WHERE account_id = 1;
-- Delete Tony Stark record from table account
DELETE FROM public.account
WHERE account_id = 1;
-- Modify GM Hummer record in inventory
UPDATE public.inventory
SET inv_description = REPLACE(
    inv_description,
    'the small interiors',
    'a huge interior'
  )
WHERE inv_id = 10;
-- Select using inner join with inventory and classification
SELECT inv_make,
  inv_model,
  classification_name
FROM public.inventory i
  INNER JOIN public.classification c ON c.classification_id = i.classification_id
  AND c.classification_name = 'Sport';
-- Update all records in inventory adding /vehicles in inv_image and inv_thumbnail
UPDATE public.inventory
SET inv_image = REPLACE(
    inv_image,
    'images/',
    'images/vehicles/'
  ),
  inv_thumbnail = REPLACE(
    inv_thumbnail,
    'images/',
    'images/vehicles/'
  );