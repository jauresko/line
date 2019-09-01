const display_send = document.getElementById('sender-display');
const display_buy = document.getElementById('buy-display');
const send = document.getElementById('send-path');
const list = document.getElementById('buy-path');

if (send) {
  //initsendbox()
  list.style.display = "none";
  send.style.display = "block";
  display_buy.classList.remove("border-primary")
  display_send.addEventListener("click", () => {
    display_send.classList.add("border-primary")
    display_buy.classList.remove("border-primary")
    window.setTimeout(function () {
      list.style.display = "none";
      //initsendbox()
      send.style.display = "block";
    }, 100)
  })
}

if (list) {
  display_buy.addEventListener("click", () => {
    display_send.classList.remove("border-primary")
    display_buy.classList.add("border-primary")
    window.setTimeout(function () {
      send.style.display = " none";
      list.style.display = "block";
    }, 100)
  })
}
