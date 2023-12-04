const basic_form = document.querySelector('#basicForm');
basic_form.addEventListener('change', function () {
  const updateBasicBtn = document.querySelector('#basic-button');
  updateBasicBtn.removeAttribute('disabled');
});

const passwd_form = document.querySelector('#passwdForm');
passwd_form.addEventListener('change', function () {
  const updatePasswdBtn = document.querySelector('#passwd-button');
  updatePasswdBtn.removeAttribute('disabled');
});
