const animationJs = () => {
  const card1 =  document.getElementById("who-1");
  card1.addEventListener(('mouseout'), (event) => {
    event.currentTarget.classList.toggle("float");
  });
  const card2 =  document.getElementById("who-2");
  card2.addEventListener(('mouseout'), (event) => {
    event.currentTarget.classList.toggle("float");
  });
}

export{ animationJs};
