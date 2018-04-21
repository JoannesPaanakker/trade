function setShoesize (event) {
  const button = document.getElementById("selectShoesize");
  button.addEventListener("change", setCatalogitemId);
}

function setCatalogitemId() {
  const button = document.getElementById("selectShoesize");
  const sid = button.value;
  console.log(sid);
  const shoesizeIdHTML = `<input type="hidden", name="internal_size", value=${sid}>`;
  const insert_size = document.getElementById("internal_size");
  insert_size.innerHTML = shoesizeIdHTML;
}

export { setShoesize };
