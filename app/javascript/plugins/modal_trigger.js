const modal1 = document.getElementById("modal1");
const btnSignup = document.getElementById("btn-signup");
const span = document.querySelector('.close');

if (btnSignup) {
  btnSignup.addEventListener('click', () => {
    modal1.style.display = "block";
  })

  span.addEventListener('click', () => {
    modal1.style.display = "none";
  })

  window.addEventListener( 'click', () => {
    if (event.target === modal1) {
      modal1.style.display = "none";
    }
  })
}




const modal2 = document.getElementById("modal2");
const btnLogin = document.getElementById("btn-login");
const span2 = document.querySelector('.close2');

if (btnLogin) {
  btnLogin.addEventListener('click', () => {
    modal2.style.display = "block";
  })

  span2.addEventListener('click', () => {
    modal2.style.display = "none";
  })

  window.addEventListener( 'click', () => {
    if (event.target === modal2) {
      modal2.style.display = "none";
    }
  })

}
