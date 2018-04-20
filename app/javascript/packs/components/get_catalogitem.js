function getCatalogitem (event) {
  const button = document.getElementById("selectCatalogitem");
  button.addEventListener("change", setCatalogitemId);
}

function setCatalogitemId() {
  const button = document.getElementById("selectCatalogitem");
  const cid = button.value;
  console.log(cid);
  const catalogitemIdHTML = `<input type="hidden", name = "catalogitem_id", value=${cid}>`;
  const insert_id = document.getElementById("catalogitem_id");
  insert_id.innerHTML = catalogitemIdHTML;
}

export { getCatalogitem };
